import React, { memo, useEffect, useState } from "react";
import Card from "../../components/UI/Card";
import { useSneakers } from "../../stores/sneakers";


function SneakersPage() {
 
  const sneakers = useSneakers(state => state.sneakers)
  const getSneakers = useSneakers(state => state.getSneakers)


  useEffect(() => {
    getSneakers()

  }, [])

  return (
    <>
      <div className={`grid grid-cols-1 laptop:grid-cols-4 gap-8 laptop:gap-4 my-20 px-6 laptop:px-10`}>
        {sneakers.map((sneaker) => (
          <Card key={sneaker.id} product={sneaker} />
        ))}
      </div>
    </>
  )
}

export default memo(SneakersPage)
