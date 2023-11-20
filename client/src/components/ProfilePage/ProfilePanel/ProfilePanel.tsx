import { useUser } from "../../../stores/user";
import { useState } from "react";
import Modal from "../../UI/Modal";
const Profile = () => {
    const user = useUser((state) => state.user);
    const [open, setOpen] = useState(false);

    function handleOpenModal() {
        setOpen((prev) => !prev);
    }
    return (
        <>
            <div className="laptop:grid-cols-2 laptop:grid-rows-2 laptop:gap-4 laptop:p-10 grid h-full w-full grid-cols-1 gap-4 p-2">
                <div className="laptop:p-10 flex items-center justify-center rounded-md border-2 border-solid border-black p-2 shadow-xl">
                    <div className="flex flex-col items-center justify-center">
                        <div className="relative h-[200px] w-[200px] overflow-hidden rounded-full border-2 border-solid border-black">
                            <img
                                className="absolute"
                                src="https://images.unsplash.com/photo-1618641986557-1ecd230959aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"
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
                            />
                        </div>

                        <button
                            className="laptop:p-20 ml-5 h-full w-full rounded-md border-2 border-dashed border-black p-2 font-mono"
                            onClick={handleOpenModal}
                        >
                            Set image
                        </button>
                    </div>

                    <button
                        className="mt-5 border-2 border-solid border-black bg-black
                    p-2 font-mono font-semibold text-white transition duration-300 hover:bg-white hover:text-black
                  "
                    >
                        Change info
                    </button>
                </div>

                <div className="laptop:col-span-2 laptop:p-10 flex items-center justify-center rounded-md border-2 border-solid border-black p-2 shadow-xl">
                    <div className="laptop:items-start flex flex-col items-center justify-center">
                        <h1>Change name</h1>
                        <input
                            className="p-2 outline-none "
                            placeholder="New name"
                        />
                    </div>
                </div>
            </div>
            <Modal isOpen={open} openFunc={handleOpenModal} />
        </>
    );
};
export default Profile;
