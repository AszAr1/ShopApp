import React from "react";
//@ts-ignore
function Description({ children }) {
    return (
        <>
            <div className={`mt-20 h-full w-full bg-gray-400`}>
                <div className={`p-4`}>
                    <div
                        className={`flex items-center justify-center pt-10 text-4xl font-bold`}
                    >
                        <p>Описание</p>
                    </div>
                    <div
                        className={`laptop:px-24 px-6 py-10 font-mono text-xl`}
                    >
                        {children}
                    </div>
                </div>
            </div>
        </>
    );
}

export default Description;
