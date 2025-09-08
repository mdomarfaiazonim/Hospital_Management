import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import '../style/Doctors.css';
import doctorList from '../data/doctors.json';

export default function Doctors() {
    const [selectedValues, setSelectedValues] = useState(Array(5).fill(''));
    const navigate = useNavigate();

    const handleSelectChange = (index, event) => {
        const updatedValues = [...selectedValues];
        updatedValues[index] = event.target.value;
        setSelectedValues(updatedValues);
    };

    const handleViewDetails = (doctor) => {
        navigate('/doctor_details', { state: { doctor } });
    };

    const filters = [
        { name: 'Location', options: ['Dhaka', 'Chittagong', 'Rajshahi', 'Khulna', 'Barishal', 'Sylhet', 'Rangpur', 'Mymensingh '] },
        { name: 'Field', options: ['Cardiology', 'Dermatology', 'ENT', 'Endocrinology', 'Gastroenterology', 'Gynecology', 'Hematology', 'Neurology', 'Oncology', 'Ophthalmology', 'Pediatrics', 'Psychiatry'] },
        { name: 'Hospital', options: ['Option 3A', 'Option 3B', 'Option 3C'] },
        { name: 'Availability', options: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'] },
    ];



    return (
        <div className="rout-container">
            <div className="doctor-container">
                <div className="heading caption">
                    <h1>Top Doctors of Vital Aid</h1>
                </div>
                <div className="filter-container">
                    <div className="filter-btn">
                        <button>Filter</button>
                        <i className="fa-solid fa-filter"></i>
                    </div>
                    {filters.map((filter, index) => (
                        <div key={index} className="filter">
                            <div className="filter-name">
                                <label>{filter.name}</label>
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

                <div className="view-doctors">
                    {doctorList.map((doctor, index) => (
                        <div className="doctor-cards" key={index}>
                            <div className="img-section">
                                <img src={doctor.img} alt="" />
                            </div>
                            <div className="doctor-detail">
                                <div className="doctor-data">
                                    <p>
                                        <span id="doctor-name">{doctor.name}</span><br />
                                        <span id="doctor-speciality">{doctor.speciality}</span><br />
                                        <span id="doctor-hospital">{doctor.hospital}</span><br />
                                        <span id="doctor-location">{doctor.location}</span>
                                    </p>
                                </div>
                                <div className="doctor-btn">
                                    <button>Book Appointment</button>
                                    <button onClick={() => handleViewDetails(doctor)}>View Details</button>
                                </div>
                            </div>
                        </div>
                    ))}
                </div>
            </div>
        </div>
    );
}
