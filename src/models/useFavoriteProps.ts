import React from "react";
import { ProductsProps } from "./products";

export interface useFavoriteProps {
    favorites: ProductsProps[],
    loading: boolean,
    getFavorite: () => void,
    addFavorite: (productId: number, productType: string | undefined) => void,
    deleteFavorite: (productId: number) => void
}
  