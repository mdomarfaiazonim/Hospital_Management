package com.Vital_Aid.Vital_Aid.DTOs;

import jakarta.persistence.Column;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;

public class UserDTO {

    @Positive
    @Column(unique = true)
    private Long user_id;
    @Email
    @Column(unique = true)
    private String user_email;
    @Size(min = 8, max = 30, message = "Password should be between 8 to 30 characters")
    private String user_password;
    @NotEmpty
    @Size(min = 11, max = 11, message = "Contact number should be of 11 digits")
    @Column(unique = true)
    private String user_contact;
    @NotEmpty
    private String user_name;

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getUser_contact() {
        return user_contact;
    }

    public void setUser_contact(String user_contact) {
        this.user_contact = user_contact;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

}
