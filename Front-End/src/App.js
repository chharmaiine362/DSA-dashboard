import { useState } from 'react';
import './App.css';
import Header from './dashboard/Header';
import Sidebar from './dashboard/Sidebar';
import Home12 from './dashboard/Home12';
import Customers from './dashboard/Customers/Customers';
import FAQ from './dashboard/FAQ';
 // Make sure the path is correct
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
          {/* Add more routes as needed */}
        </Routes>
      </div>
    </Router>
  );
}

export default App;
