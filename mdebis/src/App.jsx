import './index.css'
import {BrowserRouter as Router, Route, Routes, Outlet, useLocation} from "react-router-dom";
import Loginpage from "./Pages/LoginPage"
import ForgotPassword from './Pages/ForgotPassword';
import Home from "./components/Home"
import Syllabus from './components/Syllabus';
import InfoLecture from './components/InfoLecture';

import React, {useState} from 'react';
function App() {
 
  return (
    <body >
      <Router>
        <Routes>
          <Route path ="/" element ={<Loginpage/>} />   
          <Route path ="/ForgotPassword" element ={<ForgotPassword/>} />      
          <Route path ="/HomePage"   element ={<Home/>} >
          <Route path ="/HomePage/infoLecture" element ={<InfoLecture/>} />
          <Route path ="/HomePage/Syllabus" element ={<Syllabus/>} />
          
          </Route>    
        </Routes>
      </Router>
    </body>
    
  );
}



export default App;