import axios, { AxiosResponse } from "axios";
import { AuthResponse, UserProps } from "../models/authResponse";
import { $api } from "../API";


export default class AuthService {

    static async login(username: string, password: string): Promise<AxiosResponse<AuthResponse>> {
        const user = {
            "username": username,
            "password": password
        }
        const response = await $api.post<AuthResponse>('/login/', user)
        localStorage.setItem('token', response.data.access)
        localStorage.setItem('refreshToken', response.data.refresh)
        return response
    }

    static async register(username: string, email: string, password: string): Promise<AxiosResponse<AuthResponse>> {
        const user = {
            "username": username,
            "email": email,
            "password": password
        }
        try {
            const response = await $api.post<AuthResponse>('/signup/', user)
            localStorage.setItem('token', response.data.access)
            localStorage.setItem('refreshToken', response.data.refresh)
            localStorage.setItem('username', response.data.user.username)
            return response
          } catch (error) {
            console.error('Registration error:', error)
            throw error
          }
    }

    static async logout(): Promise<void> {
        console.log(localStorage.getItem('refreshToken'))
        return $api.post('/logout/', localStorage.getItem('refreshToken'))
    }

    static async getProfile(username:string | null): Promise<AxiosResponse<AuthResponse>> {
        
        const response = await $api.get<AuthResponse>(`/profile/${username}`)
        return response
    }
}