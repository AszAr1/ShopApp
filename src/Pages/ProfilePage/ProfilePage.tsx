import { useState } from "react";
import SettingsPanel from "../../components/ProfilePage/SettingsPanel";
import Profile from "../../components/ProfilePage/ProfilePanel/ProfilePanel";
import SecurityPanel from "../../components/ProfilePage/SecurityPanel";
import OrderPanel from "../../components/ProfilePage/OrderPanel";
import CartPanel from "../../components/ProfilePage/CartPanel";
import PurchasedPanel from "../../components/ProfilePage/PurchasedPanel";
import { useAuthorization } from "../../stores/authorization";
import NotLogin from "../AuthorizationPage/NotLogin";

function ProfilePage() {

  const [activeComponent, setActiveComponent] = useState<null | String>(null);
  const isLogin = useAuthorization(state => state.login)

  const activeComponentRender = (component: string) => {
    setActiveComponent(component)
  }

  return isLogin 
    ?
    <>
      <div className={"w-full h-screen flex justify-center items-start"}>

        <SettingsPanel activeComponentRender={activeComponentRender}/>

        {!activeComponent && <div className="flex justify-center items-center w-full h-full text-7xl font-mono">(◕‿◕)</div>}
        {activeComponent === 'profile' && <Profile/>}
        {activeComponent === 'security' && <SecurityPanel />}
        {activeComponent === 'order' && <OrderPanel />}
        {activeComponent === 'cart' && <CartPanel />}
        {activeComponent === 'purchased' && <PurchasedPanel />}

      </div>
    </>
    :
     <NotLogin/>

}

export default ProfilePage
