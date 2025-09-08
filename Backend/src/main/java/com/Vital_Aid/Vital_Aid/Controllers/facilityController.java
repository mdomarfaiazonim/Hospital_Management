package com.Vital_Aid.Vital_Aid.Controllers;

import com.Vital_Aid.Vital_Aid.Services.facility_service;
import com.Vital_Aid.Vital_Aid.Models.facility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/facility")
public class facilityController {

    @Autowired
    private facility_service fs;

    @GetMapping("/all")
    public List<facility> getAllfacilitys() {
        return fs.getList();
    }

    @PostMapping("/add")
    public void addfacility(@RequestBody facility u) {
        fs.saveFacility(u);
    }

    @PutMapping("/update")
    public void updatefacility(@RequestBody facility u) {
        fs.updateFacility(u);
    }

    @DeleteMapping("/delete/{facility_name}")
    public void deletefacility(@PathVariable String name) {
        fs.deleteFacility(name);
    }
}
