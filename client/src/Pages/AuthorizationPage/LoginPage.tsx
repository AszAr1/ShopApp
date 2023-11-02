import React from 'react'
import Form from '../../components/UI/Form'
import { useAuthorization } from '../../stores/authorization';
import { useNavigate } from 'react-router-dom';

const LoginPage = () => {

  const login = useAuthorization(state => state.loginUser)
  const push = useNavigate()

  const handleClickLogin = (name: string, email: string, password: string) => {
    login(name, email, password)
  }

  return (
    <Form loginPage={true} title='Login' handleClick={handleClickLogin} underText={`Dont't have an account?`} underText2='Register' link={'register'} />
  )
}

export default LoginPage
