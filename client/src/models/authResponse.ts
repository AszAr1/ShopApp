export interface AuthResponse {
    access: string,
    refresh: string,
    user: UserProps
}

export interface UserProps {
    username: string,
    password: string,
    email: string
    first_name: string,
    last_name: string,
    profile_picture: null,
    see_more: string,
}