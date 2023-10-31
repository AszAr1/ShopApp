import { create } from "zustand"
import { useAuthorizationProps } from "../models/types"
import { devtools, persist } from "zustand/middleware"



export const useAuthorization = create<useAuthorizationProps>()(devtools(persist((set => ({
  user: {
    name: null,
    email: null
  },
  login: false,

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
  }

})), { name: 'user1', version: 1 })))
