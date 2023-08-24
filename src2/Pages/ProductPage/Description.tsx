import React from "react";
//@ts-ignore
function Description ({children}) {
    return (
        <>
            <div className={`bg-gray-400 w-full mt-20 h-full`}>
                <div className={`p-4`}>
                    <div className={`pt-10 flex justify-center items-center font-bold text-4xl`}>
                        <p>Описание</p>
                    </div>
                    <div className={`px-6 sm:px-24 py-10 font-mono text-xl`}>
                        {children}
                    </div>
                </div>
            </div>
        </>
    )
}

export default Description