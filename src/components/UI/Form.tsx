import React, { useState } from 'react'
import { formProps } from '../../models/types'
import { Link } from 'react-router-dom'

const Form = ({ title, handleClick, underText, underText2, link, loginPage }: formProps) => {

  const [name, setName] = useState('')
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')

  return (
    <div className={`flex justify-center items-center w-full h-full`}>

      <img src='https://img.setka.io/clients/ERswQaPUWaeWgjb6hekcAkZGgz6Intd3/post_images/rednike-2022102719380146.jpg'
        className=" hidden desktop:flex w-full h-screen relative" alt="image" />

      <img src={`https://oboi.ringtonz.ru/uploads/posts/2020-04/1585991149_krossovki_nogi_obuv_podsvetka_116317_1440x2560.jpg`}
        alt={"image"}
        className={`flex desktop:hidden`} />

      <div className={`flex justify-center items-center flex-col p-10 absolute 
                        bg-white rounded-md`}>

        <h1 className={`text-2xl font-mono font-bold mb-4`}>{title}</h1>

        <form className={`flex justify-center items-start flex-col`}>

          <h1 className={`font-mono mb-2 text-sm`}>Enter your name</h1>
          <input
            type='name'
            value={name}
            onChange={(e) => setName(e.target.value)}
            placeholder='Alex'
            className={` p-2 w-[250px] bg-gray-300 rounded-md outline-none`}
          />

          <h1 className={`${loginPage ? 'hidden' : 'flex'} font-mono my-2 text-sm`}>Enter your email</h1>
          <input
            type='email'
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            placeholder='example@gmail.com'
            className={`${loginPage ? 'hidden' : 'flex'} p-2 w-[250px] bg-gray-300 rounded-md outline-none`}
          />

          <h1 className="font-mono my-2 text-sm">Enter your password</h1>
          <input
            type='password'
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            placeholder='your password'
            className={`p-2 w-[250px] bg-gray-300 rounded-md outline-none`}
          />

        </form>

        <h1 className='text-md my-4 text-gray-500'>{underText} <Link to={`/${link}`} className='text-md text-black hover:text-blue-400'>{underText2}</Link></h1>

        <button onClick={() => handleClick(name, email, password)} children={`${loginPage ? 'Log in' : 'Register'}`} className={`bg-black p-2 w-[250px] rounded-md text-white font-mono font-bold
            duration-300 transition hover:bg-white hover:text-black border-2 border-solid border-black`} />
            
      </div>
    </div>
  )
}

export default Form