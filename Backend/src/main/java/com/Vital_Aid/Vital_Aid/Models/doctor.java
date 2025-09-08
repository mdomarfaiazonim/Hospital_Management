package com.Vital_Aid.Vital_Aid.Models;
import jakarta.persistence.*;
import java.util.List;

@Entity
public class doctor {

    @Id
    @Column(unique = true)
    private String email;
    private String name;
    private String speciality;
    private String fees;
    private String contact;
    private String img;
    private String degree;
    private String location;
    private String hospital;
    private String consultationTime;

    public doctor() {
    }

    public doctor(String name, String speciality, String fees, String contact, String email, String img, String degree, String location, String hospital, List<String> consultationDays, String consultationTime) {
        this.name = name;
        this.speciality = speciality;
        this.fees = fees;
        this.contact = contact;
        this.email = email;
        this.img = img;
        this.degree = degree;
        this.location = location;
        this.hospital = hospital;
        this.consultationTime = consultationTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }



    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }

    public String getFees() {
        return fees;
    }

    public void setFees(String fees) {
        this.fees = fees;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getHospital() {
        return hospital;
    }

    public void setHospital(String hospital) {
        this.hospital = hospital;
    }

    public String getConsultationTime() {
        return consultationTime;
    }

    public void setConsultationTime(String consultationTime) {
        this.consultationTime = consultationTime;
    }
}