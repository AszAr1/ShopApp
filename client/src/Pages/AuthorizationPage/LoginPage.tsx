import Form from "../../components/UI/Form";
import AuthService from "../../service/AuthService";
import { useUser } from "../../stores/user";
import { useNavigate } from "react-router-dom";
import { HiExclamation, HiX } from 'react-icons/hi';
import { useState } from "react";
import { Notification } from "../../components/Notification/Notification";
const LoginPage = () => {
    const login = useUser((state) => state.loginUser);
    const navigate = useNavigate();
    const loginService = AuthService.login;
    const [showToast, setShowToast] = useState(false);

    const handleClickLogin = async (
        name: string,
        email: string,
        password: string,
    ) => {
        try {
            const data = await loginService(name, password);
            if (data) {
                login(data.data.user);
                navigate("/");
            }
        } catch (error) {
            setShowToast(true);
        }

    };

    return (
        <>
            {showToast && (
                <Notification 
                negativeDescription="Auth failed. Please check your password or username." 
                setShowToast={setShowToast}
                />
            )}
            <Form
                loginPage={true}
                title="Login"
                handleClick={handleClickLogin}
                underText={`Dont't have an account?`}
                underText2="Register"
                link={"register"}
            />

        </>
    );
};

export default LoginPage;
