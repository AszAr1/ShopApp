import { useEffect, useState } from 'react'
import { IProducts } from '../../models/IProducts';
import { OrdersService } from '../../services/orders.service';
import { useNavigate } from 'react-router-dom';
import NoItems from '../../components/NoItems/NoItems';
import OrderList from '../../components/OrderList/OrderList';

function OrdersPage() {

  const [orders, setOrders] = useState<IProducts[] | []>([])
  const nav = useNavigate();

  useEffect(() => {

    OrdersService.getOrder()
      .then(response => setOrders(response.data))
      .catch(e => console.log(e))

    return () => setOrders([])

  }, []);

  if (orders.length === 0) {
    return <NoItems title="order" />;
  }

  const findTotalPrice = () => {
    let totalSum = 0;
    orders.forEach((element) => {
      totalSum += element.price;
    });
    return totalSum.toFixed(3);
  };

  const handleClickPay = () => {
    status = "Paid";
    nav("/successfully");
  };

  return (
    <section className="laptop:p-24 h-full w-full p-8">

      <div className="laptop:p-12 flex flex-col items-start justify-start rounded-xl border-2 border-solid border-black p-6">
        {/* @ts-ignore */}
        <OrderList orders={orders} />

        <div className="flex flex-col items-start justify-start">

          <div className="flex flex-row">
            <h1 className="text-xl font-bold">Total price: </h1>
            <p className="mx-2 text-lg">{findTotalPrice()}</p>
          </div>

          <button
            onClick={handleClickPay}
            className="w-full bg-black px-5 py-2 text-white transition-all duration-200 hover:scale-90"
          >
            Pay
          </button>

        </div>

      </div>

    </section>
  )
}

export default OrdersPage