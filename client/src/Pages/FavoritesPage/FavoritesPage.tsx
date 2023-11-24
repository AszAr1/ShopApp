import { useUser } from "../../stores/user";
import { Favorites } from "../../components/Favorites/Favorites";
import NotLogin from "../AuthorizationPage/NotLogin";
import { useFavorite } from "../../stores/favorite";
import {useEffect, useState} from "react";
import {ProductsProps} from "../../models/products";
import {FavoritesService} from "../../service/FavoritesService";

function FavoritesPage() {

    const authorization:boolean = useUser((state) => state.login);
    // const setFavorites = useFavorite(state => state.setFavorite);
    // const favorites: ProductsProps[] = useFavorite((state) => state.favorites);
    // const isLoading: boolean = useFavorite((state) => state.loading);
    // const {clearFavorites} = useFavorite()
    const [favorites, setFavorites] = useState<ProductsProps[] | []>([])
    const isLoading = false
    useEffect(() => {
            try {
               FavoritesService.getFavorites().then(data => {
                   console.log(data.data)
                   setFavorites(data.data)
               })
            } catch (err) {
                console.error(err);
            }
    }, []);
    
    return authorization ? <Favorites favorites={favorites} isLoading={isLoading} /> : <NotLogin/>;
}

export default FavoritesPage;
