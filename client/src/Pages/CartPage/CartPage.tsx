import { useEffect, useState } from 'react'
import { CartService } from '../../services/cart.service';
import NoItems from '../../components/NoItems/NoItems';
import { IProducts } from '../../models/IProducts';
import { OrdersService } from '../../services/orders.service';
import { Notification } from '../../components/Notification/Notification';
import Card from '../../components/Card/Card';

function CartPage() {
  
  const [products, setProducts] = useState<IProducts[] | []>([]);
  const [showToast, setShowToast] = useState(false);
  const [done, setDone] = useState(false);

  useEffect(() => {
      CartService.getCart().then(response => setProducts(response.data))
  }, []);

  function addToOrder() {
      try {
          OrdersService.addToOrder()
          setDone(true);
          setShowToast(true);
      } catch (error) {
          console.log(error)
          setShowToast(true);
      }
  }

  if (products.length === 0) {
      return (
          <NoItems title="cart" />
      );
  } else {
      return (
          <>
              {showToast && (
                  <Notification
                      done={done} 
                      positiveDescription="Successfully ˆ_ˆ"
                      negativeDescription="Failed add to orders x_x"
                      setShowToast={setShowToast}
                  />
              )}
              <div className="w-full h-full">
                  <div className="laptop:grid-cols-3 grid grid-cols-1 gap-4 p-10">
                      {products.map((item) => (
                          <div key={item.id}>
                              {/*@ts-ignore*/}
                              <Card product={item.product} />
                          </div>
                      ))}
                  </div>
                  <div className={`flex justify-between items-center p-5 m-4 rounded-md border-2 border-solid border-gray-600`}>
                      <h1>Add to order</h1>
                      <button
                          className={`px-8 py-2 bg-black text-white font-bold duration-150 transition hover:scale-90`}
                          onClick={addToOrder}
                      >Add</button>
                  </div>
              </div>
          </>
      );
  }
}

export default CartPage