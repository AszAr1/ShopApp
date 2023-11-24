import React from "react";
import { ProductsProps } from "./products";

export interface useFavoriteProps {
    favorites: ProductsProps[];
    loading: boolean;
    setFavorite: () => void;
    clearFavorites: () => void,
    deleteFavorite: (productId: string) => void;
}
