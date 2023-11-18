import Form from '../../components/UI/Form'
import AuthService from '../../service/AuthService';
import { useAuthorization } from '../../stores/authorization';
import { useNavigate } from 'react-router-dom';

const LoginPage = () => {

  const login = useAuthorization(state => state.loginUser)
  const navigate = useNavigate()
  const loginService = AuthService.login

  const handleClickLogin = async (name: string, email: string, password: string) => {
    // loginService(name, password)
    // .then((data)=> {
    //   login(data.data.user, data.data.access)
    //   navigate('/')
    // })
    // .catch((e) => console.error(e))
    const data = await loginService(name, password)

    if(data){
      localStorage.setItem('token', data.data.access)
      localStorage.setItem('refreshToken', data.data.refresh)
      localStorage.setItem('username', data.data.user.username)
      login(data.data.user)
      navigate('/')
      console.log(localStorage.getItem('token'))
      console.log(localStorage.getItem('refreshToken'))
    }
  }

  return (
    <Form loginPage={true} title='Login' handleClick={handleClickLogin} underText={`Dont't have an account?`} underText2='Register' link={'register'} />
  )
}

export default LoginPage
