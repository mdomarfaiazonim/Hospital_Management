import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import '../style/Hospitals.css';
import hospitalList from '../data/hospitals.json';

export default function Hospitals() {
  const [selectedValues, setSelectedValues] = useState(Array(5).fill(''));
  const navigate = useNavigate();

  const handleSelectChange = (index, event) => {
    const updatedValues = [...selectedValues];
    updatedValues[index] = event.target.value;
    setSelectedValues(updatedValues);
  };

  const handleViewDetails = (hospital) => {
    navigate('/hospital_details', { state: { hospital } });
  };

  const filters = [
    { name: 'Location', options: ['Dhaka', 'Chittagong', 'Rajshahi', 'Khulna', 'Barishal', 'Sylhet', 'Rangpur', 'Mymensingh'] },
  ];


  return (
    <div className="rout-container">
      <div className="hospital-container">
        <div className="heading caption">
          <h1>Hospitals of Vital Aid</h1>
        </div>
        <div className="filter-container">
          {/* <div className="filter-btn">
                        <button>Filter</button>
                        <i className="fa-solid fa-filter"></i>
                    </div> */}
          {filters.map((filter, index) => (
            <div key={index} className="filter">
              <div className="filter-name">
                <label>Filter by Location</label>
              </div>
              <select
                value={selectedValues[index]}
                onChange={(event) => handleSelectChange(index, event)}
                className="filter-select"
              >
                <option value="">All</option>
                {filter.options.map((option, i) => (
                  <option key={i} value={option}>
                    {option}
                  </option>
                ))}
              </select>
            </div>
          ))}
        </div>

        <div className="view-hospitals">
          {hospitalList.map((hospital, index) => (
            <div className="hospital-cards" key={index}>
              <div className="img-section">
                <img src={hospital.img || 'placeholder.jpg'} alt='' />
              </div>
              <div className="hospital-detail">
                <div className="hospital-data">
                  <p>
                    <span id="hospital-name">{hospital.name}</span><br />
                    <span id="hospital-location">{hospital.address}</span>
                  </p>
                </div>
                {/* <div className="hospital-btn">
                                    <button>Book Appointment</button>
                                    <button onClick={() => handleViewDetails(hospital)}>View Details</button>
                                </div> */}
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
