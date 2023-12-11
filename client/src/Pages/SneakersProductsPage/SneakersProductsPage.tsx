import { useEffect } from "react"
import { UseSneakers } from "../../stores/UseSneakers"
import Card from "../../components/Card/Card"

function SneakersProductsPage() {

  const sneakers = UseSneakers(state => state.sneakers)
  const getSneakers = UseSneakers(state => state.getSneakers)
  const removeSneakers = UseSneakers(state => state.removeSneakers)

  useEffect(() => {
    getSneakers()
    return () => removeSneakers()
  }, [])

  return (
    <div className={`laptop:grid-cols-4 laptop:gap-4 laptop:px-10 my-20 grid grid-cols-1 gap-8 px-6`} >
      {sneakers.map((sneaker) => (
        <Card key={sneaker.id} product={sneaker} />
      ))}
    </div>
  )
}

export default SneakersProductsPage