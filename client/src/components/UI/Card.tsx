import React, { memo } from "react";
import Button from "./Button";
import { Link } from "react-router-dom";
import { AiOutlineStar } from "react-icons/ai";
import { useFavorite } from "../../stores/favorite";
import { FavoritesService } from "../../service/FavoritesService";

//@ts-ignore
function Card({ product }) {
    const favorites = useFavorite((state) => state.favorites);
    // const isFavorite = favorites.some((item) => item.id === product.id);
    const removeFavorite = useFavorite((state) => state.deleteFavorite);
    const setFavorites = useFavorite((state) => state.setFavorite);

    function toggleFavorite(productId: string) {
        // if (isFavorite) {
        //     removeFavorite(productId);
        // } else {
        console.log(productId);
        FavoritesService.addFavorites(productId)
            .then((data) => setFavorites(data.data))
            .catch((e) => console.error(e));
        // }
    }

    return (
        <>
            <div className="flex flex-col items-start justify-center rounded-lg border-2 border-gray-400 px-3 py-2 shadow-2xl ">
                <div className="flex max-h-[300px] max-w-[800px] items-center justify-center overflow-hidden rounded-lg">
                    <img src={product.image} alt="image"></img>
                </div>

                <div className="mt-auto flex flex-col items-start justify-center pt-2">
                    <h1 className="text-xl font-bold">{product.title}</h1>
                    <p className="text-lg">
                        Category:{" "}
                        <span className="font-bold">{product.category}</span>
                    </p>
                    <p>
                        Price:{" "}
                        <span className="font-bold">{product.price}$</span>
                    </p>
                </div>

                <div
                    className={`flex w-full flex-row items-center justify-between`}
                >
                    <Link to={`/products/${product.id}`}>
                        <Button
                            className="mt-5 border-2 border-black bg-black px-3 py-2 font-bold text-white shadow-md
                            transition duration-500 hover:bg-white hover:text-black"
                        >
                            See more
                        </Button>
                    </Link>
                    <button
                        className="mt-5 border-2 border-black bg-black px-3 py-2 font-bold text-white shadow-md
                             transition duration-500 hover:bg-white hover:text-black
                         "
                        onClick={() => toggleFavorite(product.id)}
                    >
                        <AiOutlineStar className="text-2xl font-bold" />
                    </button>
                </div>
            </div>
        </>
    );
}

export default memo(Card);
