import { $api } from "../api"

export class HoodiesService {

    static async getHooides() {
        return $api.get(`/products/hoodies/`)
    }

    static async getOneHoodie(id: string | undefined) {
        return await $api.get(`/products/${id}/`)
    }

    static async getLimitedHoodies(limit: number){
        return await $api.get(`/products/hoodies/?filter=${limit}`)
    }
    
}