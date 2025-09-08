// package com.Vital_Aid.Vital_Aid.Controllers;

// import com.Vital_Aid.Vital_Aid.Services.patient_service;

// import jakarta.validation.Valid;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.web.bind.annotation.*;

// import com.Vital_Aid.Vital_Aid.DTOs.PatientDTO;
// import com.Vital_Aid.Vital_Aid.Models.Patient;

// import java.util.List;

// @RestController
// @CrossOrigin(origins = "*")
// @RequestMapping("/Patient")
// public class PatientController {

// @Autowired
// private patient_service ps;

// @GetMapping("/all")
// public List<Patient> getAllPatients() {
// return ps.getList();
// }

// @PostMapping("/add")
// public void addPatient(@Valid @RequestBody PatientDTO U) {
// Patient u = new Patient();
// u.setUser_id(U.getUser_id());
// u.setUser_email(U.getUser_email());
// u.setUser_password(U.getUser_password());
// u.setUser_contact(U.getUser_contact());
// u.setUser_name(U.getUser_name());
// u.setDate_of_birth(U.getDate_of_birth());

// ps.savePatients(u);
// }

// @PutMapping("/update")
// public void updatePatient(@RequestBody Patient u) {
// ps.updatePatients(u);
// }

// @DeleteMapping("/delete/{user_id}")
// public void deletePatient(@PathVariable String id) {
// ps.deletePatients(id);
// }
// }
