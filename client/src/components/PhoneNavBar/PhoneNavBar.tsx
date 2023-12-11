import { useState } from 'react'
import NavBarMenu from '../NavBarMenu/NavBarMenu';
import { UseUser } from '../../stores/UseUser';

function PhoneNavBar() {

    const [open, setIsOpen] = useState<boolean>(false);
    const isAuth = UseUser(state => state.login)

    function HandleOpen() {
        setIsOpen(prev => !prev)
    }

    return (
        <>
            <button
                className={`laptop:hidden flex items-center justify-between rounded-xl border-2 border-black p-3 shadow-md
              transition duration-500 ${open ? "-translate-y-2" : "translate-y-0"
                    }`}
                onClick={HandleOpen}
            >
                <div className='text-white'>
                    <div
                        className={`h-0.5 w-6 bg-black
                    transition-all duration-300 ease-in-out ${open ? "translate-y-1 rotate-45" : "-translate-y-0.5"
                            }`}
                    ></div>
                    <div
                        className={`${open ? "opacity-0" : "opacity-100"
                            } my-0.5 h-0.5 w-6 bg-black transition duration-100`}
                    ></div>
                    <div
                        className={`h-0.5 w-6 bg-black
                    transition-all duration-300 ease-in-out ${open ? "-translate-y-1 -rotate-45" : "translate-y-0.5"
                            }
                    `}
                    ></div>
                </div>
            </button>
            <NavBarMenu isOpen={open} setIsOpen={HandleOpen} isAuth={isAuth}/>
        </>
    )
}

export default PhoneNavBar