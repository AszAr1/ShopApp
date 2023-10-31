import React from 'react'
import Form from '../../components/UI/Form'
import { getAuth, signInWithEmailAndPassword } from "firebase/auth";
import { useAuthorization } from '../../stores/authorization';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import { InfoProps } from '../../models/types';

const LoginPage = () => {

  const login = useAuthorization(state => state.setUser)
  const push = useNavigate()

  const handleClickLogin = (name: string, email: string, password: string) => {
    // const auth = getAuth();
    // signInWithEmailAndPassword(auth, email, password)
    // .then(({user}) => {
    //     login(name, user.email, user.uid)
    //     push('/')
    // }).catch(console.error)
    const user = {
      username: email,
      password: password
    }
    const resonse = axios.post('http://127.0.0.1:8000/user/login/', user)
      .then(function (response) {
        const info = axios.get<InfoProps>(`http://127.0.0.1:8000/user/${user.username}`)
        .then(
          function (info){
            login(info.data.username, info.data.email) 
          }
        ).catch(
          function (e) {
            console.error(e)
          }
        )
        console.log(response);
      })
      .catch(function (error) {
        console.log(error);
      })
  }

  return (
    <Form loginPage={true} title='Login' handleClick={handleClickLogin} underText={`Dont't have an account?`} underText2='Register' link={'register'} />
  )
}

export default LoginPage
