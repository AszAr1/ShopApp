import axios from "axios"
import { create } from "zustand"
import { useFavoriteProps } from "../models/types"
import { immer } from "zustand/middleware/immer"
import { devtools, persist } from "zustand/middleware"

export const useFavorite = create<useFavoriteProps>()(devtools(immer((set => ({
  favorites: [],
  loading: true,

  getFavorite: async () => {
    try {
      const response = await axios.get(`http://localhost:3001/favorites`);
      if (response.data) {
        set({ favorites: await response.data, loading: false })
      }
    } catch (error) {
      console.error('Ошибка при получении данных с сервера:', error);
    }
  },

  async addFavorite(producId, productType) {
    try {
        const checkResponse = await fetch(`http://localhost:3001/favorites/${producId}`);
      
        if (checkResponse.ok) {
            console.log('Такой объект уже существует на сервере.');
        } else {
            try {
                const response = await axios.get(`http://localhost:3001/${productType}/${producId}`);
                if (response.data) {
                    try {
                        const addResponse = await axios.post(`http://localhost:3001/favorites`, response.data)
                    } catch (addError) {
                        console.error('Error Adding to Favorites:', addError);
                    }
                }
            } catch (sneakersError) {
                console.error('Error Fetching Sneakers:', sneakersError);
            }
        }
    } catch (checkError) {
        console.error('Error Checking Favorites:', checkError);
    }
  },
  
  async deleteFavorite (productId) {
    try {
      axios.delete(`http://localhost:3001/favorites/${productId}`)
      window.location.reload();
    }catch (error) {
      console.error(error)
    }
  }



  

  

  //удалять из избранного по idПродуктов

})))))
