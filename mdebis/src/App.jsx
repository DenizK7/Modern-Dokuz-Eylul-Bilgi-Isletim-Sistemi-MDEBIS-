import './index.css'
import {BrowserRouter as Router, Route, Routes} from "react-router-dom";
import Loginpage from "./Pages/LoginPage"

import ForgotPassword from './Pages/ForgotPassword';
function App() {
  return (
    <body >
      <Router>
        <Routes>
          <Route path ="/" element ={<Loginpage/>} />   
          <Route path ="/ForgotPassword" element ={<ForgotPassword/>} />      
        </Routes>
      </Router>
    </body>
    
  );
}



export default App;