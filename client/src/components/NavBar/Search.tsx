import React from "react";
import Input from "../UI/Input";
import {BiSearchAlt} from "react-icons/bi";

function Search () {
    return(
        <>
            <Input placeholder={'Search'} className={`bg-black p-1 rounded-xl text-white`}
                   InputClassName={'hidden sm:block rounded-lg p-2 outline-none text-black w-[300px]'}
                   ChildrenClassName={'p-2 transition duration-500 hover:bg-white' +
                       ' hover:text-black rounded-lg'}
            ><BiSearchAlt className={`text-2xl`}/></Input>
        </>
    )
}

export default Search