import axios from "axios";

export const API_URL = `http://localhost:8000`;

export const $api = axios.create({
    baseURL: API_URL,
    headers: {
        Authorization:
            `Bearer ${localStorage.getItem("token")}` === `Bearer ` + null ||
            `Bearer ${localStorage.getItem("token")}` === `Bearer ` + undefined
                ? ""
                : `Bearer ${localStorage.getItem("token")}`,
    },
});

// export function getTokenFromLocalStoage() {
//     const token = localStorage.getItem('token')
//     return token
// }

// export function setTokenToLocalStorage (key:string, token:string):void {
//     localStorage.setItem(key, JSON.stringify(token))
// }

// export function removeTokenFromLocalStorage(key:string): void {
//     localStorage.removeItem(key)
// }
