import React, { useState } from "react";
import { BiSearchAlt } from "react-icons/bi";
import { useSearch } from "../../stores/search";

import { SearchModal } from "../SearchModal/SearchModal";

interface Props {
    isModalSearch: boolean
}

function Search({isModalSearch}: Props) {
    let request = useSearch(state => state.request)
    const setRequest = useSearch(state => state.setRequest)
    const find = useSearch((state) => state.searchProduct);
    const products = useSearch(state => state.products)
    const [open, setOpen] = useState(false)

    function OnChangeInput (input: string) {
        if(isModalSearch){
            setRequest(input)
        } else {
            setRequest(input)
            setOpen(true)
        }
    } 

    function closeModal (){
        setOpen(false)
        setRequest("")
    }


    return (
        <>
            <div className={`flex items-center justify-center rounded-lg bg-black p-1 ${isModalSearch ? 'w-full' : ''}`}>
                <button onClick={() => setOpen(!isModalSearch ? true : false)} className="rounded-lg bg-black p-2 text-white hover:bg-white hover:text-black">
                    <BiSearchAlt className="text-2xl" />
                </button>
                <input
                    value={request}
                    onChange={(e) => OnChangeInput(e.target.value)}
                    onBeforeInput={() => find(request)}
                    type="text"
                    placeholder={"Search"}
                    className={` ${isModalSearch ? 'w-full' : ' laptop:block hidden w-[300px]'} rounded-lg border-2 border-solid border-black p-2 text-black outline-none`}
                />
            </div>
            {open &&
                <SearchModal closeModal={closeModal} products={products}/>
            }
        </>
    );
}

export default Search;
