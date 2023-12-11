import { $api } from "../api"

export class OrdersService {

    static addToOrder (){
        return $api.post('/cart/')
    }

    static getOrder (){
        return $api.get('/orders/')
    }

}