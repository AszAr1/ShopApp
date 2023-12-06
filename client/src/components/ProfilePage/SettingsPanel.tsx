import { FC } from "react";
import { useUser } from "../../stores/user";
import { Link, useNavigate } from "react-router-dom";
import { useFavorite } from "../../stores/favorite";

const SettingsPanel = () => {
    const removeUser = useUser((state) => state.logout);
    const push = useNavigate();
    const {clearFavorites} = useFavorite();
    const nav = useNavigate();

    const logOut = () => {
        removeUser();
        clearFavorites()    
        push("/");
    };

    function HandleClick (component: string, e: React.MouseEvent<HTMLButtonElement, MouseEvent>) {
        e.preventDefault();
        nav(`/profile/${component}`);
    }

    return (
        <>
            <div className="desktop:flex hidden h-screen w-[500px] flex-col items-center justify-center border-r-2 border-solid border-black p-5">

                <div className="relative h-[200px] w-[200px] overflow-hidden rounded-full border-2 border-solid border-black">
                    <img
                        className="absolute"
                        src="https://images.unsplash.com/photo-1618641986557-1ecd230959aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"
                    />
                </div>

                <div className="mt-10 flex w-full flex-col items-start justify-center rounded-lg border-2 border-solid border-black p-10">
                    <button
                        onClick={e => HandleClick("profile-panel", e)}
                        className="flex w-full items-start rounded-md p-2 font-mono text-lg hover:bg-gray-200"
                    >
                        Profile
                    </button>
                    <button
                        onClick={e => HandleClick("order-panel", e)}
                        className="flex w-full items-start rounded-md p-2 font-mono text-lg hover:bg-gray-200"
                    >
                        Order
                    </button>
                    <button
                        onClick={e => HandleClick("cart-panel", e)}
                        className="flex w-full items-start rounded-md p-2 font-mono text-lg hover:bg-gray-200"
                    >
                        Cart
                    </button>
                    <button
                        onClick={logOut}
                        className="mt-3 flex w-full items-start rounded-md border-2 border-black p-2 font-mono text-lg hover:bg-gray-200"
                    >
                        Log Out
                    </button>
                </div>
            </div>
        </>
    );
};

export default SettingsPanel;
