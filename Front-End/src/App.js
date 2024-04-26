import { useState } from 'react';
import './App.css';
import Header from './dashboard/Header';
import Sidebar from './dashboard/Sidebar';
import Home12 from './dashboard/Home12';
import Customers from './dashboard/Customers';
import FAQ from './dashboard/FAQ';
import 'bootstrap/dist/css/bootstrap.min.css';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';

// Main application component that sets up the routing and layout structure.
function App() {
  
  // State to manage the sidebar's open/close
  const [openSidebarToggle, setOpenSidebarToggle] = useState(false);
  
  // Function to toggle the sidebar's visibility.
  const OpenSidebar = () => {
    setOpenSidebarToggle(!openSidebarToggle);
  };

  return (
    <Router>
      <div className='grid-container'>
        <Header OpenSidebar={OpenSidebar}/>
        <Sidebar openSidebarToggle={openSidebarToggle} OpenSidebar={OpenSidebar}/>
    
        {/ Routing setup using React Router /}
        <Routes>
    
          <Route path="/" element={<Home12 />} />   // Route to the home page/dashboard 
          <Route path="/customers" element={<Customers />} />    // Route to the customers page
          <Route path="/FAQ" element={<FAQ />} />    // Route to the FAQ page

        </Routes>
      </div>
    </Router>
  );
}

export default App;
