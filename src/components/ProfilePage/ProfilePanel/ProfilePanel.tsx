import { useAuthorization } from "../../../stores/authorization"
import {useState} from "react";
import Modal from "../../UI/Modal";
const Profile = () => {

  const user = useAuthorization(state => state.user)
  const [open, setOpen] = useState(false)  
    
  function handleOpenModal () {
    setOpen(prev => !prev)    
  }  
  return (
      <>
          <div className='grid laptop:grid-cols-2 grid-cols-1 laptop:grid-rows-2 laptop:gap-4 gap-4 w-full h-full laptop:p-10 p-2'>

              <div className = "flex justify-center items-center border-2 border-solid border-black rounded-md laptop:p-10 p-2 shadow-xl">
                  <div className="flex flex-col justify-center items-center">
                      <div className='w-[200px] h-[200px] relative overflow-hidden border-2 border-solid border-black rounded-full'>
                          <img className='absolute' src='https://images.unsplash.com/photo-1618641986557-1ecd230959aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'/>
                      </div>
                      <h1 className="font-mono">Name: {user.name}</h1>
                      <h1 className="font-mono">Email: {user.email}</h1>
                  </div>
              </div>

              <div className = "flex flex-col justify-center items-center border-2 border-solid border-black rounded-md laptop:p-10 p-2 shadow-xl">
                  
                  <div className="flex flex-row justify-center items-center">
                      
                      <div className="flex flex-col justify-center items-center">
                          <h1 className="font-mono">Change name</h1>
                          <input className="p-2 mb-3 outline-none border-b-2 border-solid border-black" placeholder="New name"/>
                      </div>
                      
                      <button
                          className="font-mono ml-5 h-full w-full border-dashed border-2 border-black rounded-md laptop:p-20 p-2"
                          onClick={handleOpenModal}
                      >Set image</button>
                      
                  </div>
                  
                  <button className="border-2 border-solid border-black p-2 mt-5
                    font-mono font-semibold bg-black text-white duration-300 transition hover:bg-white hover:text-black 
                  ">Change info</button>
                  
              </div>

              <div className = "flex justify-center items-center laptop:col-span-2 border-2 border-solid border-black rounded-md laptop:p-10 p-2 shadow-xl">
                  <div className="flex flex-col justify-center laptop:items-start items-center">
                      <h1>Change name</h1>
                      <input className="p-2 outline-none " placeholder="New name"/>
                  </div>
              </div>

          </div>
          <Modal isOpen={open} openFunc={handleOpenModal}/>
      </>
  )
}
export default Profile
