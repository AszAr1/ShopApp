import { useUser } from "../../stores/user";
import NotLogin from "../AuthorizationPage/NotLogin";

function OrderPage() {
    const isLoggin = useUser((state) => state.login);

    return isLoggin ? <div>Hello</div> : <NotLogin />;
}

export default OrderPage;
