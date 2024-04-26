import React from 'react'
import 
{ BsFillArchiveFill, BsFillGrid3X3GapFill, BsPeopleFill, BsFillBellFill}
 from 'react-icons/bs'
 import 
 { BarChart, Bar, Cell, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer, LineChart, Line } 
 from 'recharts';
import CustomPopover from '../customPopover/CustomPopover';
// import Dashboard from './mainDashboard/Dashboard';
// The Home12 component serves as a main dashboard page, displaying various data visualizations and statistics.
function Home12() {

    const data = [
        {
          name: 'Page A',
          uv: 4000,
          pv: 2400,
          amt: 2400,
        },
        {
          name: 'Page B',
          uv: 3000,
          pv: 1398,
          amt: 2210,
        },
        {
          name: 'Page C',
          uv: 2000,
          pv: 9800,
          amt: 2290,
        },
        {
          name: 'Page D',
          uv: 2780,
          pv: 3908,
          amt: 2000,
        },
        {
          name: 'Page E',
          uv: 1890,
          pv: 4800,
          amt: 2181,
        },
        {
          name: 'Page F',
          uv: 2390,
          pv: 3800,
          amt: 2500,
        },
        {
          name: 'Page G',
          uv: 3490,
          pv: 4300,
          amt: 2100,
        },
      ];
     

  return (
    <main className='main-container'>
        // Title section of the dashboard 
        <div className='main-title'>
            <h3>DASHBOARD</h3>
        </div>
     
        // Card section for displaying key metrics in a summarized format
        <div className='main-cards text-white'>
            <div className='card'>
                <div className='card-inner'>
                    // Individual card for displaying tickets statistics
                    <h3 className='text-color'>Tickets Bought/Year</h3>
                    <BsFillArchiveFill className='card_icon'/>
                </div>
                <h1 className='text-white text-color'>300</h1>
            </div>
            <div className='card'>
                <div className='card-inner'>
                    // Card for displaying revenue
                    <h3 className='text-white text-color'>Revenue/Year</h3>
                    <BsFillGrid3X3GapFill className='card_icon'/>
                </div>
                <h1 className='text-white text-color'>$9973</h1>
            </div>
            <div className='card'>
                <div className='card-inner'>
                    // Card for displaying customer count
                    <h3 className='text-white text-color'>Customers/Year</h3>
                    <BsPeopleFill className='card_icon'/>
                </div>
                <h1 className='text-white text-color'>268</h1>
            </div>
            <div className='card'>
                <div className='card-inner'>
                    // Card for displaying weather information
                    <h3 className='text-white text-color' >Weather/°C</h3>
                    <BsFillBellFill className='card_icon'/>
                </div>
                <h1 className='text-white text-color'>Sunny</h1>
            </div>
        </div>



<div className="charts">
  <CustomPopover />
</div>   

    </main>
  )
}

export default Home12
