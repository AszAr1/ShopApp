import { useState } from 'react'
import { FavoritesService } from '../../services/favorites.service';
import { UseFavorites } from '../../stores/UseFavorites';
import { Notification } from '../Notification/Notification';
import { IProducts } from '../../models/IProducts';
import { Link } from 'react-router-dom';
import { AiOutlineStar } from "react-icons/ai";

type CardProps = {
    product: IProducts
    isFavoritesPage?: boolean
}

function Card({ product, isFavoritesPage }: CardProps) {
    const setFavorites = UseFavorites((state) => state.setFavorite);
    const [showToast, setShowToast] = useState(false);
    const [done, setDone] = useState(false);

    function toggleFavorite(productId: string) {
        FavoritesService.addFavorites(productId)
            .then(() => {
                // setFavorites();
                setDone(true);
                setShowToast(true);
            })
            .catch((e) => {
                console.error(e);
                setDone(false);
                setShowToast(true);
            });
    }

    function deleteFromFavorites (productId: string) {
        console.log(productId)
        FavoritesService.removeFavorites(productId)
        .then(() => {
            setFavorites()
            setDone(true)
            setShowToast(true)
        })
        .catch(
            e => {
                console.log(e)
                setDone(false);
                setShowToast(true);
            }
        )
    }

    return (
        <>

            {showToast && (
                <Notification
                    negativeDescription="Failed to add favorite."
                    positiveDescription="successfully ˆ_ˆ"
                    setShowToast={setShowToast}
                    done={done}
                />
            )}

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

                <div className={`flex w-full flex-row items-center justify-between`}>

                    <Link to={`/products/${product.id}`}>
                        <button
                            className="mt-5 border-2 border-black bg-black px-3 py-2 font-bold text-white shadow-md
                            transition duration-500 hover:bg-white hover:text-black"
                        >
                            See more
                        </button>
                    </Link>

                    <button
                        className="mt-5 border-2 border-black bg-black px-3 py-2 font-bold text-white shadow-md
                             transition duration-500 hover:bg-white hover:text-black
                        "
                        onClick={() => {isFavoritesPage ? deleteFromFavorites(product.id) : toggleFavorite(product.id)}}
                    >
                        <AiOutlineStar className="text-2xl font-bold" />
                    </button>
                    

                </div>

            </div>

        </>
    )
}

export default Card