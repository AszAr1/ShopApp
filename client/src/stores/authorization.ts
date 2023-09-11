import { create } from "zustand"
import { useAuthorizationProps } from "../models/types"
import { devtools, persist } from "zustand/middleware"

export const useAuthorization = create<useAuthorizationProps>()(devtools(persist((set => ({
  user: {
    name: null,
    email: null,
    id: null
  },
  login: false,

  setUser(name, email, id) {
    set({
      user: {
        name: name,
        email: email,
        id: id
      },
      login: true
    })
  },

  removeUser() {
    set({
      user: {
        name: null,
        email: null,
        id: null
      },
      login: false
    })
  }

})), { name: 'user1', version: 1 })))
