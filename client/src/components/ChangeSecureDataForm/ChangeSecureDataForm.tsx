import { useState } from "react";
import { $apiUpdateInfo } from "../../api";
import { UseUser } from "../../stores/UseUser";
import { Notification } from "../Notification/Notification";

function ChangeSecureDataForm() {
  const [email, setEmail] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const userEmail = UseUser((state) => state.user.email);
  const [showToast, setShowToast] = useState(false);
  const [done, setDone] = useState(false);

  const HandleUpdateSecureData = async () => {
    try {
      const username = localStorage.getItem("username");
      const formData = new FormData();
      if (email === "") {
        setEmail(String(userEmail));
      }
      formData.append("email", email);
      formData.append("password", password);
      await $apiUpdateInfo.patch(`profile/${username}/`, formData);
    } catch (error) {
      setDone(false);
      setShowToast(true);
    }
  };

  return (
    <>
      {showToast && (
        <Notification
          negativeDescription="Something want bad."
          positiveDescription="successfully ˆ_ˆ"
          setShowToast={setShowToast}
          done={done}
        />
      )}
      <div className="laptop:items-center w-full h-full flex flex-col items-center justify-center border-2 border-solid rounded-md border-black p-3">
        <form>
          <div>
            <h1>Change email</h1>
            <input
              type="text"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              className="p-2 outline-none border-b-2 border-solid border-black"
              placeholder="New email"
            />
          </div>
          <div className="mt-3">
            <h1>Change password</h1>
            <input
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              className="p-2 outline-none border-b-2 border-solid border-black"
              placeholder="New password"
            />
          </div>
          <button
            onClick={HandleUpdateSecureData}
            className="mt-5 border-2 border-solid border-black bg-black
                                    p-2 font-mono font-semibold text-white transition duration-300 hover:bg-white hover:text-black"
          >
            Change secure data
          </button>
        </form>
      </div>
    </>
  );
}

export default ChangeSecureDataForm;
