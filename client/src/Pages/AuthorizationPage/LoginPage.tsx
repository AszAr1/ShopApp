import React from 'react'
import Form from '../../components/UI/Form'
import { getAuth, signInWithEmailAndPassword } from "firebase/auth";
import { useAuthorization } from '../../stores/authorization';
import { useNavigate } from 'react-router-dom';

const LoginPage = () => {

    const login = useAuthorization(state => state.setUser)
    const push = useNavigate()

    const handleClickLogin = (email:string, password:string) => {
        const auth = getAuth();
        signInWithEmailAndPassword(auth, email, password)
        .then(({user}) => {
            login(user.email, user.uid)
            push('/')
        }).catch(console.error)
    } 

  return (
    
    <Form loginPage={true} title='Login' handleClick={handleClickLogin} underText={`Dont't have an account?`} underText2='Register' link={'register'}/>
  )
}

export default LoginPage