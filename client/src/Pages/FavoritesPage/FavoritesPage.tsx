import { useUser } from "../../stores/user";
import { Favorites } from "../../components/Favorites/Favorites";
import NotLogin from "../AuthorizationPage/NotLogin";
import {useEffect, useState} from "react";
import {ProductsProps} from "../../models/productsProps";
import {FavoritesService} from "../../service/FavoritesService";

function FavoritesPage() {

    const authorization:boolean = useUser((state) => state.login);
    const [favorites, setFavorites] = useState<ProductsProps[] | []>([])
    const [isLoading, setIsLoading] = useState<boolean>(true);
    useEffect(() => {
            try {
               FavoritesService.getFavorites()
               .then(data => {
                   //@ts-ignore
                   setFavorites(data.data)
                   setIsLoading(false);
               }).catch(e => console.log(e))
            } catch (err) {
                console.log(err);
            }
            return () => {
               setFavorites([])
            };
    }, []);
    
    return authorization ? <Favorites favorites={favorites} isLoading={isLoading} /> : <NotLogin/>;
}

export default FavoritesPage;
