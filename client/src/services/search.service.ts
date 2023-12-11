import { $api } from "../api";

export class SearcService {
    static async search(request: string) {
        return $api.get(`/?search=${request}`);
    }
}