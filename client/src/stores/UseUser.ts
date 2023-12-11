import { create } from "zustand";
import { IUser } from "../models/IAuthResponse";

type IUseUser = {
    user: {
        image: string | null;
        username: string | null;
        email: string | null;
    };
    isRegister: boolean;
    login: boolean;
    loginUser: (user: IUser) => void;
    registration: (user: IUser) => void;
    logout: () => void;
}

export const UseUser = create<IUseUser>((set) => ({
    user: {
        image: null,
        username: null,
        email: null,
        id: null,
    },
    isRegister: false,
    login: false,

    async loginUser(user) {
        try {
            set({
                user: {
                    image: user.profile_picture,
                    username: user.username,
                    email: user.email,
                },
                login: true,
            });
        } catch (e) {
            console.error(e);
        }
    },

    async registration(user) {
        try {
            set({
                user: {
                    image: user.profile_picture,
                    username: user.username,
                    email: user.email,
                },
                login: true,
            });
        } catch (e) {
            console.error(e);
        }
    },

    async logout() {
        try {
            localStorage.removeItem("token");
            localStorage.removeItem("refreshToken");
            localStorage.removeItem("username");
            set({
                user: {
                    image: null,
                    username: null,
                    email: null,
                },
                login: false,
            });
        } catch (e) {
            console.error(e);
        }
    },
}))