import React from 'react'
import Form from '../../components/UI/Form'
import { useAuthorization } from '../../stores/authorization';
import { useNavigate } from 'react-router-dom';
import AuthService from '../../service/AuthService';

const RegistaerPage = () => {
  const navigate = useNavigate()
  const register = useAuthorization(state => state.registration)
  const login = useAuthorization(state => state.login)

  const handleClickRegister = async (name:string, email:string, password:string) => {
    // const auth = getAuth();
    // createUserWithEmailAndPassword(auth, email, password)
    //     .then(({user}) => {
    //       register(name, user.email, user.uid)
    //       push('/')
    //     })
    //     .catch(console.error)
      AuthService.register(name, email, password)
      .then((data) => {
        register(name, email, data.data.access)
        navigate("/")
      })
      .catch(console.error)
  }

  if(login){
    setTimeout(() => navigate('/'), 1000)
  }

  return (
    <div>
        <Form loginPage={false} handleClick={handleClickRegister} title='Registration' underText={`Already have an account?`} underText2='Log in' link={'login'}/>
    </div>
  )
}

export default RegistaerPage


