import {$api} from "../API";
import {ProductsProps} from "../models/productsProps";

export class CartService {
    static async addToCart(id: string | undefined){
        const response = await $api.post<ProductsProps[]>(
            `/products/${id}/`, {"product" : id, "quantity": 1}
        );
        return response;
    }

    static async getCart(){
        return await $api.get('/cart/')
    }
}