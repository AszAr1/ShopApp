import { AxiosResponse } from "axios";
import { AuthResponse } from "../models/authResponse";
import $api from "../API";

export default class AuthService {
    static async login(username: string, password: string): Promise<AxiosResponse<AuthResponse>> {
        const user = {
            "username": username,
            "password": password
        }
        return $api.post<AuthResponse>('/user/login/', user)
    }

    static async register(username: string, email: string, password: string): Promise<AxiosResponse<AuthResponse>> {
        const user = {
            "username": username,
            "email": email,
            "password": password
        }
        return $api.post<AuthResponse>('/user/signup/', user)
    }

    static async logout(): Promise<void> {
        return $api.post('/user/logout/')
    }
}