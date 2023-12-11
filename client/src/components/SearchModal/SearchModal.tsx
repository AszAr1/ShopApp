import { Link } from "react-router-dom"
import { IProducts } from "../../models/IProducts"
import Search from "../Search/Search"
import { IoClose } from "react-icons/io5";

type ISearchModal = {
    closeModal(): void,
    products: IProducts[] | [],
}

function SearchModal({ closeModal, products }: ISearchModal) {
    return (
        <dialog className="flex flex-col justify-center items-center absolute p-3 
        bg-white whitespace-nowrap w-10/12 h-5/6 rounded-lg shadow-lg shadow-black
         border-2 border-solid border-black top-24 z-20">
            <div className="flex flex-row justify-center items-center w-full">
                <Search isModalSearch={true} />
                <button onClick={closeModal}><IoClose className="text-3xl ml-3" /></button>
            </div>
            <ul className="overflow-y-auto overflow-hidden w-full h-full p-3">
                {products.map(innerArray => (
                    // @ts-ignore
                    innerArray.map(item => (
                        //@ts-ignore
                        <div key={item.id} className="flex laptop:flex-row flex-col w-full my-4 justify-between items-center p-3 border-2 border-solid border-black shadow-md shadow-black">
                            {/* @ts-ignore */}
                            <img src={item.image} className="rounded-md" width={80} height={80} />
                            <div className="flex flex-col justify-start overflow-hidden text-ellipsis items-start w-3/5">
                                {/* @ts-ignore */}
                                <h1>{item.title}</h1>
                                <p className="text-ellipsis">{item.description}</p>
                            </div>
                            <div className="flex flex-col laptop:justify-end justify-center laptop:items-end items-center">
                                <p>{item.price}$</p>
                                <button onClick={closeModal} className="bg-black px-3 py-2 text-white transition duration-200 hover:scale-90"><Link to={`/products/${item.id}`}>See more</Link></button>
                            </div>
                        </div>
                    ))
                ))}
            </ul>
        </dialog>
    )
}

export default SearchModal