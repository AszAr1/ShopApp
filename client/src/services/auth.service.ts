import { AxiosResponse } from "axios";
import { $api } from "../api";
import { AuthResponse, IUser } from "../models/IAuthResponse";

export class AuthService {
    static async login( username: string, password: string): Promise<AxiosResponse<AuthResponse>> {

        const user = {
            username: username,
            password: password,
        };

        try {

            const response = await $api.post<AuthResponse>("/login/", user);
            localStorage.setItem("token", response.data.access);
            localStorage.setItem("refreshToken", response.data.refresh);
            localStorage.setItem("username", response.data.user.username);
            return response;

        } catch (e){

            throw e;

        }
    }

    static async register(
        username: string,
        email: string,
        password: string,
    ): Promise<AxiosResponse<AuthResponse>> {
        const user = {
            username: username,
            email: email,
            password: password,
        };
        try {
            const response = await $api.post<AuthResponse>("/signup/", user);
            localStorage.setItem("token", response.data.access);
            localStorage.setItem("refreshToken", response.data.refresh);
            localStorage.setItem("username", response.data.user.username);
            return response;
        } catch (error) {
            console.error("Registration error:", error);
            throw error;
        }
    }

    static async logout(): Promise<void> {
        console.log(localStorage.getItem("refreshToken"));
        localStorage.removeItem('username');
        return $api.post("/logout/", localStorage.getItem("refreshToken"));
    }

    static getProfile(
        username: string | null,
    ) {
        const response = $api.get<IUser>(`/profile/${username}/`);
        return response;
    }
}