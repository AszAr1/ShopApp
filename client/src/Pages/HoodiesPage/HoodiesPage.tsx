import React, { memo, useEffect, useState } from "react";
import Card from "../../components/UI/Card";
import { useHoodies } from "../../stores/hoodies";

function SneakersPage() {

  const hoodies = useHoodies(state => state.hoodies)
  const getHoodies = useHoodies(state => state.getHoodies)

  useEffect(() => {
    getHoodies()
  }, [])

  return (
    <>

      <div className="w-full">

        <div className={`grid grid-cols-1 sm:grid-cols-4 gap-8 sm:gap-4 my-20 px-6 sm:px-10`}>

          {hoodies.map((hoodie) => (
            <Card key={hoodie.id} product={hoodie} />
          ))}

        </div>

      </div>

    </>

  )
}

export default memo(SneakersPage)
