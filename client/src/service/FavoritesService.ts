import { $api } from "../API";
import { ProductsProps } from "../models/products";

export class FavoritesService {

    static async addFavorites (productId: string) {
        const response = await $api.post<ProductsProps[]>(`/products/${productId}`)
        return response;
    }

    static async getFavorites() {
        const response = await $api.get<ProductsProps[]>(`/favorites`)
        if (response) return response
    }

    static async removeFavorites (){
        return $api.delete((`/favorites`))
    }

}