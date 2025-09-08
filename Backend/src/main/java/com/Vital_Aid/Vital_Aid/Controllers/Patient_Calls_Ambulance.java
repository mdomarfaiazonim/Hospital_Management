package com.Vital_Aid.Vital_Aid.Controllers;

import com.Vital_Aid.Vital_Aid.Models.PatientCallsAmbulance;
import com.Vital_Aid.Vital_Aid.Services.PatientCallsAmbulanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/Patient_Calls_Ambulance")
public class Patient_Calls_Ambulance {

    @Autowired
    private PatientCallsAmbulanceService pcr;

    @GetMapping("/all")
    public List<PatientCallsAmbulance> getAllPatients() {
        return pcr.getList();
    }

    @PostMapping("/add")
    public void addPatientInfo(@RequestBody PatientCallsAmbulance pa){
        pcr.addPatientInfo(pa);
    }


}
