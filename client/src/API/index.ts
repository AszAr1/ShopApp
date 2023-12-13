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

export const $apiUpdateInfo = axios.create({
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