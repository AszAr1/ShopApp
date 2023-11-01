import React from "react";

export interface useAuthorizationProps {
    user: {
      name: string | null,
      email: string | null,
    },
    login: boolean,
    loginUser:(name: string, email: string, password: string) => void,
    setUser: (name: string, email: string | null) => void,
    removeUser: () => void
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