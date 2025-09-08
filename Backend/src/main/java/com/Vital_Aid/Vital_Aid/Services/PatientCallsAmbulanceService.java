package com.Vital_Aid.Vital_Aid.Services;

import com.Vital_Aid.Vital_Aid.Models.PatientCallsAmbulance;
import com.Vital_Aid.Vital_Aid.Repos.PatientCallsAmbulanceRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PatientCallsAmbulanceService {

    @Autowired
    private PatientCallsAmbulanceRepo pcar;

    public PatientCallsAmbulanceService() {
    }

    public List<PatientCallsAmbulance> getList() {
        return pcar.findAll();
    }

    public void addPatientInfo(PatientCallsAmbulance pa) {
        pcar.save(pa);
    }

}
