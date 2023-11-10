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

  async loginUser(user) {

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
      // const response = await AuthService.login(name, password)
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
      // const response = await AuthService.register(name, email, password)
      
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
      // localStorage.removeItem('token')
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
