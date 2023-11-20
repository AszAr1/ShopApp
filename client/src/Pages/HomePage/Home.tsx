import React, { useEffect, useState, memo } from "react";
import Intro from "./Intro";
import Card from "../../components/UI/Card";
import Button from "../../components/UI/Button";
import { Link } from "react-router-dom";
import { useSneakers } from "../../stores/sneakers";
import { useHoodies } from "../../stores/hoodies";
import { SneakersService } from "../../service/SneakersService";

function Home() {

    const sneakers = useSneakers((state) => state.sneakers);
    const getSneakers = useSneakers((state) => state.getLimitedSneakers);
    const hoodies = useHoodies((state) => state.hoodies);
    const getHoodies = useHoodies((state) => state.getLimitedHoodies);

    useEffect(() => {
        getHoodies(6);
        getSneakers(6);
    }, []);

    return (
        <>
            <Intro />
            <div className="laptop:px-24 mt-20 flex flex-col items-start justify-center px-6">
                <Link
                    to={`/sneakers`}
                    className={`mb-10 font-mono text-5xl font-bold`}
                >
                    Our sneakers
                </Link>
                <div className="laptop:grid-cols-3 grid grid-cols-1 gap-4">
                    {sneakers.map((sneak) => (
                        <Card key={sneak.id} product={sneak} />
                    ))}
                </div>
                <Link to={`/sneakers`} className={`w-full text-xl font-bold`}>
                    <Button
                        className={`my-4 w-full rounded-lg
                     border-2 border-black bg-black p-3 text-white
                     transition duration-500 hover:bg-white hover:text-black`}
                    >
                        See more
                    </Button>
                </Link>
            </div>
            <div className="laptop:px-24 mt-20 flex flex-col items-start justify-center px-6">
                <Link
                    to={"/hoodie"}
                    className={"mb-10 font-mono text-5xl font-bold"}
                >
                    Our hoodie
                </Link>
                <div className={"laptop:grid-cols-3 grid grid-cols-1 gap-4"}>
                    {hoodies.map((hoodie) => (
                        <Card key={hoodie.id} product={hoodie} />
                    ))}
                </div>
                <Link to={`/hoodie`} className={`w-full text-xl font-bold`}>
                    <Button
                        className={`my-4 w-full rounded-lg
                     border-2 border-black bg-black p-3 text-white
                     transition duration-500 hover:bg-white hover:text-black`}
                    >
                        See more
                    </Button>
                </Link>
            </div>
        </>
    );
}

export default Home;
