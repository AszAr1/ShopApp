import { useEffect, useState } from "react"
import SettingsPanel from "./SettingsPanel"
import { CartService } from "../../service/CartService";
import { ProductsProps } from "../../models/productsProps";
import Card from "../UI/Card";
import { NoItems } from "../NoItems/NoItems";

const CartPanel = () => {

  const [cart, setCart] = useState<ProductsProps[] | []>([]);

  useEffect(() => {
    CartService.getCart()
      .then(response => setCart(response.data))
      .catch(e => console.log(e));
    return () => setCart([]);
  }, [])


  return (
    <div className='flex justify-start items-center w-full h-full'>
      <SettingsPanel />
      <div className="w-full h-full">
        {cart.length === 0 ? <NoItems title="cart"/> :

          <div className="laptop:grid-cols-3 grid grid-cols-1 gap-4 p-10">
            {cart.map((item) => (
              <div key={item.id}>
                {/*@ts-ignore*/}
                <Card product={item.product} />
              </div>
            ))}
          </div>

        }
      </div>
    </div>
  )
}

export default CartPanel