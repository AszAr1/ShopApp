import { AxiosResponse } from "axios";
import $api from "../API";
import { AuthResponse } from "../models/authResponse";

export default class AuthService {
    static async login(username: string, password: string): Promise<AxiosResponse<AuthResponse>> {
        return $api.post<AuthResponse>('/user/login/', {username, password})
    }

    static async register(username: string, email: string, password: string): Promise<AxiosResponse<AuthResponse>> {
        return $api.post<AuthResponse>('/user/signup', {username, email, password})
    }

    static async logout(): Promise<void> {
        return $api.post('/user/logout/')
    }
}