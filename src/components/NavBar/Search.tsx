import React from "react";
import Input from "../UI/Input";
import {BiSearchAlt} from "react-icons/bi";

function Search () {
    return(
        <>
            <div className="flex justify-center items-center bg-black rounded-lg p-1">
                <div className="p-2 rounded-lg bg-black text-white hover:bg-white hover:text-black"><BiSearchAlt className="text-2xl"/></div>
                <input placeholder={'Search'} className={`hidden border-solid border-2 border-black laptop:block rounded-lg p-2 outline-none text-black w-[300px]`}/>
            </div>
            
        </>
    )
}

export default Search