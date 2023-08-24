import { useAuthorization } from "../../stores/authorization";
import { Favorites } from "../../components/Favorites/Favorites";
import NotLogin from "../AuthorizationPage/NotLogin";

function FavoritesPage() {

  const authorization = useAuthorization(state => state.login)

  return authorization ? (
    <Favorites/>
  ) : (
    <NotLogin/> 
  )

}

export default FavoritesPage
