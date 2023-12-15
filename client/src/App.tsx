import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import './App.css'
import HomePage from './pages/HomePage/Home';
import OneProductPage from "./pages/OneProductPage/OneProductPage";
import SneakersProductsPage from "./pages/SneakersProductsPage/SneakersProductsPage";
import HoodiesProductsPage from "./pages/HoodiesProductsPage/HoodiesProductsPage";
import RegisterPage from "./pages/RegisterPage/RegisterPage";
import LoginPage from "./pages/LoginPage/LoginPage";
import ProtectedAuthRoute from "./guards/ProtectedAuthRoute";
import OrdersPage from "./pages/OrdersPage/OrdersPage";
import { UseUser } from "./stores/UseUser";
import { AuthService } from "./services/auth.service";
import { useEffect } from "react";
import FavoritesPage from "./pages/FavoritesPage/FavoritesPage";
import CartPage from "./pages/CartPage/CartPage";
import SuccessfullyPage from "./pages/SuccessfullyPage/SuccessfullyPage";
import OrderPanel from "./components/OrderPanel/OrderPanel";
import CartPanel from "./components/CartPanel/CartPanel";
import ProfilePanel from "./components/ProfilePanel/ProfilePanel";

function App() {

  const loginUser = UseUser((state) => state.loginUser);
  const logOutUser = UseUser((state) => state.logout);

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
        //MainPage
        <Route path='/' element={<HomePage />} />
        //ProductPage
        <Route path='/products/:id' element={<OneProductPage />} />
        //Sneakers Products Page
        <Route path="/sneakers" element={<SneakersProductsPage />} />
        //Hoodies Products Page
        <Route path="/hoodies" element={<HoodiesProductsPage />} />
        //RegisterPage
        <Route path="/register" element={<RegisterPage />} />
        //LoginPage
        <Route path="/login" element={<LoginPage />} />
        //Protected Routes
        <Route element={<ProtectedAuthRoute />}>
          <Route path="/orders" element={<OrdersPage />} />
          //FavoritesPage
          <Route path="favorites" element={<FavoritesPage />} />
          //ProfilePage
          <Route path='/profile/order-panel' element={<OrderPanel />} />
          <Route path='/profile/profile-panel' element={<ProfilePanel />} />
          <Route path='/profile/cart-panel' element={<CartPanel />} />
          //CartPage
          <Route path='/cart' element={<CartPage />} />
          <Route path="/successfully" element={<SuccessfullyPage />} />
        </Route>

      </Routes>
    </>
  )
}

export default App
