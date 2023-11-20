import React from "react";
import { CgProfile } from "react-icons/cg";
import { ProfileProps } from "../../models/types";

function Profile({ open, isOpen, className }: ProfileProps) {
    return (
        <>
            <div
                className={`${className} flex items-center justify-between rounded-xl border-2 border-black p-3 shadow-md
                transition duration-500 ${
                    open ? "-translate-y-2" : "translate-y-0"
                }`}
                onClick={isOpen}
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
                <div>
                    <CgProfile className={`ml-2 text-2xl`} />
                </div>
            </div>
        </>
    );
}

export default Profile;
