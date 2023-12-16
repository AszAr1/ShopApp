import { useEffect, useState } from "react";
import SettingsPanel from "../SettingsPanel/SettingsPanel";
import NoItems from "../NoItems/NoItems";
import { IProducts } from "../../models/IProducts";
import { CartService } from "../../services/cart.service";
import Card from "../Card/Card";
import PhonePanelNavMenu from "../PhonePanelNavMenu/PhonePanelNavMenu";
import { Notification } from "../Notification/Notification";

function CartPanel() {
  const [cart, setCart] = useState<IProducts[] | []>([]);
  const [showToast, setShowToast] = useState(false);
  const [done, setDone] = useState(false);

  useEffect(() => {
    CartService.getCart()
      .then((response) => setCart(response.data))
      .catch(() => {
        setShowToast(false);
        setDone(false);
      });

    return () => setCart([]);
  }, []);

  return (
    <>
      {showToast && (
        <Notification
          negativeDescription="Something want bad"
          positiveDescription="successfully ˆ_ˆ"
          setShowToast={setShowToast}
          done={done}
        />
      )}
      <div className="laptop:p-0 p-5 flex laptop:flex-row flex-col justify-start items-center w-full h-full">
        <SettingsPanel />
        <div className="w-full h-full mx-5">
          {cart.length === 0 ? (
            <NoItems title="cart" />
          ) : (
            <div className="laptop:grid-cols-3 grid grid-cols-1 gap-4 p-10">
              {cart.map((item) => (
                <div key={item.id}>
                  {/*@ts-ignore*/}
                  <Card product={item.product} />
                </div>
              ))}
            </div>
          )}
          <PhonePanelNavMenu />
        </div>
      </div>
    </>
  );
}

export default CartPanel;
