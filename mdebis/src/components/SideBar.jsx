import { useEffect } from "react";
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
            onClick={() => {
              setShowModal(false);
            }}
          >
            <span aria-hidden="true">&times;</span>
          </button>
          <h4 className="modal-title" id="myModalLabel">
            Rigth Sidebar
          </h4>
          <p>
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
          <p>
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
        </div>

        <div className="modal-body">
          <p>{content}</p>
        </div>
      </div>
    </div>
  );
}
