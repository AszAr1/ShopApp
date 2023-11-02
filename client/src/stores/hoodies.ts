import axios from "axios";
import { create } from "zustand";
import { useHoodiesProps } from "../models/products";
import { HooidesService } from "../service/HoodiesService";

export const useHoodies = create<useHoodiesProps>(set => ({
    hoodies: [],
    hoodie: null,
    loading: true,
    
    async getLimitedHoodies (limit) {
        try {
            HooidesService.getLimitedHoodies(limit)
            .then(response => set({hoodies: response.data}))
          } catch (e: any) {
            console.error(e)
            if (e.statusCode === 400) {
              e = await e.json()
            }
          } finally {
            set({ loading: false })
          }
    },

    async getHoodies() {
        try {
            HooidesService.getHooides()
            .then(response => set({hoodies: response.data}))
          } catch (e) {
            console.error("Ошибка получения данных с сервера", e)
          } finally {
            set({ loading: false })
          }
    },

    async getOneHoodie(productId) {
      try {
        HooidesService.getOneHoodie(productId)
        .then(response => set({hoodie: response.data}))
      } catch (error) {
        console.error('Ошибка при получении данных с сервера:', error)
      } finally {
        set({ loading: false })
      }
   },

}))
