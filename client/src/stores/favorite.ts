import axios from "axios"
import { create } from "zustand"
import { useFavoriteProps } from "../models/useFavoriteProps"
import { immer } from "zustand/middleware/immer"
import { devtools, persist } from "zustand/middleware"

export const useFavorite = create<useFavoriteProps>()(persist(devtools(immer((set => ({
  favorites: [],
  loading: true,

  setFavorite: (data) => {
    try {
      if (data) {
        set({ favorites: data, loading: false })
      }
    } catch (error) {
      console.error('Ошибка при получении данных с сервера:', error);
    }
  },
  
  async deleteFavorite(productId) {
    try {
      set((state) => ({
        favorites: state.favorites.filter((item) => item.id !== productId)
      }));
    } catch (error) {
      console.error(error);
    }
  }
  

  //удалять из избранного по idПродуктов

})))), {name: 'v1', version: 1}))
