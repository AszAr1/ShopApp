import { useEffect, useState } from "react";
import { BrandsProps } from "../../models/types";
import axios from "axios";

function Brands() {
    const [brands, setBrands] = useState<BrandsProps[]>([]);
    return (
        <>
            <div
                className={`my-4 flex flex-col items-center justify-between sm:my-0`}
            >
                <h1 className={`my-2 text-xl font-bold`}>Наши бренды</h1>
                <div className={`flex flex-row items-center justify-center`}>
                    {brands.map((brand) => (
                        <div
                            key={brand.id}
                            className={`mx-2 text-lg font-bold`}
                        >
                            {brand.title}
                        </div>
                    ))}
                </div>
            </div>
        </>
    );
}

export default Brands;
