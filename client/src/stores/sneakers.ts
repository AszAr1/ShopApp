import { create } from "zustand"
import { useSneakersProps } from "../models/products";
import { SneakersService } from "../service/SneakersService";

export const useSneakers = create<useSneakersProps>(set => ({
  sneakers: [],
  sneaker: null,
  loading: true,

  async getSneakers() {
    try{
      SneakersService.getSneakers().then(response => set({sneakers: response.data}))
    } catch (e){
      console.error(e)
      set({ sneakers: [] })
    } finally {
      set({ loading: false })
    }
  },

  async getLimitedSneakers(limit) {
    try {
      SneakersService.getLimitedSneakers(limit)
      .then(response => set({sneakers: response.data}))
    } catch (error) {
      console.error('Ошибка при получении данных с сервера:', error)
      set({ sneakers: [] })
    } finally {
      set({ loading: false })
    }
  },

  async getOneSneaker(id) {
    try {
      SneakersService.getOneSneaker(id).then(response => set({sneaker: response.data}))
    } catch (e){
      console.error(e)
    } finally {
      set({loading: false})
    }
  }

}
))
