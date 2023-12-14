import { useState } from 'react'
import { $apiUpdateInfo } from '../../api';

function ChangeNameImgForm() {

    const username = localStorage.getItem('username');
    const [newUsername, setNewUsername] = useState<string>(String(username));
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

            const formData = new FormData();
            formData.append("profile_picture", file);
            formData.append("username", newUsername);
            await $apiUpdateInfo.patch(`profile/${username}/`, formData)
            
        } catch (error) {
            console.log(error)
        }
    }

    return (
        <div className="laptop:p-10 flex flex-col items-center justify-center rounded-md border-2 border-solid border-black p-2 shadow-xl">
            <div className="flex flex-row items-center justify-center">
                <div className="flex flex-col items-center justify-center">
                    <h1 className="font-mono">Change name</h1>
                    <input
                        className="mb-3 border-b-2 border-solid border-black p-2 outline-none"
                        placeholder="New name"
                        value={newUsername}
                        onChange={e => setNewUsername(e.target.value)}
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
    )
}

export default ChangeNameImgForm