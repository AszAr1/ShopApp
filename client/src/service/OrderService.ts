import {$api} from "../API";

export class OrderService {

    static addToOrder (){
        return $api.post('/cart/')
    }

    static getOrder (){
        return $api.get('/orders/')
    }

}