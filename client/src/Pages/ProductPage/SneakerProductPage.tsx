import { memo, useEffect } from "react";
import { useParams } from "react-router-dom";
import SneakerSize from "./ProductsSize";
import Button from "../../components/UI/Button";
import Description from "./Description";
import { useSneakers } from "../../stores/sneakers";

function ProductPage() {
  const { id } = useParams()
  const getProduct = useSneakers(state => state.getOneSneaker)
  const sneaker = useSneakers(state => state.sneaker)

  useEffect(() => {
    getProduct(id)
  }, []);

  if (!sneaker) {
    return <div>Loading...</div>;
  }
  return (
    <>
      <div className={`w-full flex justify-between flex-col px-6 laptop:px-24 items-center`}>

        <div className={`flex justify-center items-center flex-col laptop:flex-row mt-20`}>

          <div className={`max-w-[600px] max-h-[800px] mr-0 laptop:mr-16 mb-10 laptop:mb-0
                    overflow-hidden rounded-2xl border-4 border-black
                     `}>
            <img src={sneaker.image} alt={`product-image`} />

          </div>

          <div className={`flex justify-center items-start max-w-auto laptop:max-w-[50%] min-h-[500px] flex-col
                        border-2 p-4 border-black rounded-xl`}>

            <h1 className={`text-3xl font-extrabold py-4`}>{sneaker.title}</h1>
            <h1 className={`text-xl font-sans`}>{sneaker.content}</h1>

            <div className={`flex justify-center items-start mt-4 flex-col`}>

              <h1 className={`mb-2 text-xl font-extrabold`}>*Размер(EUR)</h1>

              <div className={`grid grid-cols-4 gap-4 md:grid-cols-5 mx-0 laptop:gap-3`}>
                <SneakerSize className={`hover:bg-red-200`} sizes={sneaker.sizes}></SneakerSize>
              </div>

            </div>

            <div className={`flex justify-center items-center mt-4`}>

              <h1 className={`text-2xl`}>Price:</h1>
              <h1 className={`text-2xl font-bold`}>{sneaker.price}$</h1>

            </div>

            <Button className={`mt-4 w-full p-2
                         rounded-lg bg-black text-white font-bold border-black border-2
                         transition duration-500 hover:bg-white hover:text-black`}>
              В корзину
            </Button>

          </div>

        </div>

      </div>


      <div className="custom-shape-divider-top-1684847686">

        <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120"
          preserveAspectRatio="none">
          <path
            d="M985.66,92.83C906.67,72,823.78,31,743.84,14.19c-82.26-17.34-168.06-16.33-250.45.39-57.84,11.73-114,31.07-172,41.86A600.21,600.21,0,0,1,0,27.35V120H1200V95.8C1132.19,118.92,1055.71,111.31,985.66,92.83Z"
            className="shape-fill"></path>
        </svg>

      </div>

      <Description children={sneaker.description} />

    </>
  )
}

export default memo(ProductPage)
