import React, { useState } from 'react'
import SettingsPanel from '../../components/SettingsPanel/SettingsPanel'
import { Link, useNavigate } from 'react-router-dom';

function ProfilePage() {
  const navigate = useNavigate();

  const [openModal, setOpenModal] = useState<boolean>(false);

  function HandleClick(e: React.MouseEvent<HTMLButtonElement>) {
    e.preventDefault();
    setOpenModal(prev => !prev);
  }

  
  return (
    <>
      <div className={"flex h-screen w-full items-start justify-center"}>

        <SettingsPanel />

        <div className="flex flex-col h-full w-full items-center justify-center">
          <h1 className={`font-mono text-7xl laptop:flex hidden`}>(◕‿◕)</h1>
          <button
            onClick={e => HandleClick(e)}
            className={`laptop:hidden flex px-5 py-4 rounded-lg bg-black text-4xl font-mono text-white`}>(◕‿◕)
          </button>
        </div>


        {openModal &&
          <dialog
            className={`flex flex-col justify-center items-center mt-14 p-8 border-2 border-solid border-black rounded-md `}>
            <Link
              to={"profile-panel"}
              onClick={() => setOpenModal(false)}
              className={`flex justify-center items-center w-[200px] rounded-lg my-2 bg-black text-white px-3 py-2`}
            >Profile</Link>
            <Link
              to={"order-panel"}
              onClick={() => setOpenModal(false)}
              className={`flex justify-center items-center w-full rounded-lg my-2 bg-black text-white px-3 py-2`}
            >Order</Link>
            <Link
              to={"cart-panel"}
              onClick={() => setOpenModal(false)}
              className={`flex justify-center items-center w-full rounded-lg my-2 bg-black text-white px-3 py-2`}
            >Cart</Link>
          </dialog>
        }
      </div>
    </>
  )
}

export default ProfilePage