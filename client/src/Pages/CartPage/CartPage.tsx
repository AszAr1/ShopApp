import React, {useEffect, useState} from "react";
import {ProductsProps} from "../../models/products";
import {CartService} from "../../service/CartService";
import Card from "../../components/UI/Card";

function CartPage() {
    const [products, setProducts] = useState<ProductsProps[] | []>([]);

    useEffect(() => {
        CartService.getCart().then(response => setProducts(response.data))
    }, []);

    if (products.length === 0) {
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
            <div className="w-full h-full">
                <div className="laptop:grid-cols-3 grid grid-cols-1 gap-4 p-10">
                    {products.map((item) => (
                        <div key={item.id}>
                            <Card product={item} />
                        </div>
                    ))}
                </div>
            </div>
        );
    }
}

export default CartPage;
