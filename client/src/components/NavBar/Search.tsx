import React, { useState } from "react";
import { BiSearchAlt } from "react-icons/bi";
import { useSearch } from "../../stores/search";

function Search() {
    const [request, setRequest] = useState<string>("");
    const find = useSearch((state) => state.searchProduct);

    function search() {
        find(request);
    }

    return (
        <>
            <div className="flex items-center justify-center rounded-lg bg-black p-1">
                <div className="rounded-lg bg-black p-2 text-white hover:bg-white hover:text-black">
                    <BiSearchAlt className="text-2xl" />
                </div>
                <input
                    value={request}
                    onChange={(e) => setRequest(e.target.value)}
                    onBeforeInput={search}
                    type="text"
                    placeholder={"Search"}
                    className={`laptop:block hidden w-[300px] rounded-lg border-2 border-solid border-black p-2 text-black outline-none`}
                />
            </div>
        </>
    );
}

export default Search;
