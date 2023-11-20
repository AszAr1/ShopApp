import Form from "../../components/UI/Form";
import AuthService from "../../service/AuthService";
import { useUser } from "../../stores/user";
import { useNavigate } from "react-router-dom";
const LoginPage = () => {
    const login = useUser((state) => state.loginUser);
    const navigate = useNavigate();
    const loginService = AuthService.login;

    const handleClickLogin = async (
        name: string,
        email: string,
        password: string,
    ) => {
        const data = await loginService(name, password);

        if (data) {
            localStorage.setItem("token", data.data.access);
            localStorage.setItem("refreshToken", data.data.refresh);
            localStorage.setItem("username", data.data.user.username);
            login(data.data.user);
            navigate("/");
            console.log(localStorage.getItem("token"));
            console.log(localStorage.getItem("refreshToken"));
        }
    };

    return (
        <Form
            loginPage={true}
            title="Login"
            handleClick={handleClickLogin}
            underText={`Dont't have an account?`}
            underText2="Register"
            link={"register"}
        />
    );
};

export default LoginPage;
