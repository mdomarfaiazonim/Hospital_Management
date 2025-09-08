package com.Vital_Aid.Vital_Aid.Controllers;
import com.Vital_Aid.Vital_Aid.Models.hospital;
import com.Vital_Aid.Vital_Aid.Services.hospital_service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/hospital")
public class hospitalController {

    @Autowired
    private hospital_service hs;

    @GetMapping("/all")
    public List<hospital> getAllhospitals() {
        return hs.getList();
    }

    @PostMapping("/add")
    public void addhospital(@RequestBody hospital u) {
        hs.saveHospital(u);
    }

    @PutMapping("/update")
    public void updatehospital(@RequestBody hospital u) {
        hs.updateHospital(u);
    }

    @DeleteMapping("/delete/{hospital_id}")
    public void deletehospital(@PathVariable String id) {
        hs.deleteHospital(id);
    }
    @GetMapping("/filter")
    public List<hospital> getFilteredHospital(
            @RequestParam(required = false) String hospital_name
            ,@RequestParam(required = false) String hospital_location
            ) {
        return hs.getFilteredHospital(hospital_name,hospital_location);
    }
}
