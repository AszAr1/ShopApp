import { useState } from "react";
import { UseUser } from "../../stores/UseUser";
import { useNavigate } from "react-router-dom";
import Form from "../../components/Form/Form";
import { AuthService } from "../../services/auth.service";
import { Notification } from "../../components/Notification/Notification";

function LoginPage() {
  const login = UseUser((state) => state.loginUser);
  const navigate = useNavigate();
  const [showToast, setShowToast] = useState(false);
  const [done, setDone] = useState(false);

  const handleClickLogin = async (
    name: string,
    email: string,
    password: string
  ) => {
    try {
      await AuthService.login(name, password)
        .then((data) => {
          login(data.data.user);
          navigate("/");
        })
        .catch((error) => {
          console.log(error);
          setDone(false);
          setShowToast(true)
        });
    } catch (error) {
        console.log(error)
    }
  };
  return (
    <>
      {showToast && (
        <Notification
          done={done}
          negativeDescription="Auth failed. Please check your password or username."
          positiveDescription="successfully ˆ_ˆ"
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
            loginPage={true}
            title="Login"
            handleClick={handleClickLogin}
            underText={`Dont't have an account?`}
            underText2="Register"
            link={"register"}
          />
        </div>
      </div>
    </>
  );
}

export default LoginPage;
