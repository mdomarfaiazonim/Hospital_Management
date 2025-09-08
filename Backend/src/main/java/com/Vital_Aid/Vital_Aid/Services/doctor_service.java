package com.Vital_Aid.Vital_Aid.Services;

import com.Vital_Aid.Vital_Aid.Models.doctor;
import com.Vital_Aid.Vital_Aid.Repos.doctor_repo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class doctor_service {

    @Autowired
    private doctor_repo dr;

    public doctor_service() {

    }

    public List<doctor> getList() {
        return dr.findAll();
    }

    public doctor getDoctor(String name) {
        List<doctor> list = getList();
        for (doctor dc : list) {
            if (dc.getName().equals(name))
                return dc;
        }
        return null;
    }

    public void saveDoctor(doctor dc) {
        dr.save(dc);
    }

    public List<doctor> getFilteredDoctors(String speciality, String consultationTime, String location, String hospital,
            String name) {
        return dr.getFilteredDoctors(speciality, consultationTime, location, hospital, name);
    }

}
