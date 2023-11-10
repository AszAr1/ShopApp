import { create } from "zustand"
import axios from "axios";
import { useSearchProps } from "../models/useSearchProps";
import { SearcService } from "../service/SearchService";

export const useSearch = create<useSearchProps>(set => ({
    products: [],

    async searchProduct (productName) {
        try{
            const response = await SearcService.search(productName)
            console.log(response.data)
            set({
                products: [await response.data]
            })
        }catch(error) {
            console.error()
        }
    }


}))