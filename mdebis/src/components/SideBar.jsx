import { useEffect } from "react";
import AnnouncmentMainPage from "./AnnouncmentMainPage";
export default function Sidebar(props) {
  const { showModal, setShowModal, content } = props;

  useEffect(() => {
    // call click outside
  }, []);

  return (
    <div
      className={showModal ? "modal-dialog show" : "modal-dialog"}
      role="document"
    >
      <div className="modal-content">
        <div className="modal-header">
        <button
            type="button"
            className="close"
            data-dismiss="modal"
            aria-label="Close"
            style ={{width:"25px", marginTop:"1vh", height:"25px"}}
            onClick={() => {
              setShowModal(false);
            }}
          ></button>
          
        </div>

        <div className="modal-body">
        <p>{content}</p>
        </div>
      </div>
    </div>
  );
}
