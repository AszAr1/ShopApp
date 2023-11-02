import { create } from "zustand"
import { InfoProps, useAuthorizationProps } from "../models/authProps"
import { devtools, persist } from "zustand/middleware"
import axios from "axios"



export const useAuthorization = create<useAuthorizationProps>()(devtools(persist((set => ({
  user: {
    name: null,
    email: null
  },
  login: false,

  loginUser(name, email, password) {

    const user = {
      username: name,
      password: password
    }

    const resonse = axios.post('http://127.0.0.1:8000/user/login/', user)
      .then(function (response) {
        const info = axios.get<InfoProps>(`http://127.0.0.1:8000/user/${user.username}`)
          .then(
            function (info) {
              set({
                user: {
                  name: info.data.username,
                  email: info.data.email,
                },
                login: true
              })
            }
          ).catch(
            function (e) {
              console.error(e)
            }
          )
        console.log(response);
      })
      .catch(function (error) {
        console.log(error);
      })
  },

  setUser(name, email) {
    set({
      user: {
        name: name,
        email: email,
      },
      login: true
    })
  },

  removeUser() {
    set({
      user: {
        name: null,
        email: null
      },
      login: false
    })
  },

})), { name: 'user1', version: 1 })))
