import { useEffect, useState } from "react"
import { BrandsProps } from "../../models/types";
import axios from "axios";


const getBrands = async () => {
  try {
      const response = await axios.get<BrandsProps[]>(`http://localhost:3001/brands`);
      return response.data
  } catch (error) {
      console.error('Ошибка при получении данных с сервера:', error);
      return [];
  }
};


function Brands() {

  const [brands, setBrands] = useState<BrandsProps[]>([])

  useEffect(() => {
    const fetchBrands = async () => {
      const data = await getBrands()
      setBrands(data)
    }
    
    fetchBrands()

  }, [])
  return (
    <>
      <div className={`flex justify-between items-center flex-col my-4 sm:my-0`}>
        <h1 className={`my-2 font-bold text-xl`}>Наши бренды</h1>
        <div className={`flex justify-center items-center flex-row`}>
          {brands.map((brand) => (
            <div key={brand.id} className={`mx-2 font-bold text-lg`}>
              {brand.title}
            </div>
          ))}
        </div>
      </div>
    </>
  )
}

export default Brands
