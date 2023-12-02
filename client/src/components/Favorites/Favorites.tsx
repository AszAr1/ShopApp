import {FC, useEffect} from "react";
import { ProductsProps } from "../../models/productsProps";
import Card from "../UI/Card";
import { NoItems } from "../NoItems/NoItems";

interface Props {
    favorites: ProductsProps[],
    isLoading: boolean
}

export const Favorites:FC<Props> = (props) => {

    if (props.favorites.length === 0) {
        return (
            <NoItems title="favorites"/>
        );
    } else {
        return (
            <div className="w-full h-full">
                {props.isLoading ? (
                    <div className="flex h-full w-full items-center justify-center">
                        Loading
                    </div>
                ) : (
                    <div className="laptop:grid-cols-3 grid grid-cols-1 gap-4 p-10">
                        {props.favorites.map((item) => (
                            <div key={item.id}>
                                {/*@ts-ignore*/}
                                <Card product={item.product}/>
                            </div>
                        ))}
                    </div>
                )}
            </div>
        );
    }
};
