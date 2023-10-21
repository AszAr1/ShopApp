import React, { useState } from 'react';
import Home from "./Pages/HomePage/Home";
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';

import SneakersPage from "./Pages/SneakersPage/SneakersPage";
import HoodiesPage from "./Pages/HoodiesPage/HoodiesPage"
import SneakerProductPage from "./Pages/ProductPage/SneakerProductPage";
import HoodieProductPage from "./Pages/ProductPage/HoodieProductPage";
import OrderPage from "./Pages/OrderPage/OrderPage"
import FavoritesPage from './Pages/FavoritesPage/FavoritesPage';
import ProfilePage from './Pages/ProfilePage/ProfilePage'
import LoginPage from './Pages/AuthorizationPage/LoginPage';
import RegistaerPage from './Pages/AuthorizationPage/RegistaerPage';


function App() {

  const [isLogged, setIsLogged] = useState(true)

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
        <Route path="/hoodie/:productId" element={<HoodieProductPage />} />
        <Route path="/hoodie/" element={<HoodiesPage />} />

                //FavoritesPage
        <Route path="/favorites/" element={<FavoritesPage />} />

        //ProfilePage
        <Route path="/profile" element={<ProfilePage />} />

        //RegisterPage
        <Route path='/register' element={<RegistaerPage />} />

        //LoginPage
        {/*@ts-ignore */}
        <Route path='/login' element={<LoginPage />} />

        //CartPage
        {/* <Route path='/cart' element={<CartPage />} /> */}
      </Routes>
    </>
  );
}

export default App;
