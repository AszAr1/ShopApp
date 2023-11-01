import React from "react";
import { LinksItemsProps, LinksProps } from "../../models/types";
import { BsCartCheck } from "react-icons/bs";
import { HiOutlineInboxStack } from "react-icons/hi2";
import { MdOutlineFavoriteBorder } from "react-icons/md";
import { CgProfile } from "react-icons/cg";
import { Link } from 'react-router-dom';

const links: LinksProps[] = [

  {
    id: 1,
    title: 'Orders',
    link: 'order',
    icon: <HiOutlineInboxStack />
  },
  {
    id: 2,
    title: 'Cart',
    link: 'cart',
    icon: <BsCartCheck />
  },
  {
    id: 3,
    title: 'Favorites',
    link: 'favorites',
    icon: <MdOutlineFavoriteBorder />
  },
  {
    id: 4,
    title: 'Profile',
    link: 'profile',
    icon: <CgProfile />
  },
  {
    id: 5,
    title: 'Login',
    link: 'login',
    icon: <CgProfile />
  }
]


function LinksList({ className, classNameLi }: LinksItemsProps) {
  return (
    <>
      <div className={`${className}`}>
        {links.map((link) => (
          <ul key={link.id}>
            <li className={`${classNameLi} my-2 flex justify-between items-center p-1 rounded-xl
                transition duration-500 hover:bg-white hover:text-black`}>
              <div className={`mr-2`}>{link.icon}</div>
              <h1><Link to={`/${link.link}`}>{link.title}</Link></h1>
            </li>
          </ul>
        ))}
      </div>
    </>
  )
}

export default LinksList