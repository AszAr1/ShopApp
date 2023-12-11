import {create} from 'zustand'
import { SneakersService } from '../services/sneakers.service';
import { IProducts } from '../models/IProducts';

type IUseSneakers = {
    sneakers: IProducts[];
    sneaker: IProducts | null;
    loading: boolean;
    getSneakers: () => void;
    getLimitedSneakers: (limit: number) => void;
    getOneSneaker: (producTitle: string | undefined) => void;
    removeSneaker(): void,
    removeSneakers(): void,
}

export const UseSneakers = create<IUseSneakers>((set) => ({
    sneakers: [],
    sneaker: null,
    loading: true,

    async getSneakers() {
        try {
            SneakersService.getAllSneakers().then((response) =>
                set({ sneakers: response.data }),
            );
        } catch (e) {
            console.error(e);
            set({ sneakers: [] });
        } finally {
            set({ loading: false });
        }
    },

    async getLimitedSneakers(limit) {
        try {
            SneakersService.getLimitSneakers(limit).then((response) =>
                set({ sneakers: response.data }),
            );
        } catch (error) {
            console.error("Ошибка при получении данных с сервера:", error);
            set({ sneakers: [] });
        } finally {
            set({ loading: false });
        }
    },

    async getOneSneaker(id) {
        try {
            SneakersService.getOneSneaker(id).then((response) =>
                set({ sneaker: response.data }),
            );
        } catch (e) {
            console.error(e);
        } finally {
            set({ loading: false });
        }
    },

    removeSneaker() {
        set({
            sneaker: null
        })
    },

    removeSneakers(){
        set({sneakers: []})
    },
}))