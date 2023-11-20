import { useUser } from "../../stores/user";
import { Favorites } from "../../components/Favorites/Favorites";
import NotLogin from "../AuthorizationPage/NotLogin";
import { useFavorite } from "../../stores/favorite";
import { useEffect } from "react";
import { FavoritesService } from "../../service/FavoritesService";

function FavoritesPage() {
    const authorization = useUser((state) => state.login);
    const setFavorites = useFavorite(state => state.setFavorite)

    useEffect(() => {
        FavoritesService.getFavorites().then((response) => {
            console.log(response.data)
            setFavorites(response.data)
        });
    }, []);

    return authorization ? <Favorites /> : <NotLogin />;
}

export default FavoritesPage;
