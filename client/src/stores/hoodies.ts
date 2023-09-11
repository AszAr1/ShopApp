import axios from "axios";
import { create } from "zustand";
import { useHoodiesProps } from "../models/types";

export const useHoodies = create<useHoodiesProps>(set => ({
    hoodies: [],
    hoodie: null,
    loading: true,
    
    async getLimitedHoodies (limit, offset) {
        try {
            const response = await axios.get('http://localhost:8000/products/hoodies/', {
              params: { _limit: limit, _offset: offset },
            })
            set({ hoodies: await response.data })
          } catch (e: any) {
            // custom error
            if (e.statusCode === 400) {
              e = await e.json()
            }
          } finally {
            set({ loading: false })
          }
    },

    async getHoodies() {
        try {
            const response = await axios.get('http://localhost:3001/')
            set({ hoodies: await response.data })
          } catch (e) {
            console.error("Ошибка получения данных с сервера", e)
          } finally {
            set({ loading: false })
          }
    },

    async getOneHoodie(productId) {
      try {
        const response = await axios.get(`http://localhost:3001/hoodie/${productId}`)
        if(response.data){
          set({ hoodie: response.data })
        }
      } catch (error) {
        console.error('Ошибка при получении данных с сервера:', error)
      } finally {
        set({ loading: false })
      }
   },

}))
