import Form from '../../components/UI/Form'
import AuthService from '../../service/AuthService';
import { useAuthorization } from '../../stores/authorization';
import { useNavigate } from 'react-router-dom';

const LoginPage = () => {

  const login = useAuthorization(state => state.loginUser)
  const push = useNavigate()
  const loginService = AuthService.login

  const handleClickLogin = (name: string, email: string, password: string) => {
    loginService(name, email)
    .then((data)=> {
      login(data.data.user)
    })
    .catch((e) => console.error(e))
  }

  return (
    <Form loginPage={true} title='Login' handleClick={handleClickLogin} underText={`Dont't have an account?`} underText2='Register' link={'register'} />
  )
}

export default LoginPage
