
import React, {useState} from 'react';
import Navbar from "./HomeSideInner";
import { BrowserRouter, Routes, Route,Navigate } from "react-router-dom";
import "../homeSide.css";
import Syllabus from "./Syllabus";
import {Outlet, useLocation} from "react-router-dom";
import InfoLecture from './InfoLecture';
import {MainContext} from "../context";

function Home(){
    const [navVisible, showNavbar] = useState(false);
    const data = {
        navVisible,
        showNavbar
    }
    return(
        <MainContext.Provider value ={data}>
        <body className='noBg'>
          
           <Navbar  visible={ navVisible } show={ showNavbar } />		
           <Outlet></Outlet>
           
                      
        </body>
        </MainContext.Provider>
        
    );
}
    export default Home;