import React from "react";
import { ProductsProps } from "./productsProps";

export interface useSearchProps {
    products: ProductsProps[] | []
    request: string
    setRequest: (input:string) => void
    searchProduct: (proudtcName: string) => void
}
