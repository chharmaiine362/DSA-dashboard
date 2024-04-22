// App.js
import React, { useState } from "react";
import 'bootstrap/dist/css/bootstrap.min.css';
import SearchItem1 from "./searchItem1/SearchItem1";
import Home from "./home/Home";

const App = () => {

  return (
    <div>  
      <SearchItem1 />
      <Home   />
    </div>
  );
};

export default App;
