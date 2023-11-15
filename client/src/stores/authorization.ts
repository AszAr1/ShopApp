import { create } from "zustand"
import { useAuthorizationProps } from "../models/authProps"
import { devtools, persist } from "zustand/middleware"
import AuthService from "../service/AuthService"

export const useAuthorization = create<useAuthorizationProps>()(devtools(persist((set => ({
  user: {
    username: null,
    email: null
  },
  isRegister: false,
  login: false,

  async loginUser(user, access) {
    try{
      // const response = await AuthService.login(name, password)
      localStorage.setItem('token', access)
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

  async registration (name, email, access){
    try{
      // const response = await AuthService.register(name, email, password)
      localStorage.setItem('token', access)
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
      // const response = await AuthService.logout()
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


})), { name: 'user', version: 1 })))
