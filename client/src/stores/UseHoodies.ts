import { create } from "zustand";
import { IProducts } from "../models/IProducts";
import { HoodiesService } from "../services/hoodies.service";

type IUseHoodies = {
    hoodies: IProducts[];
    hoodie: IProducts | null;
    loading: boolean;
    getHoodies: () => void;
    getLimitedHoodies: (limit: number) => void;
    getOneHoodie: (id: string | undefined) => void;
    removeHoodies(): void,
    removeHoodie(): void,
}

export const UseHoodies = create<IUseHoodies>((set) => ({
    hoodies: [],
    hoodie: null,
    loading: true,

    async getLimitedHoodies(limit) {
        try {
            HoodiesService.getLimitedHoodies(limit).then((response) =>
                set({ hoodies: response.data }),
            );
        } catch (e: any) {
            console.error(e);
            if (e.statusCode === 400) {
                e = await e.json();
            }
        } finally {
            set({ loading: false });
        }
    },

    async getHoodies() {
        try {
            HoodiesService.getHooides().then((response) =>
                set({ hoodies: response.data }),
            );
        } catch (e) {
            console.error("Ошибка получения данных с сервера", e);
        } finally {
            set({ loading: false });
        }
    },

    async getOneHoodie(productId) {
        try {
            HoodiesService.getOneHoodie(productId).then((response) =>
                set({ hoodie: response.data }),
            );
        } catch (error) {
            console.error("Ошибка при получении данных с сервера:", error);
        } finally {
            set({ loading: false });
        }
    },

    removeHoodies(){
        set({
            hoodies: []
        })
    },

    removeHoodie(){
        set({hoodie: null})
    }
}))