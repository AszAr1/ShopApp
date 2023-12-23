import { useEffect, useState } from 'react'
import { IProducts } from '../../models/IProducts'
import { OrdersService } from '../../services/orders.service'
import OrderList from '../OrderList/OrderList'
import NoItems from '../NoItems/NoItems'
import PhonePanelNavMenu from '../PhonePanelNavMenu/PhonePanelNavMenu'
import { Notification } from '../Notification/Notification'
import SettingsPanel from '../SettingsPanel/SettingsPanel'

function OrderPanel() {

  const [orders, setOrders] = useState<IProducts[] | []>([])
  const [showToast, setShowToast] = useState(false);
  const [done, setDone] = useState(false);

  useEffect(() => {

    OrdersService.getOrder()
      .then(response => setOrders(response.data))
      .catch(() => {
        setShowToast(true) 
        setDone(false)
      })

    return () => setOrders([]);

  }, [])

  return (
    <>
      {showToast && (
        <Notification
          negativeDescription="Something want bad."
          positiveDescription="successfully ˆ_ˆ"
          setShowToast={setShowToast}
          done={done}
        />
      )}
      <div className="flex laptop:flex-row flex-col h-full w-full items-center justify-start laptop:p-0 p-5">

        < SettingsPanel />

        <div className='mx-5 w-full'>
          <PhonePanelNavMenu />
          {orders.length === 0 ? (
            <NoItems title="order" />
          ) : (
            <OrderList orders={orders} />
          )}
        </div>
      </div>
    </>
  )
}

export default OrderPanel