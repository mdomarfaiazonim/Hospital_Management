package com.Vital_Aid.Vital_Aid.Controllers;

import com.Vital_Aid.Vital_Aid.Models.doctor;
import com.Vital_Aid.Vital_Aid.Services.doctor_service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/doctor")
public class doctorController {

    @Autowired
    private doctor_service ds;

    @GetMapping("/all")
    public List<doctor> getAlldoctors() {
        return ds.getList();
    }

    @PostMapping("/add")
    public void addDoctor(@RequestBody doctor u) {
        ds.saveDoctor(u);
    }

    @GetMapping("/filter")
    public List<doctor> getFilteredDoctors(
            @RequestParam(required = false) String speciality,
            @RequestParam(required = false) String consultationTime,
            @RequestParam(required = false) String location,
            @RequestParam(required = false) String hospital,
            @RequestParam(required = false) String name) {
        return ds.getFilteredDoctors(speciality,consultationTime,location,hospital,name);
    }
}
