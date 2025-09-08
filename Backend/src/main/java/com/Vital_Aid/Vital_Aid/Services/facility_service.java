package com.Vital_Aid.Vital_Aid.Services;

import com.Vital_Aid.Vital_Aid.Models.facility;
import com.Vital_Aid.Vital_Aid.Repos.facility_repo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class facility_service {

    @Autowired
    private facility_repo fr;

    public facility_service() {
    }

    public List<facility> getList() {
        return fr.findAll();
    }

    public facility getFacility(String id) {
        List<facility> list = getList();

        for (facility _facility : list) {
            if (_facility.getFacility_name().equals(id))
                return _facility;
        }
        return new facility();
    }

    public void saveFacility(facility _facility) {
        fr.save(_facility);
    }

    public void updateFacility(facility fc) {
        List<facility> list = getList();

        for (facility _facility : list) {
            if (_facility.getFacility_name().equals(fc.getFacility_name())) {
                fr.delete(_facility);
                fr.save(fc);
                return;
            }
        }
    }

    public void deleteFacility(String name) {
        List<facility> list = getList();

        for (facility _facility : list) {
            if (_facility.getFacility_name().equals(name)) {
                fr.delete(_facility);
            }
        }
    }
}
