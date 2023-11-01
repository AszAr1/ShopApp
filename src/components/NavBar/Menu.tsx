import React from "react";

interface Props {
    children:React.ReactNode,
    open:boolean
    // className:string
}
function Menu ({children, open}:Props) {
    return(
        <>
            <div className={`${open ? 'block' : 'hidden'} z-10 flex laptop:hidden bg-black p-4 absolute top-20 right-6 text-white rounded-xl`}>
                {children}
            </div>
        </>
    )
}

export default Menu