import { $api } from "../api";
import { IProducts } from "../models/IProducts";

export class CartService {
    static async addToCart(id: string | undefined){
        const response = await $api.post<IProducts[]>(
            `/cart/add/`, {"product" : id, "quantity": 1}
        );
        return response;
    }

    static async getCart(){
        return await $api.get('/cart/')
    }
}