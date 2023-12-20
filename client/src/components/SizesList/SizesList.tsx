import { useState } from 'react'

type ISizesList = {
    sizes: []
}

function SizesList({sizes}: ISizesList) {
    const [activeSizes, setActiveSizes] = useState<boolean[]>(
        Array(sizes.length).fill(false),
    );

    function handleClick(index: number) {
        setActiveSizes((prev) => {
            const updatedState = [...prev];
            updatedState[index] = !updatedState[index];
            return updatedState;
        });
    }

    return (
        <>
            {sizes.map((size, index) => (
                <div
                    key={index}
                    onClick={() => handleClick(index)}
                    className={`${
                        activeSizes[index] ? "bg-red-200" : "bg-sky-100"
                    } p-3 hover:bg-red-200 cursor-pointer flex justify-center items-center`}
                >
                    {size}
                </div>
            ))}
        </>
    );
}

export default SizesList