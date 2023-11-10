import React, { useState } from "react";
import {BiSearchAlt} from "react-icons/bi";
import { useSearch } from "../../stores/search";

function Search () {
    const [request, setRequest] = useState<string>("")
    const find = useSearch(state => state.searchProduct)

    function search (){
        find(request)
    }

    return(
        <>
            <div className="flex justify-center items-center bg-black rounded-lg p-1">
                <div className="p-2 rounded-lg bg-black text-white hover:bg-white hover:text-black"><BiSearchAlt className="text-2xl"/></div>
                <input
                value={request} 
                onChange={(e) => setRequest(e.target.value)}
                onBeforeInput={search}
                type="text" 
                placeholder={'Search'} 
                className={`hidden border-solid border-2 border-black laptop:block rounded-lg p-2 outline-none text-black w-[300px]`}
                />
            </div>
            
        </>
    )
}

export default Search