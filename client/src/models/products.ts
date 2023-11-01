import React from "react";

export interface ProductsProps {
    id: string,
    // image: string,
    // title: string,
    // category: string,
    // price: number,
    // discountPrise: number,
    // description: string,
    // about: string,
    // sizes: []
    title: string,
    description: string,
    content: string,
    category: string,
    price: number,
    image: string,
    sizes: []
}

export interface SneakersSizeProps {
    children?: React.ReactNode,
    className: string,
    sizes: []
}

export interface useSneakersProps {
    sneakers: ProductsProps[],
    sneaker: ProductsProps | null,
    loading: boolean,
    getSneakers: () => void,
    getLimiteSneakers: (limit: number, offset: number) => void,
    getOneSneaker: (producTitle: string | undefined) => void
  }
  
  export interface useHoodiesProps {
    hoodies: ProductsProps[],
    hoodie: ProductsProps | null,
    loading: boolean,
    getHoodies: () => void,
    getLimitedHoodies: (limit: number, offset: number) => void,
    getOneHoodie: (productId: string | undefined) => void
  }
