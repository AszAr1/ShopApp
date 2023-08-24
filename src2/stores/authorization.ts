import { create } from "zustand"
import { useAuthorizationProps } from "../models/types"
import { devtools, persist } from "zustand/middleware"

export const useAuthorization = create<useAuthorizationProps>()(devtools(persist((set => ({
  user: {
    email: null,
    id: null
  },
  login: false,
  setUser(email, id) {
    set({
      user: {
        email: email,
        id: id
      },
      login: true
    })
  },

  removeUser() {
    set({
      user: {
        email: null,
        id: null
      },
      login: false
    })
  }

})), { name: 'user1', version: 1 })))
