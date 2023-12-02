import { useEffect } from "react";
import { NoItems } from "../../components/NoItems/NoItems";
import OrderList from "../../components/OrderList/OrderList";
import { useOrder } from "../../stores/order";
import { useNavigate } from "react-router-dom";


function OrderPage() {

    const orders = useOrder(state => state.order)
    const getOrder = useOrder(state => state.setOrder)
    let status = useOrder(state => state.status)
    const nav = useNavigate()

    useEffect(() => {
        getOrder()
    }, []);


    if (orders.length === 0) {
        return (
            <NoItems title="order" />
        )
    }

    const findTotalPrice = () => {
        let totalSum = 0
        orders.forEach(element => {
            totalSum += element.price
        });
        return totalSum.toFixed(3)
    }

    const handleClickPay = () => {
        status = "Paid"
        nav("/successfully")
    }

    return (
        <section className="w-full h-full laptop:p-24 p-8">
            <div className="flex flex-col justify-start items-start laptop:p-12 p-6 rounded-xl border-solid border-2 border-black">
                {/* @ts-ignore */}
                <OrderList orders={orders} />

                <div className="flex flex-col justify-start items-start">
                    <div className="flex flex-row">
                        <h1 className="font-bold text-xl">Total price: </h1>
                        <p className="text-lg mx-2">{findTotalPrice()}</p>
                    </div>
                    <h2></h2>
                    <button onClick={handleClickPay} className="bg-black w-full px-5 py-2 text-white transition-all duration-200 hover:scale-90">Pay</button>
                </div>
            </div>
        </section>
    )
}

export default OrderPage;
