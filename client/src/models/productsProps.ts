import React from "react";

export interface ProductsProps {
    id: string;
    title: string;
    description: string;
    content: string;
    category: string;
    price: number;
    image: string;
    sizes: [];
}

export interface SneakersSizeProps {
    children?: React.ReactNode;
    className: string;
    sizes: [];
}

export interface useSneakersProps {
    sneakers: ProductsProps[];
    sneaker: ProductsProps | null;
    loading: boolean;
    getSneakers: () => void;
    getLimitedSneakers: (limit: number) => void;
    getOneSneaker: (producTitle: string | undefined) => void;
}

export interface useHoodiesProps {
    hoodies: ProductsProps[];
    hoodie: ProductsProps | null;
    loading: boolean;
    getHoodies: () => void;
    getLimitedHoodies: (limit: number) => void;
    getOneHoodie: (id: string | undefined) => void;
}
