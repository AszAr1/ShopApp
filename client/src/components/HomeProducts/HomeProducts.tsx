import { IProducts } from '../../models/IProducts'
import { Link } from 'react-router-dom'
import Card from '../Card/Card'

type Props = {
    product: IProducts[],
    title: string,
}

function HomeProducts({product, title}: Props) {
    return (
        <div className="laptop:px-24 mt-20 flex flex-col items-start justify-center px-6">
                <Link
                    to={`/${title}`}
                    className={`mb-10 font-mono text-5xl font-bold`}
                >
                    Our {title}
                </Link>
                <div className="laptop:grid-cols-3 grid grid-cols-1 gap-4">
                    {product.map((item) => (
                        <Card key={item.id} product={item} />
                    ))}
                </div>
                <Link to={`/${title}`} className={`w-full text-xl font-bold`}>
                    <button
                        className={`my-4 w-full rounded-lg
                     border-2 border-black bg-black p-3 text-white
                     transition duration-500 hover:bg-white hover:text-black`}
                    >
                        See more
                    </button>
                </Link>
            </div>
    )
}

export default HomeProducts