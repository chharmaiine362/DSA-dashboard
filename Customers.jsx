import React, { useState, useEffect } from 'react';
import Papa from 'papaparse';

function Customers() {
  const [customers, setCustomers] = useState([]);

  useEffect(() => {
    // Assuming your CSV file is placed in the public folder
    fetch('../sample.csv')
      .then(response => response.text())
      .then(csvText => {
        Papa.parse(csvText, {
          header: true,
          complete: (results) => {
            console.log(results.data); // Check the parsed results
            setCustomers(results.data);
          }
        });
      })
      .catch(error => console.error('Error parsing CSV file:', error));
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
              <td>{customer.ORDER_NUMBER}</td>
              <td>{customer.QUANTITY}</td>
              <td>${customer.PRICE}</td>
              <td>{customer.ORDER_DATE}</td>
              <td>{customer.QTR_ID}</td>
              <td>{customer.MONTH_ID}</td>
              <td>{customer.YEAR_ID}</td>
              <td>{customer.CUSTOMER_NAME}</td> {/* Make sure field names match CSV headers */}
              <td>{customer.PHONE}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default Customers;
