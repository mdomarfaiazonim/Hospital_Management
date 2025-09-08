package com.Vital_Aid.Vital_Aid.Models;

import jakarta.persistence.*;

@Entity
public class hospital {

        @Id
        @Column(unique = true)
        private String hospital_id;
        private String hospital_name;
        private String hospital_location;
        private String hospital_contact_no;
        private String hospital_email;
        private int hospital_total_dr;
        private int hospital_total_bed;

        public hospital() {

        }

    public String getHospital_id() {
        return hospital_id;
    }

    public void setHospital_id(String hospital_id) {
        this.hospital_id = hospital_id;
    }

    public String getHospital_name() {
        return hospital_name;
    }

    public void setHospital_name(String hospital_name) {
        this.hospital_name = hospital_name;
    }

    public String getHospital_location() {
        return hospital_location;
    }

    public void setHospital_location(String hospital_location) {
        this.hospital_location = hospital_location;
    }

    public String getHospital_contact_no() {
        return hospital_contact_no;
    }

    public void setHospital_contact_no(String hospital_contact_no) {
        this.hospital_contact_no = hospital_contact_no;
    }

    public String getHospital_email() {
        return hospital_email;
    }

    public void setHospital_email(String hospital_email) {
        this.hospital_email = hospital_email;
    }

    public int getHospital_total_dr() {
        return hospital_total_dr;
    }

    public void setHospital_total_dr(int hospital_total_dr) {
        this.hospital_total_dr = hospital_total_dr;
    }

    public int getHospital_total_bed() {
        return hospital_total_bed;
    }

    public void setHospital_total_bed(int hospital_total_bed) {
        this.hospital_total_bed = hospital_total_bed;
    }
}