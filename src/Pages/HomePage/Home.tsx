import React, { useEffect, useState, memo } from "react";
import Intro from "./Intro";
import Card from "../../components/UI/Card";
import Button from "../../components/UI/Button";
import { Link } from "react-router-dom";
import { useSneakers } from "../../stores/sneakers";
import { useHoodies } from "../../stores/hoodies";

function Home() {

  const sneakers = useSneakers(state => state.sneakers)
  const getSneakers = useSneakers(state => state.getLimiteSneakers)
  const hoodies = useHoodies(state => state.hoodies)
  const getHoodies = useHoodies(state => state.getLimitedHoodies)
  
  useEffect(() => {
    getHoodies(6,0)
    getSneakers(6, 0)
  }, [])

  return (
    <>
      <Intro />
      <div className="mt-20 flex px-6 laptop:px-24 justify-center items-start flex-col">
        <Link to={`/sneakers`} className={`text-5xl font-bold font-mono mb-10`}>Our sneakers</Link>
        <div className="grid grid-cols-1 laptop:grid-cols-3 gap-4">
          {sneakers.map((sneak) => (
            <Card key={sneak.id} product={sneak} />
          ))}
        </div>
        <Link to={`/sneakers`} className={`text-xl font-bold w-full`}>
          <Button className={`w-full p-3 my-4
                     text-white bg-black rounded-lg border-2 border-black
                     transition duration-500 hover:bg-white hover:text-black`}>
            See more
          </Button>
        </Link>
      </div>
      <div className="mt-20 flex px-6 laptop:px-24 justify-center items-start flex-col">
        <Link to={'/hoodie'} className={'text-5xl font-bold font-mono mb-10'}>Our hoodie</Link>
        <div className={'grid grid-cols-1 laptop:grid-cols-3 gap-4'}>
          {hoodies.map((hoodie) => (
            <Card key={hoodie.id} product={hoodie} />
          ))}
        </div>
        <Link to={`/hoodie`} className={`text-xl font-bold w-full`}>
          <Button className={`w-full p-3 my-4
                     text-white bg-black rounded-lg border-2 border-black
                     transition duration-500 hover:bg-white hover:text-black`}>
            See more
          </Button>
        </Link>
      </div>
    </>
  )


}

export default Home
