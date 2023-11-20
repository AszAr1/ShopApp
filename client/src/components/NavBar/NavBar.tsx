import React, { useState } from "react";
import Search from "./Search";
import Profile from "./Profile";
import Menu from "./Menu";
import LinksList from "./LinksList";
import { Link } from "react-router-dom";
import { BsCartCheck } from "react-icons/bs";
import { HiOutlineInboxStack } from "react-icons/hi2";
import { MdOutlineFavoriteBorder } from "react-icons/md";
import { CgProfile } from "react-icons/cg";
import { useUser } from "../../stores/user";

function NavBar() {
    const [open, isOpen] = useState(false);
    const isLoggin = useUser((state) => state.login);

    function handleOpen() {
        isOpen((prev) => !prev);
    }

    return isLoggin ? (
        <>
            <div
                className={`laptop:px-24 flex w-full items-center justify-between border-b-2 border-black px-6 py-7`}
            >
                <a
                    href={`/`}
                    className={`laptop:block hidden font-mono text-2xl font-bold`}
                >
                    Sneakers
                </a>

                <Search />

                <a
                    href={`/`}
                    className={`laptop:hidden block font-mono text-2xl font-bold`}
                >
                    Sneakers
                </a>
                {/* <LinksList className={`hidden laptop:flex justify-center items-center`}
          classNameLi={`mx-2 transition duration-500 hover:scale-110`} /> */}
                <div className="laptop:flex hidden items-center justify-center">
                    <ul className="flex flex-row">
                        <li
                            className={`mx-2 my-2 flex items-center justify-between rounded-xl p-1 transition duration-500 hover:scale-110
                               hover:bg-white hover:text-black`}
                        >
                            <div className={`mr-2`}>
                                <HiOutlineInboxStack />
                            </div>
                            <h1>
                                <Link to={`/order`}>Orders</Link>
                            </h1>
                        </li>
                        <li
                            className={`mx-2 my-2 flex items-center justify-between rounded-xl p-1 transition duration-500 hover:scale-110
                               hover:bg-white hover:text-black`}
                        >
                            <div className={`mr-2`}>
                                <BsCartCheck />
                            </div>
                            <h1>
                                <Link to={`/cart`}>Cart</Link>
                            </h1>
                        </li>
                        <li
                            className={`mx-2 my-2 flex items-center justify-between rounded-xl p-1 transition duration-500 hover:scale-110
                              hover:bg-white hover:text-black`}
                        >
                            <div className={`mr-2`}>
                                <MdOutlineFavoriteBorder />
                            </div>
                            <h1>
                                <Link to={`/favorites`}>Favorites</Link>
                            </h1>
                        </li>
                        <li
                            className={`mx-2 my-2 flex items-center justify-between rounded-xl p-1 transition duration-500 hover:scale-110
                              hover:bg-white hover:text-black`}
                        >
                            <div className={`mr-2`}>
                                <CgProfile />
                            </div>
                            <h1>
                                <Link to={`/profile`}>Profile</Link>
                            </h1>
                        </li>
                    </ul>
                </div>
                <Profile
                    className={`laptop:hidden block`}
                    open={open}
                    isOpen={handleOpen}
                />
                <Menu open={open}>
                    <LinksList />
                </Menu>
            </div>
        </>
    ) : (
        <div
            className={`laptop:px-24 flex w-full items-center justify-between border-b-2 border-black px-6 py-7`}
        >
            <a
                href={`/`}
                className={`laptop:block hidden font-mono text-2xl font-bold`}
            >
                Sneakers
            </a>

            <Search />

            <a
                href={`/`}
                className={`laptop:hidden block font-mono text-2xl font-bold`}
            >
                Sneakers
            </a>

            <div
                className={`laptop:flex hidden flex-row items-center justify-center`}
            >
                <Link to={"/login"}>
                    <button
                        className={`w-[140px] rounded-md border-2 border-solid border-black bg-black p-2
          font-mono font-bold text-white transition duration-300 hover:scale-105 hover:bg-white hover:text-black`}
                    >
                        Log In
                    </button>
                </Link>
                <Link to={"/register"}>
                    <button
                        className={`ml-5 w-[140px] rounded-md border-2 border-solid border-black bg-black p-2
          font-mono font-bold text-white transition duration-300 hover:scale-105 hover:bg-white hover:text-black`}
                    >
                        Register
                    </button>
                </Link>
            </div>

            <div
                className={`laptop:hidden flex items-center justify-between rounded-xl border-2 border-black p-3 shadow-md
      transition duration-500 ${open ? "-translate-y-2" : "translate-y-0"}`}
                onClick={handleOpen}
            >
                <div>
                    <div
                        className={`h-0.5 w-6 bg-black
          transition-all duration-300 ease-in-out ${
              open ? "translate-y-1 rotate-45" : "-translate-y-0.5"
          }`}
                    ></div>
                    <div
                        className={`${
                            open ? "opacity-0" : "opacity-100"
                        } my-0.5 h-0.5 w-6 bg-black transition duration-100`}
                    ></div>
                    <div
                        className={`h-0.5 w-6 bg-black
          transition-all duration-300 ease-in-out ${
              open ? "-translate-y-1 -rotate-45" : "translate-y-0.5"
          }
          `}
                    ></div>
                </div>
            </div>

            <div
                className={`${
                    open ? "block" : "hidden"
                } laptop:hidden absolute right-4 top-20 flex flex-col items-center justify-center rounded-xl bg-black p-6 text-white`}
            >
                <button>
                    <Link
                        to={"/login"}
                        className={`w-full rounded-md border-2 border-solid border-black bg-white p-2 px-9
          font-mono font-bold text-black transition duration-300 hover:scale-105 hover:bg-white hover:text-black`}
                    >
                        Log in
                    </Link>
                </button>
                <Link
                    to={"/register"}
                    className={`mt-5 w-full rounded-md border-2 border-solid border-black bg-white p-2
          font-mono font-bold text-black transition duration-300 hover:scale-105 hover:bg-white hover:text-black`}
                >
                    Registration
                </Link>
            </div>
        </div>
    );
}

export default NavBar;
