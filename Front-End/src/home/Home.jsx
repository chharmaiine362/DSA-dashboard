import React, { useState, useEffect } from "react";
import Chart from "react-apexcharts";
import jsonData from "../data.json";

function Home({ selectedDataType, selectedDataTypes }) {
  const [state, setState] = useState({
    chartOptions: {
      colors: [],
      xaxis: {
        categories: [],
        labels: {
          style: {
            colors: '#ffffff' // Set x-axis labels color to white
          }
        }
      },
      yaxis: {
        labels: {
          style: {
            colors: '#ffffff' // Set y-axis labels color to white
          }
        }
      }
    },
    series: [],
  });

  useEffect(() => {
    if (selectedDataType) {
      const palette = ['#d17393', '#dea859', '#4484b8'];
      const data = jsonData.data[selectedDataType];

      setState((prevState) => ({
        ...prevState,
        chartOptions: {
          ...prevState.chartOptions,
          colors: palette,
        },
        series: data.map((country, index) => ({
          name: country.name,
          data: country.values,
          color: palette[index % palette.length],
        })),
      }));
    } else if (selectedDataTypes.length > 0) {
      const seriesData = selectedDataTypes.map((dataType, index) => {
        const data = jsonData.data.find(item => item.name.toLowerCase().includes(dataType.toLowerCase()));
        if (data) {
          return {
            name: data.name,
            data: data.values,
          };
        } else {
          return null;
        }
      }).filter(item => item !== null);

      setState(prevState => ({
        ...prevState,
        series: seriesData,
      }));
    }
  }, [selectedDataType, selectedDataTypes]);

  const handleRangeChange = (event) => {
    const range = parseInt(event.target.value);
    setState((prevState) => ({
      ...prevState,
      chartOptions: {
        ...prevState.chartOptions,
        xaxis: {
          ...prevState.chartOptions.xaxis,
          categories: jsonData.years.slice(0, range),
        },
      },
      series: prevState.series.map((item) => ({
        ...item,
        data: item.data.slice(0, range),
      })),
    }));
  };

  return (
    <div className="App">
      <h1 className="text-primary text-white">Charts <i className="fas fa-user"></i></h1>
      {selectedDataType && (
        <h3>Data Type: {selectedDataType}</h3>
      )}
      <div className="chart-container" style={{ display: 'flex', flexDirection: 'column' }}>
        <div className="row col-2" style={{ marginLeft: "1rem" }}>
          <label htmlFor="timeRange" className="text-white">Time Range:</label>
          <input
            type="range"
            id="timeRange"
            min="1"
            max="25"
            defaultValue="25"
            onChange={handleRangeChange}
          />
        </div>
        <div className="row" style={{ display: 'flex', gap: '20px' }}>
          <div className="col-5">
            <Chart
              options={state.chartOptions}
              series={state.series}
              type="bar"
              width="450"
            />
          </div>
          <div className="col-5">
            <Chart
              options={state.chartOptions}
              series={state.series}
              type="line"
              width="450"
            />
          </div>
        </div>
      </div>
    </div>
  );
}

export default Home;
