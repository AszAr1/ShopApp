import { $api } from "../api";

export class SneakersService {

    static async getLimitSneakers (limit: number) {
        return await $api.get(
            `/products/sneakers/?filter=${limit}`,
        );
    }

    static async getAllSneakers () {
        return $api.get(`/products/sneakers/`);
    }

    static async getOneSneaker (id: string | undefined) {
        return $api.get(`products/${id}/`)
    }
    
}