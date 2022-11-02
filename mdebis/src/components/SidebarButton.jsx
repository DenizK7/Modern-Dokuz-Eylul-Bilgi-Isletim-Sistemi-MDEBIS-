
import { useState } from "react";
import Sidebar from "./SideBar";

const SidebarButton =() =>{
  const [showModal, setShowModal] = useState(false);
  let content="";
return (
  <div>
<button className={"sidebarButton"}
  onClick={() => {
    var xhttp = new XMLHttpRequest();
    xhttp.open("GET", "http://localhost:8080/get_gen_announcements",false);
    xhttp.setRequestHeader("Content-type", "text/html");
    xhttp.send();
    var response = JSON.parse(xhttp.response);
    content=response[0].Title
    console.log(response[0].Title)
    setShowModal(!showModal);
  }}
>
</button>
<Sidebar showModal={showModal} setShowModal={setShowModal} />
  </div>   
  );

}
export default SidebarButton;