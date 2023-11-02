import { FC } from "react"
import { useAuthorization } from "../../stores/authorization"
import { useNavigate } from "react-router-dom"

interface SettingsPanel {
  activeComponentRender: (component: string) => void
}

const SettingsPanel:FC<SettingsPanel> = (props) => {

  const removeUser = useAuthorization(state => state.logout)
  const push = useNavigate()

  const logOut = () => {
    removeUser()
    push('/')
  }

  return (
    <>
        <div className="desktop:flex hidden flex-col justify-center items-center w-[500px] p-5 border-r-2 border-solid border-black h-screen">

            <div className='w-[200px] h-[200px] relative overflow-hidden border-2 border-solid border-black rounded-full'>
                <img className='absolute' src='https://images.unsplash.com/photo-1618641986557-1ecd230959aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'/>
            </div>

            <div className='flex flex-col justify-center items-start w-full mt-10 border-solid border-2 border-black rounded-lg p-10'>
                <button onClick={() => props.activeComponentRender('profile')} className="p-2 flex items-start w-full rounded-md hover:bg-gray-200 font-mono text-lg">Profile</button>
                <button onClick={() => props.activeComponentRender('security')} className="p-2 flex items-start my-3 w-full rounded-md hover:bg-gray-200 font-mono text-lg">Security</button>
                <button onClick={() => props.activeComponentRender('order')} className="p-2 flex items-start w-full rounded-md hover:bg-gray-200 font-mono text-lg">Order</button>
                <button onClick={() => props.activeComponentRender('cart')} className="p-2 flex items-start w-full mt-3 rounded-md hover:bg-gray-200 font-mono text-lg">Cart</button>
                <button onClick={() => props.activeComponentRender('purchased')} className="p-2 flex items-start mt-3 w-full rounded-md hover:bg-gray-200 font-mono text-lg">Purchased goods</button>
                <button onClick={logOut} className="p-2 flex items-start w-full border-2 border-black mt-3 rounded-md hover:bg-gray-200 font-mono text-lg">Log Out</button>
            </div>
        </div>
    </>
  )
}

export default SettingsPanel