package com.Vital_Aid.Vital_Aid.Controllers;

import com.Vital_Aid.Vital_Aid.Services.ambulance_service;
import jakarta.validation.Valid;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.Vital_Aid.Vital_Aid.DTOs.AmbulanceDTO;
import com.Vital_Aid.Vital_Aid.Models.ambulance;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/ambulance")
public class ambulanceController {

    @Autowired
    private ambulance_service asc;

    @PostMapping("/add")
    public ResponseEntity<ambulance> createAmbulance(@Valid @RequestBody AmbulanceDTO ambulanceDTO) {

        ambulance createdAmbulance = asc.saveAmbulance(ambulanceDTO);

        return ResponseEntity.ok(createdAmbulance); // HTTP 200 OK with the created ambulance
    }

    @GetMapping("/get/{ambulance_num_plate}")
    public ResponseEntity<ambulance> getAmbulance(@PathVariable Long ambulance_num_plate) {
        Optional<ambulance> foundAmbulance = asc.getAmbulance(ambulance_num_plate);
        if (foundAmbulance.isPresent()) {
            return ResponseEntity.ok(foundAmbulance.get()); // HTTP 200 OK if ambulance is found
        } else {
            return ResponseEntity.notFound().build(); // HTTP 404 Not Found if ambulance doesn't exist
        }
    }

    @GetMapping("/all")
    public ResponseEntity<List<ambulance>> getAllAmbulances() {
        List<ambulance> allAmbulances = asc.getAllAmbulances();
        return ResponseEntity.ok(allAmbulances); // HTTP 200 OK with the list of ambulances
    }

    @PutMapping("/update/{ambulance_num_plate}")
    public ResponseEntity<ambulance> updateAmbulance(@PathVariable Long ambulance_num_plate,
            @RequestBody AmbulanceDTO updatedAmbulance) {
        ambulance updated = asc.updateAmbulance(ambulance_num_plate, updatedAmbulance);
        if (updated != null) {
            return ResponseEntity.ok(updated); // HTTP 200 OK with the updated ambulance
        } else {
            return ResponseEntity.notFound().build(); // HTTP 404 Not Found if ambulance doesn't exist
        }
    }

    @DeleteMapping("/delete/{ambulance_num_plate}")
    public ResponseEntity<String> deleteAmbulance(@PathVariable Long ambulance_num_plate) {
        Optional<ambulance> deleted = asc.getAmbulance(ambulance_num_plate);
        if (deleted.isPresent()) {
            asc.deleteAmbulance(ambulance_num_plate);
            return ResponseEntity.ok("Ambulance deleted successfully"); // HTTP 200 OK if ambulance is deleted
        } else {
            return ResponseEntity.notFound().build(); // HTTP 404 Not Found if ambulance doesn't exist
        }
    }
}
