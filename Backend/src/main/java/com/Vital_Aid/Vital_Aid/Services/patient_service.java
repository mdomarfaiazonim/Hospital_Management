package com.Vital_Aid.Vital_Aid.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.Vital_Aid.Vital_Aid.Repos.Patient_repo;
import com.Vital_Aid.Vital_Aid.Models.Patient;

import java.util.List;

@Service
public class patient_service {

    @Autowired
    private Patient_repo pr;

    public patient_service() {
    }

    public List<Patient> getList() {
        return pr.findAll();
    }

    public Patient getPatient(String id) {
        List<Patient> list = getList();

        for (Patient patients : list) {
            if (patients.getUser_id().equals(id))
                return patients;
        }
        return new Patient();
    }

    public void savePatients(Patient patients) {
        pr.save(patients);
    }

    public void updatePatients(Patient _patient) {
        List<Patient> list = getList();

        for (Patient patients : list) {
            if (patients.getUser_id().equals(_patient.getUser_id())) {
                pr.delete(patients);
                pr.save(_patient);
                return;
            }
        }
    }

    public void deletePatients(String id) {
        List<Patient> list = getList();

        for (Patient patients : list) {
            if (patients.getUser_id().equals(id)) {
                pr.delete(patients);
            }
        }
    }

}
