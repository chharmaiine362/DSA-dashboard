import React from 'react';
// Import the cable car icon from Boxicons and other icons from Bootstrap icons
import { BiSolidCableCar } from 'react-icons/bi';
import { BsGrid1X2Fill, BsFillArchiveFill, BsPeopleFill } from 'react-icons/bs';

function Sidebar({ openSidebarToggle, OpenSidebar }) {
  return (
    <aside id="sidebar" className={openSidebarToggle ? "sidebar-responsive" : ""}>
        <div className='sidebar-title'>
            <div className='sidebar-brand'>
                <BiSolidCableCar className='icon_header'/> MFLG
            </div>
            <span className='icon close_icon' onClick={OpenSidebar}>X</span>
        </div>

        <ul className='sidebar-list'>
            <li className='sidebar-list-item'>
                <a href="#">
                    <BsGrid1X2Fill className='icon'/> Dashboard
                </a>
            </li>
            <li className='sidebar-list-item'>
                <a href="#">
                    <BsFillArchiveFill className='icon'/> Products
                </a>
            </li>
            <li className='sidebar-list-item'>
                <a href="#">
                    <BsPeopleFill className='icon'/> Customers
                </a>
            </li>
        </ul>
    </aside>
  )
}

export default Sidebar;