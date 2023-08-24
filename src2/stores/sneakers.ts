import { create } from "zustand"
import axios from "axios";
import { BrandsProps, ProductsProps, useSneakersProps } from "../models/types";

export const useSneakers = create<useSneakersProps>(set => ({
  sneakers: [],
  sneaker: null,
  loading: true,
  async getSneakers() {
    try {
      const response = await axios.get('http://localhost:3001/sneakers')
      set({ sneakers: await response.data })
    } catch (error) {
      console.error('Ошибка при получении данных с сервера:', error)
    } finally {
      set({ loading: false })
    }
  },

  async getLimiteSneakers(limit, offset) {
    try {
      const response = await axios.get('http://localhost:3001/sneakers', {
        params: { _limit: limit, _offset: offset },
      })
      set({ sneakers: await response.data })
    } catch (error) {
      console.error('Ошибка при получении данных с сервера:', error)
      set({ sneakers: [] })
    } finally {
      set({ loading: false })
    }
  },

  async getOneSneaker(productId) {
    try {
      const response = await axios.get(`http://localhost:3001/sneakers/${productId}`)
      set({ sneaker: response.data })
    } catch (error) {
      console.error('Ошибка при получении данных с сервера:', error)
    } finally {
      set({ loading: false })
    }
  }

}
))
