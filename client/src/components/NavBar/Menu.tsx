import React from "react";

interface Props {
    children: React.ReactNode;
    open: boolean;
    // className:string
}
function Menu({ children, open }: Props) {
    return (
        <>
            <div
                className={`${
                    open ? "block" : "hidden"
                } laptop:hidden absolute right-6 top-20 z-10 flex rounded-xl bg-black p-4 text-white`}
            >
                {children}
            </div>
        </>
    );
}

export default Menu;
