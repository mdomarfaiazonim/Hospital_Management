package com.Vital_Aid.Vital_Aid.Services;

import com.Vital_Aid.Vital_Aid.DTOs.AmbulanceDTO;
import com.Vital_Aid.Vital_Aid.Models.ambulance;
import com.Vital_Aid.Vital_Aid.Repos.ambulance_repo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class ambulance_service {

    @Autowired
    private ambulance_repo ambulanceRepository;

    // Save an ambulance
    public ambulance saveAmbulance(AmbulanceDTO ambulanceDTO) {
        ambulance ambulance = mapToEntity(ambulanceDTO);

        if (ambulanceRepository.existsById(ambulance.getAmbulance_num_plate().toString())) {
            throw new IllegalArgumentException(
                    "Ambulance already exists with number plate: " + ambulance.getAmbulance_num_plate());
        }
        return ambulanceRepository.save(ambulance);
    }

    // Get an ambulance by number plate
    public Optional<ambulance> getAmbulance(Long ambulance_num_plate) {
        if (!ambulanceRepository.existsById(ambulance_num_plate.toString())) {
            throw new IllegalArgumentException("Ambulance not found with number plate: " + ambulance_num_plate);
        }
        return ambulanceRepository.findById(ambulance_num_plate.toString());
    }

    // Get all ambulances
    public List<ambulance> getAllAmbulances() {
        if (ambulanceRepository.findAll().isEmpty()) {
            throw new IllegalArgumentException("No ambulances found");
        }
        return ambulanceRepository.findAll();
    }

    // Update an ambulance
    public ambulance updateAmbulance(Long ambulance_num_plate, AmbulanceDTO updatedAmbulanceDTO) {
        ambulance ambulance = ambulanceRepository.findById(ambulance_num_plate.toString())
                .orElseThrow(() -> new IllegalArgumentException(
                        "Ambulance not found with num plate: " + ambulance_num_plate));

        // Update the ambulance details
        ambulance.setDriver_contact(updatedAmbulanceDTO.getDriver_contact());
        ambulance.setOxygen_status(updatedAmbulanceDTO.getOxygen_status());

        return ambulanceRepository.save(ambulance);
    }

    // Delete an ambulance
    public void deleteAmbulance(Long ambulance_num_plate) {
        if (!ambulanceRepository.existsById(ambulance_num_plate.toString())) {
            throw new IllegalArgumentException("Ambulance not found with num plate: " + ambulance_num_plate);
        }
        ambulanceRepository.deleteById(ambulance_num_plate.toString());
    }

    // Helper method to map DTO to entity
    private ambulance mapToEntity(AmbulanceDTO ambulanceDTO) {
        ambulance ambulance = new ambulance();
        ambulance.setAmbulance_num_plate(ambulanceDTO.getAmbulance_num_plate());
        ambulance.setDriver_contact(ambulanceDTO.getDriver_contact());
        ambulance.setOxygen_status(ambulanceDTO.getOxygen_status());
        return ambulance;
    }
}
