import { useState, useEffect } from "react";


const Lessons =({key, header, content}) =>{
  const [showModal, setShowModal] = useState(false);
  
return (
  <div >
    <h5>Bilgisayar Mühendisliği</h5>
     <div>CME 3207-SIGNALS AND SYSTEMS FOR COMPUTER ENGINEERING
     2.Şube Uygulama
        DOÇ.DR. YAVUZ ŞENOL</div>
        <br></br>
        <div>Derslik:C BLOK-Z-16 <br></br>
Ogrenim Sekli:Normal Ogretim</div>
     
   
  </div>
 
)
}

export default Lessons;
