import { create } from "zustand";
import { useAuthorizationProps } from "../models/authProps";
import { devtools } from "zustand/middleware";

export const useUser = create<useAuthorizationProps>()(
    devtools((set) => ({
        user: {
            username: null,
            email: null,
        },
        isRegister: false,
        login: false,

        async loginUser(user) {
            try {
                set({
                    user: {
                        username: user.username,
                        email: user.email,
                    },
                    login: true,
                });
            } catch (e) {
                console.error(e);
            }
        },

        async registration(name, email) {
            try {
                set({
                    user: {
                        username: name,
                        email: email,
                    },
                    login: true,
                });
            } catch (e) {
                console.error(e);
            }
        },

        async logout() {
            try {
                localStorage.removeItem('token')
                localStorage.removeItem('refreshToken')
                set({
                    user: {
                        username: null,
                        email: null,
                    },
                    login: false,
                });
            } catch (e) {
                console.error(e);
            }
        },
    })),
);
