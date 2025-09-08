package com.Vital_Aid.Vital_Aid.Models;

import jakarta.persistence.*;

@Entity
public class admin {

    @Id
    @Column(unique = true)
    private String admin_id;

    public admin() {

    }

    public String getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(String admin_id) {
        this.admin_id = admin_id;
    }
}
