import React from 'react';
import {
	FaAngleRight,
	FaAngleLeft, 
	FaBars
} from 'react-icons/fa';
import { NavLink } from "react-router-dom";
import { useState } from "react"
import items from "../sidebar.json";
import SidebarItem from './HomeSideBarItems';
const ICON_SIZE = 20;


function Navbar({visible, show}) {
 
	return (
		<>
			<div className="mobile-nav">
				<button
					className="mobile-nav-btn"
					onClick={() => show(!visible)}
				>
					<FaBars size={24}  />
				</button>
			</div>
			<nav className={!visible ? 'navbar' : ''}>
				<button
					type="button"
					className="nav-btn"
					onClick={() => show(!visible) }
				>
					{ !visible
						? <FaAngleRight size={30} /> : <FaAngleLeft size={30} />}
				</button>
                <img src={require('../pp.jpeg')} style={{padding : "2rem" , height: "10rem", borderRadius: "40%"}} />
                 <div className="sidebar">
         		 { items.map((item, index) => <SidebarItem key={index} item={item} />) }
        		</div> 
				
			</nav>
		</>
  );
}

export default Navbar;