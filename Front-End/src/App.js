import { useState } from 'react';
import './App.css';
import Header from './dashboard/Header';
import Sidebar from './dashboard/Sidebar';
import Home12 from './dashboard/Home12';
import Customers from './dashboard/Customers';
import FAQ from './dashboard/FAQ';
import 'bootstrap/dist/css/bootstrap.min.css';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';

function App() {
  const [openSidebarToggle, setOpenSidebarToggle] = useState(false);

  const OpenSidebar = () => {
    setOpenSidebarToggle(!openSidebarToggle);
  };

  return (
    <Router>
      <div className='grid-container'>
        <Header OpenSidebar={OpenSidebar}/>
        <Sidebar openSidebarToggle={openSidebarToggle} OpenSidebar={OpenSidebar}/>
        <Routes>
          <Route path="/" element={<Home12 />} />
          <Route path="/customers" element={<Customers />} />
          <Route path="/FAQ" element={<FAQ />} />
          <Route path="*" element={<div>No content available - check your route paths and component rendering.</div>} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;
