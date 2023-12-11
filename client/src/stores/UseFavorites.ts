import { create } from "zustand";
import { IProducts } from "../models/IProducts";
import { FavoritesService } from "../services/favorites.service";

type UseFavoritesProps = {
    favorites: IProducts[];
    loading: boolean;
    setFavorite: () => void;
    clearFavorites: () => void,
    deleteFavorite: (productId: string) => void;
}

export const UseFavorites = create<UseFavoritesProps>((set) => ({
    favorites: [],
    loading: true,

    async setFavorite() {
        try {
            const response = await FavoritesService.getFavorites();
            set({ favorites: response.data, loading: false });
        } catch (err) {
            console.error(err);
        }
    },

    clearFavorites: () => { set({ favorites: [] }) },

    async deleteFavorite(productId) {
        try {
            set((state) => ({
                favorites: state.favorites.filter(
                    (item) => item.id !== productId,
                ),
            }));
        } catch (error) {
            console.error(error);
        }
    },
}))