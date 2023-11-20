import React from "react";
import { ProductsProps } from "./products";

export interface useSearchProps {
    products: ProductsProps[];
    searchProduct: (proudtcName: string) => void;
}
