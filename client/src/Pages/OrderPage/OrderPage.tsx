import { useEffect, useState } from "react";
import { NoItems } from "../../components/NoItems/NoItems";
import { OrderList } from "../../components/OrderList/OrderList";
import { useOrder } from "../../stores/order";
import { useNavigate } from "react-router-dom";
import { OrderService } from "../../service/OrderService";

function OrderPage() {
    // const [orders, setOrders] = useState([]);
    const orders = useOrder((state) => state.order);
    const getOrder = useOrder((state) => state.setOrder);
    let status = useOrder((state) => state.status);
    const nav = useNavigate();

    useEffect(() => {
        getOrder();
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
                    {/* <h2></h2> */}
                    <button
                        onClick={handleClickPay}
                        className="w-full bg-black px-5 py-2 text-white transition-all duration-200 hover:scale-90"
                    >
                        Pay
                    </button>
                </div>
            </div>
        </section>
    );
}

export default OrderPage;
