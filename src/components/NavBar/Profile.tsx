import React from "react";
import {CgProfile} from 'react-icons/cg'
import {ProfileProps} from "../../models/types";

function Profile ({open, isOpen, className}:ProfileProps) {
    return (
        <>
            <div
                className={`${className} flex justify-between items-center rounded-xl border-black border-2 shadow-md p-3 
                transition duration-500 ${open ? '-translate-y-2' : 'translate-y-0'}`}
                onClick={isOpen}
            >
                <div>
                    <div className={`bg-black w-6 h-0.5 
                    transition-all duration-300 ease-in-out ${open ? 'rotate-45 translate-y-1' : '-translate-y-0.5'}`}></div>
                    <div className={`${open ? 'opacity-0' : 'opacity-100'} transition duration-100 bg-black w-6 h-0.5 my-0.5`}></div>
                    <div className={`bg-black w-6 h-0.5
                    transition-all duration-300 ease-in-out ${open ? '-rotate-45 -translate-y-1' : 'translate-y-0.5'}
                    `}></div>
                </div>
                <div>
                    <CgProfile className={`text-2xl ml-2`}/>
                </div>
            </div>
        </>
    )
}

export default Profile