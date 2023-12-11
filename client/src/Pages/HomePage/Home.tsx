import { useEffect } from 'react'
import HomeIntro from '../../components/HomeIntro/HomeIntro'
import { UseSneakers } from '../../stores/UseSneakers'
import HomeProducts from '../../components/HomeProducts/HomeProducts'
import { UseHoodies } from '../../stores/UseHoodies'

function HomePage() {
  const getLimitSneakers = UseSneakers(state => state.getLimitedSneakers)
  const getLimitHoodies = UseHoodies(state => state.getLimitedHoodies)
  const sneakers = UseSneakers(state => state.sneakers)
  const hoodies = UseHoodies(state => state.hoodies)

  useEffect(() => {
    getLimitSneakers(6)
    getLimitHoodies(6)
  }, [])

  return (
    <>
      <HomeIntro />
      <HomeProducts product={sneakers} title='sneakers' />
      <HomeProducts product={hoodies} title='hoodies' />
    </>
  )
}

export default HomePage