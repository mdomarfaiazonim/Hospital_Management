package com.Vital_Aid.Vital_Aid.Services;

import com.Vital_Aid.Vital_Aid.Models.hospital;
import com.Vital_Aid.Vital_Aid.Repos.hospital_repo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class hospital_service {
    @Autowired
    private hospital_repo hr;

    public hospital_service() {
    }

    public List<hospital> getList() {
        return hr.findAll();
    }

    public hospital getHospital(String id) {
        List<hospital> list = getList();

        for (hospital _hospital : list) {
            if (_hospital.getHospital_id().equals(id))
                return _hospital;
        }
        return new hospital();
    }

    public void saveHospital(hospital _hospital) {
        hr.save(_hospital);
    }

    public void updateHospital(hospital hsptl) {
        List<hospital> list = getList();

        for (hospital _hospital : list) {
            if (_hospital.getHospital_id().equals(hsptl.getHospital_id())) {
                hr.delete(_hospital);
                hr.save(hsptl);
                return;
            }
        }
    }

    public void deleteHospital(String id) {
        List<hospital> list = getList();

        for (hospital _hospital : list) {
            if (_hospital.getHospital_id().equals(id)) {
                hr.delete(_hospital);
            }
        }
    }

    public List<hospital> getFilteredHospital(String hospital_name, String hospital_location) {
        return hr.getFilteredHospital(hospital_name, hospital_location);
    }
}
