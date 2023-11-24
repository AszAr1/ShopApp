import { create } from "zustand";
import { useFavoriteProps } from "../models/useFavoriteProps";
import { immer } from "zustand/middleware/immer";
import { devtools, persist } from "zustand/middleware";
import {FavoritesService} from "../service/FavoritesService";

export const useFavorite = create<useFavoriteProps>()(
        devtools(
            immer((set) => ({
                favorites: [],
                loading: true,

                async setFavorite ()  {
                    try {
                        const response = await FavoritesService.getFavorites();
                        set({favorites: response.data, loading: false});
                    } catch (err) {
                        console.error(err);
                    }
                },

                clearFavorites: () => { set({ favorites: [] })},

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
            })),
        ),
);
