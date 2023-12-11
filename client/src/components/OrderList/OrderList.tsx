import { IProducts } from '../../models/IProducts'

type IOrderList = {
    orders: IProducts[] | []
}

function OrderList({orders}: IOrderList ) {
    return (
        <section className="w-full h-full">
            {/* @ts-ignore */}
            {orders.map(el => (
                // @ts-ignore
                el.products.map(pr => (
                    <div className="flex laptop:flex-row flex-col justify-between items-center p-4 rounded-md border-2 border-black border-solid my-4" key={pr.id}>
                        <img src={pr.image} alt={pr.title} className="w-32 h-32" />
                        <h1 className="font-bold text-xl">{pr.title}</h1>
                        <p>{pr.price}$</p>
                    </div>
                ))
            ))}
        </section>
    )
}

export default OrderList