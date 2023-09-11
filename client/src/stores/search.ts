import { create } from "zustand"
import axios from "axios";
import { useSearchProps } from "../models/types";

export const useSearch = create<useSearchProps>(set => ({
    products: [],

    async searchProduct (productName) {
        try{
            const response = axios.get('http://localhost:3001/products')
        }catch(error) {
            console.error()
        }
    }


}))