package com.Vital_Aid.Vital_Aid.Models;

import jakarta.persistence.*;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;

@Entity
public class ambulance {

    @Id
    @Column(unique = true)
    @Positive
    private Long ambulance_num_plate;

    @Size(min = 11, max = 11, message = "Driver contact must be a valid phone number")
    @Pattern(regexp = "\\d+", message = "Driver contact must contain only digits")
    private String driver_contact;

    private Boolean oxygen_status = false;

    public ambulance() {
    }

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
