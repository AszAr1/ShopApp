import React, { useState } from "react";
import Search from "./Search";
import Profile from "./Profile";
import Menu from "./Menu";
import LinksList from "./LinksList";
import { Link } from 'react-router-dom';
import { BsCartCheck } from "react-icons/bs";
import { HiOutlineInboxStack } from "react-icons/hi2";
import { MdOutlineFavoriteBorder } from "react-icons/md";
import { CgProfile } from "react-icons/cg";
import { useAuthorization } from "../../stores/authorization";

function NavBar() {

  const [open, isOpen] = useState(false)
  const isLoggin = useAuthorization(state => state.login)

  function handleOpen() {
    isOpen((prev) => !prev)
  }

  return isLoggin ? (
    <>
      <div className={`flex justify-between items-center laptop:px-24 px-6 py-7 w-full border-b-2 border-black`}>
        <a href={`/`} className={`hidden laptop:block font-bold text-2xl font-mono`}>Sneakers</a>

        <Search />

        <a href={`/`} className={`block laptop:hidden font-bold text-2xl font-mono`}>Sneakers</a>
        {/* <LinksList className={`hidden laptop:flex justify-center items-center`}
          classNameLi={`mx-2 transition duration-500 hover:scale-110`} /> */}
        <div className="hidden laptop:flex justify-center items-center">
          <ul className="flex flex-row">
            <li className={`mx-2 transition duration-500 hover:scale-110 my-2 flex justify-between items-center p-1 rounded-xl
                               hover:bg-white hover:text-black`}>
              <div className={`mr-2`}><HiOutlineInboxStack /></div>
              <h1><Link to={`/order`}>Orders</Link></h1>
            </li>
            <li className={`mx-2 transition duration-500 hover:scale-110 my-2 flex justify-between items-center p-1 rounded-xl
                               hover:bg-white hover:text-black`}>
              <div className={`mr-2`}><BsCartCheck /></div>
              <h1><Link to={`/cart`}>Cart</Link></h1>
            </li>
            <li className={`mx-2 transition duration-500 hover:scale-110 my-2 flex justify-between items-center p-1 rounded-xl
                              hover:bg-white hover:text-black`}>
              <div className={`mr-2`}><MdOutlineFavoriteBorder /></div>
              <h1><Link to={`/favorites`}>Favorites</Link></h1>
            </li>
            <li className={`mx-2 transition duration-500 hover:scale-110 my-2 flex justify-between items-center p-1 rounded-xl
                              hover:bg-white hover:text-black`}
            >
              <div className={`mr-2`}><CgProfile /></div>
              <h1><Link to={`/profile`}>Profile</Link></h1>
            </li>
          </ul>
        </div>
        <Profile className={`block laptop:hidden`} open={open} isOpen={handleOpen} />
        <Menu open={open}><LinksList /></Menu>
      </div>
    </>
  ) : (
    <div className={`flex justify-between items-center laptop:px-24 px-6 py-7 w-full border-b-2 border-black`}>
      <a href={`/`} className={`hidden laptop:block font-bold text-2xl font-mono`}>Sneakers</a>

      <Search />

      <a href={`/`} className={`block laptop:hidden font-bold text-2xl font-mono`}>Sneakers</a>

      <div className={`laptop:flex hidden justify-center items-center flex-row`}>
        <Link to={'/login'}>
          <button className={`p-2 w-[140px] bg-black rounded-md border-2 border-solid border-black
          text-white font-bold font-mono duration-300 transition hover:bg-white hover:text-black hover:scale-105`}>Log In</button>
        </Link>
        <Link to={'/register'}>
          <button className={`p-2 w-[140px] ml-5 bg-black rounded-md border-2 border-solid border-black
          text-white font-bold font-mono duration-300 transition hover:bg-white hover:text-black hover:scale-105`}>Register</button>
        </Link>
      </div>

      <div className={`laptop:hidden flex justify-between items-center rounded-xl border-black border-2 shadow-md p-3
      transition duration-500 ${open ? '-translate-y-2' : 'translate-y-0'}`}
        onClick={handleOpen}
      >
        <div>
          <div className={`bg-black w-6 h-0.5
          transition-all duration-300 ease-in-out ${open ? 'rotate-45 translate-y-1' : '-translate-y-0.5'}`}></div>
          <div className={`${open ? 'opacity-0' : 'opacity-100'} transition duration-100 bg-black w-6 h-0.5 my-0.5`}></div>
          <div className={`bg-black w-6 h-0.5
          transition-all duration-300 ease-in-out ${open ? '-rotate-45 -translate-y-1' : 'translate-y-0.5'}
          `}></div>
        </div>

      </div>

      <div className={`${open ? 'block' : 'hidden'} flex justify-center items-center flex-col laptop:hidden bg-black p-6 absolute top-20 left-[201px] text-white rounded-xl`}>
        <button>
          <Link to={'/login'} className={`p-2 w-[140px] bg-white rounded-md border-2 border-solid border-black
          text-black font-bold font-mono duration-300 transition hover:bg-white hover:text-black hover:scale-105`}>
            Log In
          </Link>
        </button>
        <Link to={'/register'} className={`p-2 w-[140px] mt-5 bg-white rounded-md border-2 border-solid border-black
          text-black font-bold font-mono duration-300 transition hover:bg-white hover:text-black hover:scale-105`}>Registration</Link>
      </div>


    </div>
  )
}

export default NavBar
