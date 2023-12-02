import { create } from "zustand";
import axios from "axios";
import { useSearchProps } from "../models/useSearchProps";
import { SearcService } from "../service/SearchService";

export const useSearch = create<useSearchProps>((set) => ({
    products: [],
    request: "",

    setRequest (input) {
        set({request: input})
    },

    async searchProduct(request) {
        try {
            const response = await SearcService.search(request);
            // console.log(response.data);
            set({
                products: [response.data],
            });
        } catch (error) {
            console.error();
        }
    },
}));
