import React, { FC } from "react";

interface ModalProps {
    children?: React.ReactNode;
    isOpen: boolean;
    openFunc: () => void;
}
const Modal: FC<ModalProps> = (props) => {
    return (
        <div
            className={`${
                props.isOpen ? "absolute" : "hidden"
            } flex h-full w-full items-center justify-center`}
        >
            <div
                className={`z-10 flex h-3/5 w-3/5 flex-col items-center justify-center rounded-xl
                border-2 border-solid border-black bg-white p-10
            `}
            >
                <h1 className={`font-mono text-2xl font-bold`}>
                    Set ur new image
                </h1>
                <button
                    className={`mt-4 rounded-md border-2 border-solid border-black bg-black p-3 font-mono font-bold text-white
                        transition-all duration-300 hover:bg-white hover:text-black
                    `}
                >
                    Select image
                </button>
            </div>
            <button
                className={`${
                    props.isOpen ? "absolute" : "hidden"
                } z-1 flex h-full w-full cursor-default items-center justify-center bg-black opacity-20`}
                onClick={props.openFunc}
            />
        </div>
    );
};

export default Modal;
