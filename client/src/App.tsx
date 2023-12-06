import { useEffect } from "react";
import Home from "./Pages/HomePage/Home";
import { BrowserRouter as Router, Routes, Route, Navigate, Outlet } from "react-router-dom";

import SneakersPage from "./Pages/SneakersPage/SneakersPage";
import HoodiesPage from "./Pages/HoodiesPage/HoodiesPage";
import SneakerProductPage from "./Pages/ProductPage/SneakerProductPage";
import HoodieProductPage from "./Pages/ProductPage/HoodieProductPage";
import OrderPage from "./Pages/OrderPage/OrderPage";
import FavoritesPage from "./Pages/FavoritesPage/FavoritesPage";
import ProfilePage from "./Pages/ProfilePage/ProfilePage";
import LoginPage from "./Pages/AuthorizationPage/LoginPage";
import RegistaerPage from "./Pages/AuthorizationPage/RegistaerPage";
import AuthService from "./service/AuthService";
import { useUser } from "./stores/user";
import CartPage from "./Pages/CartPage/CartPage";
import { Successfully } from "./Pages/Successfully/Successfully";
import { useOrder } from "./stores/order";
import { ProtectedRoute } from "./guards/CheckAuthRoute";
import CartPanel from "./components/ProfilePage/CartPanel";
import OrderPanel from "./components/ProfilePage/OrderPanel";
import ProfilePanel from "./components/ProfilePage/ProfilePanel/ProfilePanel";


function App() {
    const loginUser = useUser((state) => state.loginUser);
    const logOutUser = useUser((state) => state.logout);
    const isLogged = useUser((state) => state.login);
    const getOrders = useOrder(state => state.setOrder);

    const checkAuth = async () => {
        const token = localStorage.getItem('token');
        if (token) {
            await AuthService.getProfile(
                localStorage.getItem("username"),
            )
                .then(response => {
                    if (response.status === 401) {
                        logOutUser()
                    } else {
                        loginUser(response.data)
                        getOrders()
                    }
                })
                .catch(error => { logOutUser(); console.log(error) })
        }
    };

    useEffect(() => {
        checkAuth();
    }, []);

    return (
        <>
            <Routes>
                {/*@ts-ignore */}
                //Main Pages
                <Route path="/" element={<Home isLogged={isLogged} />} />
                <Route path="/order" element={<OrderPage />} />
                //Sneakers Pages
                <Route path="/products/:id" element={<SneakerProductPage />} />
                <Route path="/sneakers/" element={<SneakersPage />} />
                //Hoodie Pages
                <Route
                    path="/hoodie/:productId"
                    element={<HoodieProductPage />}
                />
                <Route path="hoodie" element={<HoodiesPage />} />
                <Route element={< ProtectedRoute/>}>
                    //FavoritesPage
                    <Route path="favorites" element={<FavoritesPage />} />
                    //ProfilePage
                    <Route path="profile" element={<ProfilePage />}/> 
                    <Route path='/profile/order-panel' element={<OrderPanel />} />
                    <Route path='/profile/profile-panel' element={<ProfilePanel />}/>
                    <Route path='/profile/cart-panel' element={<CartPanel />} /> 
                    //CartPage
                    <Route path='/cart' element={<CartPage />} />
                    <Route path="/successfully" element={<Successfully />} />
                </Route>
                //LoginPage
                <Route path="/login" element={<LoginPage />} />
                //RegisterPage
                <Route path="/register" element={<RegistaerPage />} />
            </Routes>
        </>
    );
}

export default App;
