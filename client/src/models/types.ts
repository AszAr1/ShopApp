import React from "react";

export interface InputProps {
  placeholder?: string,
  className?: string,
  children?: React.ReactNode,
  InputClassName?: string,
  ChildrenClassName?: string
}

export interface LinksProps {
  id: number,
  title: string,
  link: string,
  icon: React.ReactNode
}

export interface LinksItemsProps {
  className?: string,
  classNameLi?: string
}

export interface ProfileProps {
  open: boolean,
  isOpen: () => void,
  className: string
}

export interface ButtonProps {
  children: React.ReactNode,
  className: string,
}

export interface ProductsProps {
  id: number,
  image: string,
  title: string,
  categorie: string,
  price: number,
  discountPrise: number,
  description: string,
  about: string,
  sizes: []
}

export interface SneakersSizeProps {
  children?: React.ReactNode,
  className: string,
  sizes: []
}

export interface BrandsProps {
  id: string,
  title: string
}

export interface FormData {
  username: string;
  email: string;
  password: string;
}

export interface LoginData {
  email: string;
  password: string;
}

export interface useSneakersProps {
  sneakers: ProductsProps[],
  sneaker: ProductsProps | null,
  loading: boolean,
  getSneakers: () => void,
  getLimiteSneakers: (limit: number, offset: number) => void,
  getOneSneaker: (producId: string | undefined) => void
}

export interface useHoodiesProps {
  hoodies: ProductsProps[],
  hoodie: ProductsProps | null,
  loading: boolean,
  getHoodies: () => void,
  getLimitedHoodies: (limit: number, offset: number) => void,
  getOneHoodie: (productId: string | undefined) => void
}

export interface formProps {
  title: string,
  handleClick: (email: string, password: string) => void,
  underText: string,
  underText2: string,
  link: string,
  loginPage: boolean
}

export interface useAuthorizationProps {
  user: {
    email: string | null,
    id: string | null | number,
  },
  login: boolean,
  setUser: (email: string | null, id: string | number) => void,
  removeUser: () => void
}

export interface useFavoriteProps {
  favorites: ProductsProps[],
  loading: boolean,
  getFavorite: () => void,
  addFavorite: (productId: number, productType:string | undefined) => void,
  deleteFavorite: (productId: number) => void
}
