import React, { useState } from 'react'
import SettingsPanel from '../SettingsPanel/SettingsPanel';
import { $apiImage } from '../../api';
import { UseUser } from '../../stores/UseUser';
import PhonePanelNavMenu from '../PhonePanelNavMenu/PhonePanelNavMenu';

function ProfilePanel() {
    const user = UseUser((state) => state.user);

    const [username, setUsernmae] = useState<string>("");
    const [file, setFile] = useState<File | null>(null);

    const getImage = (e: React.ChangeEvent<HTMLInputElement>) => {
        const selectedFile = e.target.files?.[0];
        setFile(selectedFile || null);
    };

    const HandleUpdateInfo = async () => {
        try {
            if (!file) {
                console.error("No file selected.");
                return;
            }
            const userName = localStorage.getItem('username')

            const formData = new FormData();
            formData.append("profile_picture", file);
            formData.append("username", username);
            const response = await $apiImage.patch(`profile/${userName}/`, formData)
            const responseImage = await $apiImage.patch(`profile/${user.username}/`, formData);

            console.log("Name was updated", response.data);
            console.log("Image uploaded successfully:", responseImage.data);
        } catch (error) {
            console.log(error)
        }
    }

    return (
        <>
            <div className="flex flex-row h-screen w-screen justify-start items-center">
                <SettingsPanel />
                <div className="laptop:grid-cols-2 laptop:grid-rows-2 laptop:gap-4 laptop:p-10 grid h-full w-full grid-cols-1 gap-4 p-2">

                    <div className="laptop:p-10 flex items-center justify-center rounded-md border-2 border-solid border-black p-2 shadow-xl">
                        <div className="flex flex-col items-center justify-center">
                            <div className="relative h-[200px] w-[200px] overflow-hidden rounded-full border-2 border-solid border-black">
                                <img
                                    className="absolute"
                                    src={`${user.image}`}
                                />
                            </div>
                            <h1 className="font-mono">Name: {user.username}</h1>
                            <h1 className="font-mono">Email: {user.email}</h1>
                        </div>
                    </div>

                    <div className="laptop:p-10 flex flex-col items-center justify-center rounded-md border-2 border-solid border-black p-2 shadow-xl">
                        <div className="flex flex-row items-center justify-center">
                            <div className="flex flex-col items-center justify-center">
                                <h1 className="font-mono">Change name</h1>
                                <input
                                    className="mb-3 border-b-2 border-solid border-black p-2 outline-none"
                                    placeholder="New name"
                                    value={username}
                                    onChange={e => setUsernmae(e.target.value)}
                                />
                            </div>

                            <input
                                id="modal_input"
                                onChange={(e) => getImage(e)}
                                type="file"
                                accept="image/*"
                                className={`ml-10 laptop:w-1/2 mt-4 w-1/3
                                 rounded-md border-2 border-dashed border-black p-3 font-mono font-bold
                                 file:hidden hover:bg-white hover:text-black`}
                            />
                        </div>

                        <button
                            onClick={HandleUpdateInfo}
                            className="mt-5 border-2 border-solid border-black bg-black
                    p-2 font-mono font-semibold text-white transition duration-300 hover:bg-white hover:text-black"
                        >
                            Change info
                        </button>
                    </div>

                    <div className="laptop:col-span-2 laptop:p-10 flex items-center justify-center rounded-md border-2 border-solid border-black p-2 shadow-xl">
                        <div className="laptop:items-start flex flex-col items-center justify-center">
                            <h1>Change name</h1>
                            <input
                                type="text"
                                value={username}
                                onChange={e => setUsernmae(e.target.value)}
                                className="p-2 outline-none "
                                placeholder="New name"
                            />
                            {/* <button onClick={HandleUpdateName}>Change name</button> */}
                        </div>
                    </div>

                    <PhonePanelNavMenu/>

                </div>
            </div>
        </>
    );
}

export default ProfilePanel