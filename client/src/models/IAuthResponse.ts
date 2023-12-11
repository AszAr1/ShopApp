export type AuthResponse = {
    access: string;
    refresh: string;
    user: IUser;
}
export type IUser = {
    username: string;
    password: string;
    email: string;
    first_name: string;
    last_name: string;
    profile_picture: null;
    see_more: string;
}
