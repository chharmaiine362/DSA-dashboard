import React from 'react';
import { BiSolidCableCar } from 'react-icons/bi';
import { BsGrid1X2Fill, BsFillArchiveFill, BsPeopleFill } from 'react-icons/bs';
import { Link } from 'react-router-dom';

// The Sidebar component renders the navigation menu for the application.
// It accepts props such as openSidebarToggle and OpenSidebar to control the toggling of the sidebar's visibility.

function Sidebar({ openSidebarToggle, OpenSidebar }) {
  return (
    // The sidebar's visibility is controlled by the openSidebarToggle prop.
    // It applies a responsive class to show or hide the sidebar.
    <aside id="sidebar" className={openSidebarToggle ? "sidebar-responsive" : ""}>
        <div className='sidebar-title'>
            <div className='sidebar-brand'>
                <BiSolidCableCar className='icon_header'/> MFLG
            </div>
            <span className='icon close_icon' onClick={OpenSidebar}>X</span>
        </div>

        <ul className='sidebar-list'>
            <li className='sidebar-list-item'>
                <Link to="/">
                    <BsGrid1X2Fill className='icon'/> Dashboard
                </Link>
            </li>
            <li className='sidebar-list-item'>
                <Link to="/customers">
                    <BsPeopleFill className='icon'/> Customers
                </Link>
            </li>
            <li className='sidebar-list-item'>
                <Link to="/FAQ">
                    <BsFillArchiveFill className='icon'/> FAQ
                </Link>
            </li>
            {/* Add more links as needed */}
        </ul>
    </aside>
  );
}

export default Sidebar;
