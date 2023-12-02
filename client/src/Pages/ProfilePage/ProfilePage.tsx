import { useState } from "react";
import SettingsPanel from "../../components/ProfilePage/SettingsPanel";
import Profile from "../../components/ProfilePage/ProfilePanel/ProfilePanel";
import SecurityPanel from "../../components/ProfilePage/SecurityPanel";
import OrderPanel from "../../components/ProfilePage/OrderPanel";
import CartPanel from "../../components/ProfilePage/CartPanel";
import PurchasedPanel from "../../components/ProfilePage/PurchasedPanel";
import { useUser } from "../../stores/user";
import NotLogin from "../AuthorizationPage/NotLogin";

function ProfilePage() {
    const [activeComponent, setActiveComponent] = useState<null | String>(null);
    const isLogin = useUser((state) => state.login);

    const activeComponentRender = (component: string) => {
        setActiveComponent(component);
    };

    return isLogin ? (
        <>
            <div className={"flex h-screen w-full items-start justify-center"}>
                <SettingsPanel activeComponentRender={activeComponentRender} />

                {/* {!activeComponent && (
                    <div className="flex h-full w-full items-center justify-center font-mono text-7xl">
                        (◕‿◕)
                    </div>
                )}
                <Profile />
                {/* {activeComponent === "security" && <SecurityPanel />}
                {activeComponent === "order" && <OrderPanel />}
                {activeComponent === "cart" && <CartPanel />}
                {activeComponent === "purchased" && <PurchasedPanel />} */}
            </div>
        </>
    ) : (
        <NotLogin />
    );
}

export default ProfilePage;
