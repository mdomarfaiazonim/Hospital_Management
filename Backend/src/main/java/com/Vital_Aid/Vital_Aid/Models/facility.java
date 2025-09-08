package com.Vital_Aid.Vital_Aid.Models;

import jakarta.persistence.*;

@Entity
public class facility {
    @Id
    @Column(unique = true)
    private String facility_name;

    public facility() {
    }

    public String getFacility_name() {
        return facility_name;
    }

    public void setFacility_name(String facility_name) {
        this.facility_name = facility_name;
    }
}
/*
* facility_name
* */