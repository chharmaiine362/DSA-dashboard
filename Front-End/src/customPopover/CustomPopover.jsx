// App.js
import React, { useState } from "react";
import 'bootstrap/dist/css/bootstrap.min.css';
import SearchItem1 from "../searchItem1/SearchItem1";
import Home from "../home/Home";

const CustomPopover = () => {
  // State to manage the selection of data types for graphing purposes.
  // Defaults to include "adult" data type.
  const [selectedDataTypes, setSelectedDataTypes] = useState(["adult"]);

  // Function to remove the graph line associated with the given index
  const removeGraphLine = (index) => {
    setSelectedDataTypes((prevSelectedDataTypes) => {
      return prevSelectedDataTypes.filter((_, i) => i !== index);
    });
  };

  // The component renders two children components:
  // SearchItem1 - component that allows users to select data types to be graphed. It receives two props: one for handling new data selection and another to remove a graph line.
  // Home - a component that displays the graphh. It receives the selectedDataTypes state to know which data types to display.
  return (
    <div>  
      <SearchItem1 handleDataSelection={setSelectedDataTypes} removeGraphLine={removeGraphLine} />
      <Home selectedDataTypes={selectedDataTypes} />
    </div>
  );
};

export default CustomPopover;
