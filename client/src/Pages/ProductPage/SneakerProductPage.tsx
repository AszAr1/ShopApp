import { memo, useEffect } from "react";
import { useParams } from "react-router-dom";
import SneakerSize from "./ProductsSize";
import Description from "./Description";
import { useSneakers } from "../../stores/sneakers";
import {CartService} from "../../service/CartService";

function ProductPage() {
    const { id } = useParams();
    const getProduct = useSneakers((state) => state.getOneSneaker);
    const sneaker = useSneakers((state) => state.sneaker);

    useEffect(() => {
        getProduct(id);
    }, []);

    if (!sneaker) {
        return <div>Loading...</div>;
    }

    function addCart(){
        CartService.addToCart(id)
    }

    return (
        <>
            <div
                className={`desktop:px-24 flex w-full flex-col items-center justify-between px-6`}
            >
                <div
                    className={`desktop:flex-row mt-20 flex flex-col items-center justify-center`}
                >
                    <div
                        className={`desktop:mr-16 laptop:mb-0 mb-10 mr-0 max-h-[800px] max-w-[600px]
                    overflow-hidden rounded-2xl border-4 border-black
                     `}
                    >
                        <img src={sneaker.image} alt={`product-image`} />
                    </div>

                    <div
                        className={`max-w-auto desktop:max-w-[50%] flex min-h-[500px] flex-col items-start justify-center
                        rounded-xl border-2 border-black p-4`}
                    >
                        <h1 className={`py-4 text-3xl font-extrabold`}>
                            {sneaker.title}
                        </h1>
                        <h1 className={`font-sans text-xl`}>
                            {sneaker.content}
                        </h1>

                        <div
                            className={`mt-4 flex flex-col items-start justify-center`}
                        >
                            <h1 className={`mb-2 text-xl font-extrabold`}>
                                *Размер(EUR)
                            </h1>

                            <div
                                className={`tablet:grid-cols-10 laptop:gap-3 mx-0 grid grid-cols-5 gap-4`}
                            >
                                <SneakerSize
                                    className={`hover:bg-red-200`}
                                    sizes={sneaker.sizes}
                                ></SneakerSize>
                            </div>
                        </div>

                        <div
                            className={`mt-4 flex items-center justify-center`}
                        >
                            <h1 className={`text-2xl`}>Price:</h1>
                            <h1 className={`text-2xl font-bold`}>
                                {sneaker.price}$
                            </h1>
                        </div>

                        <button
                            className={`mt-4 w-full rounded-lg
                         border-2 border-black bg-black p-2 font-bold text-white
                         transition duration-500 hover:bg-white hover:text-black`}
                            onClick={addCart}
                        >
                            В корзину
                        </button>
                    </div>
                </div>
            </div>

            <div className="custom-shape-divider-top-1684847686">
                <svg
                    data-name="Layer 1"
                    xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 1200 120"
                    preserveAspectRatio="none"
                >
                    <path
                        d="M985.66,92.83C906.67,72,823.78,31,743.84,14.19c-82.26-17.34-168.06-16.33-250.45.39-57.84,11.73-114,31.07-172,41.86A600.21,600.21,0,0,1,0,27.35V120H1200V95.8C1132.19,118.92,1055.71,111.31,985.66,92.83Z"
                        className="shape-fill"
                    ></path>
                </svg>
            </div>

            <Description children={sneaker.description} />
        </>
    );
}

export default memo(ProductPage);
