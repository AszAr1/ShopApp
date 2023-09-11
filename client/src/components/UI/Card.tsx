import React, {memo} from "react";
import Button from "./Button";
import { Link } from 'react-router-dom';
import {AiOutlineStar} from 'react-icons/ai'
import { useFavorite } from "../../stores/favorite";

//@ts-ignore
function Card ({product}) {

    const favorites = useFavorite(state => state.favorites);
    const isFavorite = favorites.some(item => item.id === product.id);
    const favoriteAdd = useFavorite(state => state.addFavorite)
    const removeFavorite = useFavorite(state => state.deleteFavorite)


    function toggleFavorite(productId: number, productType: string) {
        if (isFavorite) {
            removeFavorite(productId);
        } else {
            favoriteAdd(productId, productType);
        }
    }

    return (
        <>
                <div className="flex justify-center items-start flex-col px-3 py-2 shadow-2xl border-2 border-gray-400 rounded-lg ">

                    <div className="rounded-lg overflow-hidden flex justify-center items-center max-w-[800px] max-h-[300px]">
                        <img src={product.image} alt="image"></img>
                    </div>

                    <div className="flex justify-center flex-col items-start mt-auto pt-2">
                        <h1 className="font-bold text-xl">
                            {product.title}
                        </h1>
                        <p className="text-lg">
                            Category: <span className="font-bold">{product.category}</span>
                        </p>
                        <p>
                            Price: <span className="font-bold">{product.price}$</span>
                        </p>
                    </div>

                    <div className={`flex justify-between items-center flex-row w-full`}>
                        <Link to={`/${product.category}/${product.title.split('%20').join(' ')}`}>
                            <Button className="bg-black shadow-md border-2 border-black text-white px-3 py-2 font-bold mt-5
                            transition duration-500 hover:bg-white hover:text-black">
                                See more
                            </Button>
                        </Link>
                         <button className="bg-black shadow-md border-2 border-black text-white px-3 py-2 font-bold mt-5
                             transition duration-500 hover:bg-white hover:text-black
                         "
                         onClick={() => toggleFavorite(product.id, product.category)}
                         >
                            <AiOutlineStar className="text-2xl font-bold"/>
                         </button>

                    </div>
                    
                </div>
        </>
    )
}

export default memo(Card)
