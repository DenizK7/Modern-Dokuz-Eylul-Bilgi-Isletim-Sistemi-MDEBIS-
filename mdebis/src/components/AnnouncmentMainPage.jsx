import { useState } from "react";


const AnnouncmentMainPage =() =>{
  const [showModal, setShowModal] = useState(false);
  
return (
  <div className="anc-main">
     
     <h1 className="modal-title" id="myModalLabel">
            Haber
      </h1>
     <p className={showModal ? "anc-main-long" : "anc-main-short"}>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer
            vitae nulla ut ex lobortis aliquet eu non urna. Morbi fringilla,
            nulla sit amet vulputate lobortis, justo lectus porta erat, vitae
            placerat sem velit rutrum leo. Nunc vestibulum diam sed imperdiet
            viverra. Donec ultricies viverra leo ac tempus. Phasellus laoreet,
            libero id molestie bibendum, massa ligula pharetra mauris, tincidunt
            pretium ligula diam eu lacus. Suspendisse sagittis porta posuere.
            Maecenas at ornare nulla. Pellentesque et urna in metus iaculis
            porttitor a ac arcu. Aliquam ligula mauris, venenatis in magna at,
            lacinia ultrices justo. Aenean eget commodo urna. Vivamus gravida
            congue leo. Ut eleifend congue tortor vel porttitor. Pellentesque
            eleifend massa libero. Integer imperdiet tincidunt augue nec
            sodales.
          </p>
          <button  onClick={() => {
              setShowModal(!showModal);
            }} >{showModal? "Gizle":"Devamını Oku" }
            </button>
  </div>
 
)
}
export default AnnouncmentMainPage;