import React, { useState } from "react";
import { SneakersSizeProps } from "../../models/products";

function SneakerSize({ children, className, sizes }: SneakersSizeProps) {
  const [activeSizes, setActiveSizes] = useState<boolean[]>(Array(sizes.length).fill(false));

  function handleClick(index: number) {
    setActiveSizes(prev => {
      const updatedState = [...prev];
      updatedState[index] = !updatedState[index];
      return updatedState;
    });
  }


  return (
    <>
      {sizes.map((size, index) => (
        <div key={index} onClick={() => handleClick(index)} className={`${activeSizes[index] ? 'bg-red-200' : 'bg-sky-100'} p-3 ${className} cursor-pointer`} >
          {size}
        </div>
      ))}
    </>
  )
}

export default SneakerSize
