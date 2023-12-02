import { ProductsProps } from "./productsProps"

export interface IOrderList {
    customer: string
    id: number
    order_date: string
    price: number
    products: ProductsProps[] | []
    status: string
}