import { create } from "zustand"
import { useAuthorizationProps } from "../models/authProps"
import { devtools, persist } from "zustand/middleware"
import AuthService from "../service/AuthService"

export const useAuthorization = create<useAuthorizationProps>()(devtools((set => ({
  user: {
    username: null,
    email: null
  },
  isRegister: false,
  login: false,


  async loginUser(user) {
    try{
      set({
        user: {
          username: user.username,
          email: user.email
        },
        login: true
      })
    } catch (e){
      console.error(e)
    }
  },

  async registration (name, email){
    try{
      set({
        user: {
          username: name,
          email: email
        },
        login: true
      })
    } catch (e){
      console.error(e)
    }
  },

  async logout () {
    try{
      set({user: {
        username: null,
        email: null
      },
      login: false
    })
    } catch (e){
      console.error(e)
    }
  }


}))))
