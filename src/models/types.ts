import React from "react"
import { ProductsProps } from "./products"

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

export interface BrandsProps {
  id: string,
  title: string
}

export interface formProps {
  title: string,
  handleClick: (name: string, email: string, password: string) => void,
  underText: string,
  underText2: string,
  link: string,
  loginPage: boolean
}

