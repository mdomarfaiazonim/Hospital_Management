package com.Vital_Aid.Vital_Aid.Models;

import jakarta.persistence.*;

@Entity(name = "PatientCallsAmbulance")
public class PatientCallsAmbulance {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String Address;
    private String Contact;

    public PatientCallsAmbulance() {
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getContact() {
        return Contact;
    }

    public void setContact(String contact) {
        Contact = contact;
    }
}
