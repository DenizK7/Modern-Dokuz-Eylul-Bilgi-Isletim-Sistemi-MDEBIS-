import "../homeSide.css";
import Lessons from "./Lessons";
import { Outlet, useLocation } from "react-router-dom";
import { useEffect, useState, useReducer } from 'react';
import{MainContext, useContext} from '../context'
function Syllabus() {
    const [css, setCss] = useState('grid-container');
   const{navVisible}= useContext(MainContext);

    
	useEffect (() =>{
     if(navVisible){
      setCss('grid-container-sm');
     }
     else{
      setCss('grid-container');
     }
     
     
    },[navVisible])
    
	return (
        <>
        
        <div style={{transition:"0.8s"}} className={css}  >
    <div className="item1" >Saat</div>
      <div className="days" >Pazartesi</div>
      <div className="days">Salı</div>
      <div className="days" >Çarşamba</div>
      <div className="days">Perşembe</div>
      <div className="days">Cuma</div>
      
      <div ><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      <div><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
     
      <div ><Lessons></Lessons></div>
      <div><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      
      <div ><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      <div><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      
      <div ><Lessons></Lessons></div>
      <div><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      
      <div ><Lessons></Lessons></div>
      <div><Lessons></Lessons></div>
      
      <div ><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      
      <div ><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      
      <div ><Lessons></Lessons></div>
      <div><Lessons></Lessons></div>
     
      <div ><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      <div><Lessons></Lessons></div>
      
      <div ><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>

      
      
    </div> 
    </>
		
  );
}

export default Syllabus;