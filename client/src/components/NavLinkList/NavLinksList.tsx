import React from 'react'
import { NavLinks as links } from '../../constants/NavLinks'
import { Link } from 'react-router-dom'
function NavLinksList() {
    return (
        <div className='laptop:flex hidden flex-row justify-center items-center'>
            {links.map((link) => (
                <ul key={link.id}>
                    <Link to={`/${link.link}`}
                        className={`mx-2 my-2 flex items-center justify-between rounded-xl p-1 transition duration-500 hover:scale-110
                        hover:bg-white hover:text-black`}
                    >
                        <div className={`mr-2`}>{link.icon}</div>
                        <h1>
                            {link.title}
                        </h1>
                    </Link>
                </ul>
            ))}
        </div>
    )
}

export default NavLinksList