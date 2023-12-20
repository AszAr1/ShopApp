import { useEffect, useState } from "react";
import { IProducts } from "../../models/IProducts";
import NoItems from "../../components/NoItems/NoItems";
import { FavoritesService } from "../../services/favorites.service";
import Card from "../../components/Card/Card";

function FavoritesPage() {
  const [favorites, setFavorites] = useState<IProducts[] | []>([])
  const [isLoading, setIsLoading] = useState<boolean>(true);

  useEffect(() => {
    try {
      FavoritesService.getFavorites()
        .then(data => {
          setFavorites(data.data)
          setIsLoading(false);
        })
        .catch(e => console.log(e))

    } catch (err) {
      console.log(err);
    }
    return () => {
      setFavorites([])
    };

  }, []);

  if (favorites.length === 0) {
    return (
      <NoItems title="favorites" />
    );
  } else {
    return (
      <div className="w-full h-full">
        {isLoading ? (
          <div className="flex h-full w-full items-center justify-center">
            Loading
          </div>
        ) : (
          <div className="laptop:grid-cols-3 grid grid-cols-1 gap-4 p-10">
            {favorites.map((item) => (
              <div key={item.id}>
                {/*@ts-ignore*/}
                <Card product={item.product} isFavoritesPage={true}/>
              </div>
            ))}
          </div>
        )}
      </div>
    );
  }
}

export default FavoritesPage