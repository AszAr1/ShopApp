import { useState } from "react";
import { $apiUpdateInfo } from "../../api";

function ChangeSecureDataForm() {

    const [email, setEmail] = useState<string>("");
    const [password, setPassword] = useState<string>("");

    const HandleUpdateSecureData = async () => {
        try {
            const username = localStorage.getItem('username')
            const formData = new FormData();
            formData.append("email", email);
            formData.append("password", password);
            const response = await $apiUpdateInfo.patch(`profile/${username}/`, formData);

            console.log("Secure was uploaded", response.data);
        } catch (error) {
            console.log(error)
        }
    }


    return (
        <div className="laptop:items-center w-full h-full flex flex-col items-center justify-center border-2 border-solid rounded-md border-black p-3">
            <form>
                <div>
                    <h1>Change email</h1>
                    <input
                        type="text"
                        value={email}
                        onChange={e => setEmail(e.target.value)}
                        className="p-2 outline-none border-b-2 border-solid border-black"
                        placeholder="New name"
                    />
                </div>
                <div className='mt-3'>
                    <h1 >Change password</h1>
                    <input
                        type='password'
                        value={password}
                        onChange={e => setPassword(e.target.value)}
                        className='p-2 outline-none border-b-2 border-solid border-black'
                        placeholder='New password'
                    />
                </div>
                <button
                    onClick={HandleUpdateSecureData}
                    className="mt-5 border-2 border-solid border-black bg-black
                                    p-2 font-mono font-semibold text-white transition duration-300 hover:bg-white hover:text-black"
                >Change secure data</button>
            </form>
        </div>
    )
}

export default ChangeSecureDataForm