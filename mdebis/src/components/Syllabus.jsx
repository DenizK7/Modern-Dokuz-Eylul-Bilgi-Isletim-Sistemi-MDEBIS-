import "../homeSide.css";
import Lessons from "./Lessons";
import { useEffect, useState } from 'react';
function Syllabus({syllabusCss}) {
    const [css, setCss] = useState();
	useEffect (() =>{
       {(syllabusCss) ? setCss('grid-container-sm') : setCss('grid-container')}    
        console.log(syllabusCss );
        console.log(css);
    },[syllabusCss])

	return (
        <>
        <div style={{transition:"0.8s"}} className={css}>
    <div >Saat</div>
      <div >Pazartesi</div>
      <div>Salı</div>
      <div >Çarşamba</div>
      <div >Perşembe</div>
      <div >Cuma</div>
      <div>8:30</div>
      <div ><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      <div><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      <div >10:30</div>
      <div ><Lessons></Lessons></div>
      <div><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      <div>12:30</div>
      <div ><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      <div><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      <div >1:30</div>
      <div ><Lessons></Lessons></div>
      <div><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      
      <div ><Lessons></Lessons></div>
      <div><Lessons></Lessons></div>
      <div >2:30</div>
      <div ><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      
      <div ><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      <div>3:30</div>
      <div ><Lessons></Lessons></div>
      <div><Lessons></Lessons></div>
     
      <div ><Lessons></Lessons></div>
      <div ><Lessons></Lessons></div>
      <div><Lessons></Lessons></div>
      <div >4:30</div>
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