import { $api } from "../api";
import { IProducts } from "../models/IProducts";

export class FavoritesService {
    
    static async addFavorites(productId: string) {

        const response = await $api.post<IProducts[]>(
            `/favorites/add/`, { "product": productId }
        );
        return response;

    }

    static async getFavorites() {
        return $api.get(`/favorites/`);
    }

    static async removeFavorites(productId: string) {
        const product = {
            "product": productId
        }
        return $api.delete(`/favorites/`, {data: product} );
    }
}