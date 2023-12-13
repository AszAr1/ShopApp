import { useEffect, useState } from 'react'
import SettingsPanel from '../SettingsPanel/SettingsPanel'
import { IProducts } from '../../models/IProducts'
import { OrdersService } from '../../services/orders.service'
import OrderList from '../OrderList/OrderList'
import NoItems from '../NoItems/NoItems'
import PhonePanelNavMenu from '../PhonePanelNavMenu/PhonePanelNavMenu'

function OrderPanel() {

  const [orders, setOrders] = useState<IProducts[] | []>([])

  useEffect(() => {

    OrdersService.getOrder()
      .then(response => setOrders(response.data))
      .catch(e => console.log(e))

    return () => setOrders([]);

  }, [])

  return (
    <>
      <div className="flex laptop:flex-row flex-col h-full w-full items-center justify-start laptop:p-0 p-5">
        <SettingsPanel />
        <div className='mx-5 w-full'>
          {orders.length === 0 ? (
            <NoItems title="order" />
          ) : (
            <OrderList orders={orders} />
          )}
          <PhonePanelNavMenu />
        </div>
        
      </div>
    </>
  )
}

export default OrderPanel