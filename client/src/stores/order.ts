import { create } from "zustand";

export const useOrder = create((set) => ({
    order: [],
    loading: true,
}));
