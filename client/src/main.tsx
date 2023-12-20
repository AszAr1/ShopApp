import ReactDOM from 'react-dom/client'
import App from './App.tsx'
import './index.css'
import { BrowserRouter } from "react-router-dom";
import NavBar from './components/NavBar/NavBar.tsx';
import Footer from './components/Footer/Footer.tsx';

ReactDOM.createRoot(document.getElementById('root')!).render(
  <BrowserRouter>
    <NavBar/>
    <App />
    <Footer/>
  </BrowserRouter>
)
