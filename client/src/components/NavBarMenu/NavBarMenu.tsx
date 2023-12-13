import { NavLinks as links } from '../../constants/NavLinks'
import { Link } from "react-router-dom"
import { UseUser } from "../../stores/UseUser"

type INavBarMenu = {
    isOpen: boolean,
    setIsOpen(): void,
    isAuth: boolean,
}

function NavBarMenu({ isOpen, setIsOpen, isAuth }: INavBarMenu) {

    const LogOut = UseUser(state => state.logout)


    return (

        <div className={`${isOpen ? 'flex' : 'hidden'} laptop:hidden flex flex-col justify-start items-start p-3 z-50 absolute bg-black text-white right-4 top-20 rounded-md`}>
            <div className={`${isAuth ? 'flex' : 'hidden'} flex-col`}>
                {links.map(el => (
                    <Link to={el.link} key={el.id}>
                        <button
                            onClick={setIsOpen}
                            className={`flex flex-row justify-between my-2 items-center w-full
                                border-2 border-solid border-white bg-white text-black

                                duration-150 transition hover:bg-black hover:text-white p-2 rounded-md`}>
                            <span className="mr-4">{el.icon}</span>
                            <h1>{el.title}</h1>
                        </button>
                    </Link>
                ))}
                <button
                    className={`p-2 rounded-md mt-2 border-2 border-solid w-full
                         border-white bg-white text-black hover:bg-black hover:text-white`}
                    onClick={LogOut}>
                    Log Out
                </button>
            </div>

            <div className={`flex flex-col justify-center items-center ${isAuth ? 'hidden' : 'flex'}`}>

                <Link to="/register" 
                onClick={setIsOpen}
                className={`mx-2 w-[150px] text-center px-4 py-3
                text-black font-mono font-bold
                bg-white border-2 border-solid border-black rounded-md 
                  duration-200 transition hover:bg-black hover:text-white hover:scale-90`}
                >
                        Register
                </Link>

                <Link to= "login" 
                onClick={setIsOpen}
                className={`mx-2 w-[150px] text-center px-4 py-3
                text-black font-mono font-bold
                bg-white border-2 border-solid border-black rounded-md 
                  duration-200 transition hover:bg-black hover:text-white hover:scale-90`}
                >
                        Log In
                </Link>
            </div>
        </div>

    )

}

export default NavBarMenu