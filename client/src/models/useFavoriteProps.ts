import React from "react";
import { ProductsProps } from "./products";

export interface useFavoriteProps {
    favorites: ProductsProps[],
    loading: boolean,
    setFavorite: (data: ProductsProps[] | undefined) => void,
    deleteFavorite: (productId: string) => void
}
  