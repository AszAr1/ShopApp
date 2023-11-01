import { useAuthorization } from "../../stores/authorization"
import NotLogin from "../AuthorizationPage/NotLogin"


function OrderPage () {

    const isLoggin = useAuthorization(state => state.login)

    return isLoggin
     ? 
        <div>Hello</div>
     :
        <NotLogin/>
}

export default OrderPage