package com.Vital_Aid.Vital_Aid.DTOs;

import jakarta.persistence.Column;
import jakarta.persistence.Id;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Positive;

public class AmbulanceDTO {

    @Id
    @Column(unique = true)
    @Positive
    private Long ambulance_num_plate;

    @Pattern(regexp = "^01[3-9]\\d{8}$", message = "Driver contact must be a valid Bangladeshi phone number starting with 013-019 and followed by 8 digits")
    private String driver_contact;

    private Boolean oxygen_status = false;

    // Getters and Setters
    public Long getAmbulance_num_plate() {
        return ambulance_num_plate;
    }

    public void setAmbulance_num_plate(Long ambulance_num_plate) {
        this.ambulance_num_plate = ambulance_num_plate;
    }

    public String getDriver_contact() {
        return driver_contact;
    }

    public void setDriver_contact(String driver_contact) {
        this.driver_contact = driver_contact;
    }

    public Boolean getOxygen_status() {
        return oxygen_status;
    }

    public void setOxygen_status(Boolean oxygen_status) {
        this.oxygen_status = oxygen_status;
    }
}
