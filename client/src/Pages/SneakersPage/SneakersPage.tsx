import React, { memo, useEffect, useState } from "react";
import Card from "../../components/UI/Card";
import { useSneakers } from "../../stores/sneakers";
import axios from "axios";
import { ProductsProps } from "../../models/types";


function SneakersPage() {
 
  const sneakers = useSneakers(state => state.sneakers)
  const getSneakers = useSneakers(state => state.getSneakers)
  // const [sneakers, setSneakers] = useState<ProductsProps[]>([])

  useEffect(() => {
    getSneakers()
    // axios.get('https://localhost:3001/sneakers').then(items => setSneakers(items.data))
  }, [])

  // if(!sneakers) {
  //   <div>loading</div>
  // }

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
