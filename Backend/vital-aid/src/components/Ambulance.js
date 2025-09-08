
import React, { useEffect, useState } from "react";
import axios from "axios";
import Box from '@mui/material/Box';
import TextField from '@mui/material/TextField';
import Button from '@mui/material/Button';
import Stack from '@mui/material/Stack';

export default function Ambulance() {
    const [address,setAddress]=useState("");
    const [contact,setContact]=useState("");

    const addPatient = async (e) => {
        e.preventDefault();
        try {
            const response = await axios.post("http://localhost:8080/Patient_Calls_Ambulance/add", {
                address: address,
                contact: contact
            });
            setAddress("");
            setContact("");
            console.log("Patient added:", response.data);
        } catch (error) {
            console.error("Error adding patient:", error);
        }
    }
    const getAllPatients = async () => {
        try {
            const response = await axios.get("http://localhost:8080/Patient_Calls_Ambulance/all");

            console.log("All patients:", response.data);
        } catch (error) {
            console.error("Error getting all patients:", error);
        }
    }


    function alerdialog(){
        alert("Your register completer, Ambulance is on the way");
    }
    return (
       <div>
            <Box
                 component="form"
                 sx={{ '& > :not(style)': { m: 1, width: '25ch' } }}
                 noValidate
                 autoComplete="off"
            >
            <br/>
            <br/>
            <br/>
            <br/>

            Input de
            <TextField
                 id="outlined-basic"
                 label="Address"
                 variant="outlined"
                 onChange={(e) => setAddress(e.target.value)}
            />
            <TextField
                 id="outlined-basic"
                 label="Contact"
                 variant="outlined"
                 onChange={(e) => setContact(e.target.value)}
            />
            <Stack direction="row" spacing={2}>
                 <Button onClick={addPatient} onClick={alerdialog}>Call Ambulance</Button>
            </Stack>
            </Box>
       </div>
    );
}
