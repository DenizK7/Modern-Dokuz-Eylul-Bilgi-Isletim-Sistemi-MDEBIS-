import './index.css'
import {BrowserRouter as Router, Route, Routes} from "react-router-dom";
import Loginpage from "./Pages/LoginPage"
import MainContainer from "./components/MainContainer";
import SidebarButton from "./components/SidebarButton";
function App() {
  return (
    <body >
      <Router>
        <Routes>
          <Route path ="/" element ={<Loginpage/>} />        
        </Routes>
      </Router>
    </body>
    
  );
}



export default App;