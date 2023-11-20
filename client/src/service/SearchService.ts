import { $api } from "../API";

export class SearcService {
    static async search(request: string) {
        return $api.get(`/?search=${request}`);
    }
}
