import { useState, useEffect } from "react";


const AnnouncmentMainPage =({key, header, content}) =>{
  const [showModal, setShowModal] = useState(false);
  
return (
  <div className="anc-main" key = {key}>
     
     <h1 className="modal-title" id="myModalLabel" style={{fontSize: "15px"}}>
            {header}
      </h1>
     <p className={showModal ? "anc-main-long" : "anc-main-short"}>
          {content}
          </p>
          <button  onClick={() => {
              setShowModal(!showModal);
            }} >{showModal? "Gizle":"Devamını Oku" }
            </button>
  </div>
 
)
}

export default AnnouncmentMainPage;




