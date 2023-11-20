import { useEffect } from "react";
import { useFavorite } from "../../stores/favorite";
import Card from "../UI/Card";
import { FavoritesService } from "../../service/FavoritesService";

export const Favorites = () => {
    const favorites = useFavorite((state) => state.favorites);
    const isLoading = useFavorite((state) => state.loading);
    // const getFavorites = useFavorite((state) => state.setFavorite);



    if (favorites.length === 0) {
        return (
            <div className="flex h-screen w-full flex-col items-center justify-center">
                <h1 className="text-4xl font-bold">(◕‿◕)</h1>
                <h1 className="mt-8 font-mono text-4xl font-bold">
                    Your favorites is empty now
                </h1>
            </div>
        );
    } else {
        return (
            <div>
                {isLoading ? (
                    <div className="flex h-full w-full items-center justify-center">
                        Loading
                    </div>
                ) : (
                    <div className="laptop:grid-cols-3 grid grid-cols-1 gap-4 p-10">
                        {favorites.map((item) => (
                            <div key={item.id}>
                                <Card product={item} />
                            </div>
                        ))}
                    </div>
                )}
            </div>
        );
    }
};
