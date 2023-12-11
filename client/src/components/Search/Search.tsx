import { useState } from 'react'
import { BiSearchAlt } from 'react-icons/bi'
import SearchModal from '../SearchModal/SearchModal'
import { UseSearch } from '../../stores/UseSearch'

function Search({ isModalSearch }: any) {

  const request = UseSearch(state => state.request);
  const setRequest = UseSearch(state => state.setRequest);
  const search = UseSearch(state => state.findProducts);
  const result = UseSearch(state => state.products)
  const [open, setOpen] = useState(false)

  function OnChangeInput(input: string) {
    if (isModalSearch) {
      setRequest(input)
    } else {
      setRequest(input)
      setOpen(true)
    }
  }

  function closeModal() {
    setOpen(false)
    setRequest("")
  }

  return (
    <>
      <div className={`flex items-center justify-center rounded-lg bg-black p-1 ${isModalSearch ? 'w-full' : 'w-1/5'}`}>

        <button
          onClick={() => setOpen(!isModalSearch ? true : false)}
          className="text-2xl rounded-lg p-2 bg-black text-white border-2 border-solid border-black duration-150 transition hover:text-black hover:bg-white"
        >
          <BiSearchAlt />
        </button>
        <input
          type='text'
          value={request}
          onChange={e => OnChangeInput(e.target.value)}
          onBeforeInput={() => search(request)}
          placeholder='Search'
          className={`${isModalSearch ? 'w-full' : ' laptop:block hidden w-full'} rounded-lg border-2 border-solid border-black p-2 text-black outline-none`}

        />
      </div>
      {open &&
        <SearchModal closeModal={closeModal} products={result} />
      }
    </>
  )
}

export default Search