import axios from "axios";

export const API_URL = `http://localhost:8000`

// const $api = axios.create({
//     withCredentials: true,
//     baseURL: API_URL
// })

// $api.interceptors.request.use((config) => {
//     config.headers.Authorization = `Bearer ${localStorage.getItem('token')}`
//     console.log(localStorage.getItem('token'))
//     return config
// })

// export default $api

export const $api = axios.create({
    baseURL: API_URL,
    headers: {
        Authorization: `Bearer ${localStorage.getItem('token')}` === `Bearer `  + null || `Bearer ${localStorage.getItem('token')}` === `Bearer `  + undefined ? '' : `Bearer ${localStorage.getItem('token')}`,

    }
})

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

