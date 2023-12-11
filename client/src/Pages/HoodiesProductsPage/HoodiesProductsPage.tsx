import { useEffect } from "react"
import Card from "../../components/Card/Card"
import { UseHoodies } from "../../stores/UseHoodies"

function HoodiesProductsPage() {

    const getHoodies = UseHoodies(state => state.getHoodies)
    const hoodies = UseHoodies(state => state.hoodies)
    const removeHoodies = UseHoodies(state => state.removeHoodies)

    useEffect(() => {
        getHoodies()
        return () => removeHoodies()
    }, [])
    
    return (
        <div className={`laptop:grid-cols-4 laptop:gap-4 laptop:px-10 my-20 grid grid-cols-1 gap-8 px-6`} >
            {hoodies.map((hoodie) => (
                <Card key={hoodie.id} product={hoodie} />
            ))}
        </div>
    )
}

export default HoodiesProductsPage