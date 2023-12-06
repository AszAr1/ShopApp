import { useEffect, useState } from "react"
import {OrderList} from "../OrderList/OrderList"
import SettingsPanel from "./SettingsPanel"
import { OrderService } from "../../service/OrderService"
import { IOrderList } from "../../models/ordersProps"
import { NoItems } from "../NoItems/NoItems"

const OrderPanel = () => {

  const [orders, setOrders] = useState<IOrderList[] | []>([])

    useEffect(()=>{
      OrderService.getOrder()
      .then(response => setOrders(response.data))
      .catch(e => console.log(e));
      return () => {
        setOrders([])
     };
    }, [])

    return (
      <div className='flex justify-start items-center w-full h-full'>
          <SettingsPanel/>
          {orders.length === 0 ? <NoItems title="order"/> : <OrderList orders={orders}/>}
      </div>
    )
  }
  
  export default OrderPanel