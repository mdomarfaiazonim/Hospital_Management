package com.Vital_Aid.Vital_Aid.DTOs;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Past;
import jakarta.validation.constraints.Size;

public class PatientDTO {
    @NotEmpty
    private String user_id;
    @NotEmpty
    private String user_name;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Past
    private Date date_of_birth;

    @NotEmpty
    private String blood_group;
    @NotEmpty
    private String user_address;

    @Size(min = 11, max = 11)
    private String user_contact;
    @Email
    private String user_email;
    @Size(min = 8, max = 30)
    private String user_password;
}
