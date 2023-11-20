import { $api } from "../API";
import { ProductsProps } from "../models/products";

export class FavoritesService {
    static async addFavorites(productId: string) {
        const response = await $api.post<ProductsProps[]>(
            `/products/${productId}/`, {"product": productId}
        );
        return response;
    }

    static async getFavorites() {
        return $api.get(`/favorites/`);
    }

    static async removeFavorites() {
        return $api.delete(`/favorites`);
    }
}
