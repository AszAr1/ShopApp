import { useEffect } from 'react'
import { useFavorite } from '../../stores/favorite'
import Card from '../UI/Card'

export const Favorites = () => {

    const favorites = useFavorite(state => state.favorites)
    const isLoading = useFavorite(state => state.loading)
    const getFavorites = useFavorite(state => state.getFavorite)

    useEffect(() => {
        getFavorites()
    }, [])

    if (favorites.length === 0) {
        return (
            <div className='flex flex-col justify-center items-center h-screen w-full'>
                <h1 className='text-4xl font-bold'>
                    (◕‿◕)
                </h1>
                <h1 className='text-4xl font-mono font-bold mt-8'>
                    Your favorites is empty now
                </h1>
            </div>
        )
    } else {
        return (
            <div>
                 {isLoading 
                    ? 
                        <div className="flex justify-center items-center h-full w-full">Loading</div>
                    : 
                        <div className="grid grid-cols-1 laptop:grid-cols-3 gap-4 p-10">
                            {favorites.map((item) => (
                            <div key={item.id}><Card product={item}/></div>
                        ))}
                        </div> 
                 }
            </div>
      )
    }
}
