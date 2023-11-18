import React from "react";

export interface useAuthorizationProps {
    user: {
      username: string | null,
      email: string | null,
    },
    isRegister: boolean,
    login: boolean,
    loginUser:(user:User) => void,
    registration: (name: string, email: string) => void,
    logout: () => void
}

export interface User {
    username: string,
    password: string,
    email: string
    first_name: string,
    last_name: string,
    profile_picture: null,
    see_more: string,
}