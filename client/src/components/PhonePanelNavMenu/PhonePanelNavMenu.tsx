import { useState } from "react";
import { useNavigate } from "react-router-dom";

function PhonePanelNavMenu() {

    const [openModal, setOpenModal] = useState<boolean>(false);
    const nav = useNavigate()

    function HandleClick(e: React.MouseEvent<HTMLButtonElement>) {
        e.preventDefault();
        setOpenModal(prev => !prev);
    }

    function HandleRedirect(component: string) {
        nav(`/profile/${component}`)
        setOpenModal(false);
    }

    return (
        <>
            <button
                onClick={e => HandleClick(e)}
                className="laptop:hidden flex justify-center items-center w-full bg-black text-white rounded-md px-4 py-3">
                (◕‿◕)
            </button>
            {openModal &&
                <dialog
                    className={`flex flex-col justify-center items-center mt-80 p-8 border-2 border-solid border-black rounded-md `}>
                    <button
                        onClick={() => HandleRedirect("profile-panel")}
                        className={`flex justify-center items-center w-[200px] rounded-lg my-2 bg-black text-white px-3 py-2`}
                    >Profile</button>
                    <button
                        onClick={() => HandleRedirect("order-panel")}
                        className={`flex justify-center items-center w-full rounded-lg my-2 bg-black text-white px-3 py-2`}
                    >Order</button>
                    <button
                        onClick={() => HandleRedirect("cart-panel")}
                        className={`flex justify-center items-center w-full rounded-lg my-2 bg-black text-white px-3 py-2`}
                    >Cart</button>
                </dialog>
            }

        </>
    )
}

export default PhonePanelNavMenu