import React from "react";
import Form from "../../components/UI/Form";
import { useUser } from "../../stores/user";
import { useNavigate } from "react-router-dom";
import AuthService from "../../service/AuthService";

const RegistaerPage = () => {
    const navigate = useNavigate();
    const loginUser = useUser((state) => state.loginUser);
    const login = useUser((state) => state.login);

    const handleClickRegister = async (
        name: string,
        email: string,
        password: string,
    ) => {
        try {
            const response = await AuthService.register(name, email, password);
            localStorage.setItem("token", response.data.access);
            loginUser(response.data.user);
            navigate("/");
        } catch (error) {
            console.error("Registration click error:", error);
        }
    };

    if (login) {
        setTimeout(() => navigate("/"), 1000);
    }

    return (
        <div>
            <Form
                loginPage={false}
                handleClick={handleClickRegister}
                title="Registration"
                underText={`Already have an account?`}
                underText2="Log in"
                link={"login"}
            />
        </div>
    );
};

export default RegistaerPage;
