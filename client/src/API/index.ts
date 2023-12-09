import axios from "axios";

export const API_URL = `http://localhost:8000`;
const token = localStorage.getItem('token')

export const $api = axios.create({
    baseURL: API_URL,
    headers: {
        Authorization:
            `Bearer ${token}` === `Bearer ` + null ||
            `Bearer ${token}` === `Bearer ` + undefined
                ? ""
                : `Bearer ${token}`,
    },
});

export const $apiImage = axios.create({
    baseURL: API_URL,
    headers: {
        "Content-Type": 'multipart/form-data',
        Authorization:
            `Bearer ${token}` === `Bearer ` + null ||
            `Bearer ${token}` === `Bearer ` + undefined
                ? ""
                : `Bearer ${token}`,
    },
})

// export function getToken() {
//     const token = localStorage.getItem('token')
//     return token
// }

// export function setTokenToLocalStorage (key:string, token:string):void {
//     localStorage.setItem(key, JSON.stringify(token))
// }

// export function removeTokenFromLocalStorage(key:string): void {
//     localStorage.removeItem(key)
// }
