import React, { memo, useEffect, useState } from "react";
import Card from "../../components/UI/Card";
import { useSneakers } from "../../stores/sneakers";

function SneakersPage() {
    const sneakers = useSneakers((state) => state.sneakers);
    const getSneakers = useSneakers((state) => state.getSneakers);

    useEffect(() => {
        getSneakers();
    }, []);

    return (
        <>
            <div
                className={`laptop:grid-cols-4 laptop:gap-4 laptop:px-10 my-20 grid grid-cols-1 gap-8 px-6`}
            >
                {sneakers.map((sneaker) => (
                    <Card key={sneaker.id} product={sneaker} />
                ))}
            </div>
        </>
    );
}

export default memo(SneakersPage);
