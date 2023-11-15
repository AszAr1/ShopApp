import axios, { AxiosResponse } from "axios";
import { AuthResponse } from "../models/authResponse";
import $api from "../API";

export default class AuthService {

    static async login(username: string, password: string): Promise<AxiosResponse<AuthResponse>> {
        const user = {
            "username": username,
            "password": password
        }
        const response = $api.post<AuthResponse>('/login/', user)
        localStorage.setItem('token', (await response).data.access)
        return response
    }

    static async register(username: string, email: string, password: string): Promise<AxiosResponse<AuthResponse>> {
        const user = {
            "username": username,
            "email": email,
            "password": password
        }
        const response = $api.post<AuthResponse>('/signup/', user)
        localStorage.setItem('token', (await response).data.access)
        return response
    }

    static async logout(): Promise<void> {
        return $api.post('/logout/')
    }
}