import React, {useState} from 'react';
import Navbar from "./HomeSideInner";
import { BrowserRouter, Routes, Route,Navigate } from "react-router-dom";
import "../homeSide.css";
import Syllabus from "./Syllabus";


function HomeSide() {
	const [navVisible, showNavbar] = useState(false);
	const [css, setCss] = useState(false);

	return (
		
			<div >
				 <Navbar  visible={ navVisible } show={ showNavbar } />
				<Syllabus syllabusCss ={navVisible} css={css} setCss={setCss}></Syllabus>
			</div>
		
  );
}

export default HomeSide;