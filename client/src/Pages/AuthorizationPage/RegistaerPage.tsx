import React from 'react'
import Form from '../../components/UI/Form'
import { getAuth, createUserWithEmailAndPassword } from "firebase/auth";
import { useAuthorization } from '../../stores/authorization';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

const RegistaerPage = () => {

  const register = useAuthorization(state => state.registration)

  const push = useNavigate()

  const handleClickRegister = (name:string, email:string, password:string) => {
    // const auth = getAuth();
    // createUserWithEmailAndPassword(auth, email, password)
    //     .then(({user}) => {
    //       register(name, user.email, user.uid)
    //       push('/')
    //     })
    //     .catch(console.error)
    register(name, email, password)
  }

  return (
    <div>
        <Form loginPage={false} handleClick={handleClickRegister} title='Registration' underText={`Already have an account?`} underText2='Log in' link={'login'}/>
    </div>
  )
}

export default RegistaerPage
