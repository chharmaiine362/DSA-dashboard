import React, { useState, useEffect } from 'react';
import CSV from 'parse-csv'; // Assuming you are using a CSV parsing library

// Replace with the path to your CSV data file, or fetch it from an API
import csvData from '/Users/charmainelim/Downloads/new/src/dashboard/sample_data.csv';

function Customers() {
  const [customers, setCustomers] = useState([]);

  useEffect(() => {
    // Parse the CSV data and update the state
    const parser = new CSV.Parser();
    const result = parser.parse(csvData);
    setCustomers(result.data);
  }, []);

  return (
    <div className="customers-container">
      <h1>Customer Orders</h1>
      <table>
        <thead>
          <tr>
            <th>Order Number</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Order Date</th>
            <th>Qtr ID</th>
            <th>Month ID</th>
            <th>Year ID</th>
            <th>Customer Name</th>
            <th>Phone</th>
          </tr>
        </thead>
        <tbody>
          {customers.map((customer, index) => (
            <tr key={index}>
              <td>{customer['ORDER NUMBER']}</td>
              <td>{customer['QUANTITY']}</td>
              <td>${customer['PRICE']}</td>
              <td>{customer['ORDER DATE']}</td>
              <td>{customer['QTR_ID']}</td>
              <td>{customer['MONTH_ID']}</td>
              <td>{customer['YEAR_ID']}</td>
              <td>{customer['CUSTOMER NAME']}</td>
              <td>{customer['PHONE']}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default Customers;
