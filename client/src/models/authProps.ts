import React from "react";

export interface useAuthorizationProps {
    user: {
      username: string | null,
      email: string | null,
    },
    login: boolean,
    loginUser:(name: string, email: string, password: string) => void,
    registration: (name: string, email: string, password: string) => void,
    logout: () => void
}

export interface InfoProps {
    username: string,
    password: string,
    email: string
    first_name: string,
    last_name: string,
    profile_picture: null,
    see_more: string,
}