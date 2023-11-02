import { create } from "zustand"
import { InfoProps, useAuthorizationProps } from "../models/authProps"
import { devtools, persist } from "zustand/middleware"
import axios from "axios"
import AuthService from "../service/AuthService"



export const useAuthorization = create<useAuthorizationProps>()(devtools(persist((set => ({
  user: {
    username: null,
    email: null
  },
  login: false,

  async loginUser(name, email, password) {

    // const user = {
    //   username: name,
    //   password: password
    // }

    // const resonse = axios.post('http://127.0.0.1:8000/user/login/', user)
    //   .then(function (response) {
    //     const info = axios.get<InfoProps>(`http://127.0.0.1:8000/user/${user.username}`)
    //       .then(
    //         function (info) {
    //           set({
    //             user: {
    //               name: info.data.username,
    //               email: info.data.email,
    //             },
    //             login: true
    //           })
    //         }
    //       ).catch(
    //         function (e) {
    //           console.error(e)
    //         }
    //       )
    //     console.log(response);
    //   })
    //   .catch(function (error) {
    //     console.log(error);
    //   })

    try{
      const response = await AuthService.login(name, password)
      localStorage.setItem('token', response.data.accesToken)
      set({user: response.data.user})
    } catch (e){
      console.error(e)
    }
  },

  async registration (name, email, password){
    try{
      const response = await AuthService.register(name, email, password)
      localStorage.setItem('token', response.data.accesToken)
      set({user: response.data.user})
    } catch (e){
      console.error(e)
    }
  },

  async logout () {
    try{
      const response = await AuthService.logout()
      localStorage.removeItem('token')
      set({user: {
        username: null,
        email: null
      } })
    } catch (e){
      console.error(e)
    }
  }


})), { name: 'user2', version: 2 })))
