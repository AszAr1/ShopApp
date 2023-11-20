import React, { memo, useEffect, useState } from "react";
import Card from "../../components/UI/Card";
import { useHoodies } from "../../stores/hoodies";

function SneakersPage() {
    const hoodies = useHoodies((state) => state.hoodies);
    const getHoodies = useHoodies((state) => state.getHoodies);

    useEffect(() => {
        getHoodies();
    }, []);

    return (
        <>
            <div className="w-full">
                <div
                    className={`desktop:grid-cols-4 laptop:gap-4 laptop:px-10 my-20 grid grid-cols-1 gap-8 px-6`}
                >
                    {hoodies.map((hoodie) => (
                        <Card key={hoodie.id} product={hoodie} />
                    ))}
                </div>
            </div>
        </>
    );
}

export default memo(SneakersPage);
