import React from 'react'
import Form from '../../components/UI/Form'
import { getAuth, createUserWithEmailAndPassword } from "firebase/auth";
import { useAuthorization } from '../../stores/authorization';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

const RegistaerPage = () => {

  const register = useAuthorization(state => state.setUser)

  const push = useNavigate()

  const handleClickRegister = (name:string, email:string, password:string) => {
    // const auth = getAuth();
    // createUserWithEmailAndPassword(auth, email, password)
    //     .then(({user}) => {
    //       register(name, user.email, user.uid)
    //       push('/')
    //     })
    //     .catch(console.error)
    const user = {
      username: name,
      email: email,
      password: password
    }
    
    axios.post('http://127.0.0.1:8000/user/signup/', user)
    .then(function (response) {
      console.log(response);
    })
    .catch(function (error) {
      console.log(error);
    })
  }

  return (
    <div>
        <Form loginPage={false} handleClick={handleClickRegister} title='Registration' underText={`Already have an account?`} underText2='Log in' link={'login'}/>
    </div>
  )
}

export default RegistaerPage
