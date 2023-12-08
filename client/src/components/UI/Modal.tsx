import React, { FC, useState } from "react";
import { $api } from "../../API";
import { useUser } from "../../stores/user";

interface ModalProps {
    children?: React.ReactNode;
    isOpen: boolean;
    openFunc: () => void;
}

const Modal: FC<ModalProps> = (props) => {
    const [file, setFile] = useState<File | null>(null);
    const user = useUser((state) => state.user);

    const handleImageUpload = (e: React.ChangeEvent<HTMLInputElement>) => {
        const selectedFile = e.target.files?.[0];
        setFile(selectedFile || null);
    };

    const handleUpload = async () => {
        try {
            if (!file) {
                console.error("No file selected.");
                return;
            }

            const formData = new FormData();
            formData.append("profile_picture", file);

            const response = await $api.patch(`profile/${user.username}`, user);

            console.log("File uploaded successfully:", response.data);
        } catch (error) {
            console.error("Error uploading file:", error);
        }
    };

    return (
        <dialog
            className={`${
                props.isOpen ? "absolute" : "hidden"
            } flex h-full w-full items-center justify-center`}
        >
            <div
                className={`z-10 flex h-3/5 w-3/5 flex-col items-center justify-center rounded-xl
                border-2 border-solid border-black bg-white p-10`}
            >
                <h1 className={`font-mono text-2xl font-bold`}>
                    Set ur new image
                </h1>
                <input
                    id="modal_input"
                    onChange={(e) => handleImageUpload(e)}
                    type="file"
                    accept="image/*"
                    multiple={false}
                    className={`laptop:w-1/3 mt-4 w-2/3 rounded-md border-2 border-solid border-black bg-black p-3 font-mono font-bold text-white
                        transition-all duration-300 file:hidden hover:bg-white hover:text-black`}
                />
                <button
                    onClick={() => handleUpload()}
                    className={`mt-4 rounded-md border-2 border-solid border-black bg-black p-3 font-mono font-bold text-white
                    transition-all duration-300 hover:bg-white hover:text-black`}
                >
                    Update image
                </button>
            </div>
            <button
                className={`${
                    props.isOpen ? "absolute" : "hidden"
                } z-1 flex h-full w-full
                     cursor-default items-center justify-center bg-black opacity-20`}
                onClick={props.openFunc}
            />
        </dialog>
    );
};

export default Modal;
