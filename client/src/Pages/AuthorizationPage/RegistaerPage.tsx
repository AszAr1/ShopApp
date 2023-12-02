import React, { useState } from "react";
import Form from "../../components/UI/Form";
import { useUser } from "../../stores/user";
import { useNavigate } from "react-router-dom";
import AuthService from "../../service/AuthService";
import { Notification } from "../../components/Notification/Notification";

const RegistaerPage = () => {
    const navigate = useNavigate();
    const loginUser = useUser((state) => state.loginUser);
    const login = useUser((state) => state.login);
    const [showToast, setShowToast] = useState(false);
    const [done, setDone] = useState(false)

    const handleClickRegister = async (
        name: string,
        email: string,
        password: string,
    ) => {
        try {
            const response = await AuthService.register(name, email, password);
            loginUser(response.data.user);
            setDone(true);
            setShowToast(true);
        } catch (error) {
            console.error("Registration click error:", error);
            setDone(false)
            setShowToast(true);
        }
    };

    if (login) {
        setTimeout(() => navigate("/"), 1000);
    }

    return (
        <>
            {showToast && (
                <Notification
                 done={done}
                 negativeDescription="Registration failed. Please check your password, username or email."
                 positiveDescription="Register successfully ˆ_ˆ" 
                 setShowToast={setShowToast} 
                />
            )}
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
        </>
    );
};

export default RegistaerPage;
