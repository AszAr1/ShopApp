import React, { memo, useEffect } from "react";
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
      <div className={`grid grid-cols-1 sm:grid-cols-4 gap-8 sm:gap-4 my-20 px-6 sm:px-10`}>
        {sneakers.map((sneaker) => (
          <Card key={sneaker.id} product={sneaker} />
        ))}
      </div>
    </>
  )
}

export default memo(SneakersPage)
