import { useState } from "react";


const AnnouncmentMainPage =({content}) =>{
  const [showModal, setShowModal] = useState(false);
  
return (
  <div className="anc-main">
     
     <h1 className="modal-title" id="myModalLabel">
            Haber
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