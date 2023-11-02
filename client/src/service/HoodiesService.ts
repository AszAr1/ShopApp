import axios from "axios"

export class HooidesService {
    static async getHooides() {
        return axios.get(`http://localhost:8000/products/hoodies`)
    }
    
    static async getOneHoodie(id: string | undefined) {
        return await axios.get(`http://localhost:8000/products/${id}`)
    }

    static async getLimitedHoodies(limit: number){
        return await axios.get(`http://localhost:8000/products/hoodies/?filter=${limit}`)
    }
}