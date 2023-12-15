import { create } from "zustand";
import { SearcService } from "../services/search.service";
import { IProducts } from "../models/IProducts";

type IUseSearch = {
    request: string,
    products: IProducts[] | []
    setRequest(input: string): void,
    findProducts(request: string): any
}

export const UseSearch = create<IUseSearch>((set) => ({
    request: " ",
    products: [],

    setRequest(input) {
        set({request: input})
    },

    async findProducts(request) {
       try {
        const response = await SearcService.search(request)
        set({products: [response.data]})
       } catch (error) {
        console.log(error)
       }
    },
}))