import Search from '../Search/Search'
import NavLinksList from '../NavLinkList/NavLinksList'
import { UseUser } from '../../stores/UseUser'
import { Link } from 'react-router-dom'
import PhoneNavBar from '../PhoneNavBar/PhoneNavBar'

function NavBar() {

  const isAuth = UseUser(state => state.login)

  if (isAuth) {
    return (
      <>
        <header className={`laptop:px-24 w-full flex items-center justify-between border-b-2 border-black px-6 py-7`}>
          <a href='/' className={`laptop:block hidden font-mono text-2xl font-bold`} >Sneakers</a>
          <Search />
          <a href='/' className={`laptop:hidden flex font-mono text-2xl font-bold`} >Sneakers</a>
          <NavLinksList />
          <PhoneNavBar />
        </header>
      </>
    )
  } else {
    return (

      <header className={`laptop:px-24 flex w-full items-center justify-between border-b-2 border-black px-6 py-7`}>

        <a href='/' className={`laptop:block hidden font-mono text-2xl font-bold`} >Sneakers</a>
        <Search />

        <div className='laptop:flex hidden flex-row justify-center items-center'>
          
            <Link to="/register" className='bg-black mx-2 w-[150px] text-center text-white border-2 border-solid border-black px-4 py-3 font-mono font-bold rounded-md duration-200 transition hover:bg-white hover:text-black hover:scale-90'>
              Register
            </Link>

            <Link to="/login" className='bg-black mx-2 w-[150px] text-center text-white border-2 border-solid border-black px-4 py-3 font-mono font-bold rounded-md duration-200 transition hover:bg-white hover:text-black hover:scale-90'>
              Log In
            </Link>
        </div>

        <a href='/' className={`laptop:hidden flex font-mono text-2xl font-bold`} >Sneakers</a>

        <PhoneNavBar/>

      </header>

    )
  }
}

export default NavBar