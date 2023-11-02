import axios from "axios";

export class SneakersService {

    static async getSneakers() {
        return axios.get(`http://localhost:8000/products/sneakers`)
    }
    
    static async getOneSneaker(id: string | undefined) {
        return await axios.get(`http://localhost:8000/products/${id}`)
    }

    static async getLimitedSneakers(limit: number){
        return await axios.get(`http://localhost:8000/products/sneakers/?filter=${limit}`)
    }

}