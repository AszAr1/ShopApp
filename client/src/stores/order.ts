import { create } from "zustand";
import { OrderService } from "../service/OrderService";
import { IOrderList } from "../models/ordersProps";

interface IuseOrder {
    order: IOrderList[] | [],
    loading: boolean,
    status: string,
    setOrder: () => void
}

export const useOrder = create<IuseOrder>((set) => ({
    order: [],
    loading: true,
    status: "Processing",

    async setOrder() {
        OrderService.getOrder()
        .then(response => set({order: response.data, loading: false}))
        .catch(e => console.log(e))
    }
}));
