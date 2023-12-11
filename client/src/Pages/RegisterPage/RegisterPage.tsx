import { useNavigate } from 'react-router-dom';
import Form from '../../components/Form/Form'
import { UseUser } from '../../stores/UseUser';
import { useState } from 'react';
import { AuthService } from '../../services/auth.service';
import { Notification } from '../../components/Notification/Notification';

function RegisterPage() {

    const navigate = useNavigate();
    const loginUser = UseUser((state) => state.loginUser);
    const login = UseUser((state) => state.login);
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
            <div className={`flex h-full w-full items-center justify-center`}>
                <img
                    src="https://img.setka.io/clients/ERswQaPUWaeWgjb6hekcAkZGgz6Intd3/post_images/rednike-2022102719380146.jpg"
                    className=" desktop:flex relative hidden h-screen w-full"
                    alt="image"
                />

                <img
                    src={`https://oboi.ringtonz.ru/uploads/posts/2020-04/1585991149_krossovki_nogi_obuv_podsvetka_116317_1440x2560.jpg`}
                    alt={"image"}
                    className={`desktop:hidden flex`}
                />
                <div
                    className={`absolute flex flex-col items-center justify-center rounded-md
                    bg-white p-10`}
                >
                    <Form
                        loginPage={false}
                        handleClick={handleClickRegister}
                        title="Registration"
                        underText={`Already have an account?`}
                        underText2="Log in"
                        link={"login"}
                    />
                </div>
            </div>
        </>
    )
}

export default RegisterPage