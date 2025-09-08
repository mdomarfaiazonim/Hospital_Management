package com.Vital_Aid.Vital_Aid.Repos;

import com.Vital_Aid.Vital_Aid.Models.Patient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface Patient_repo extends JpaRepository<Patient, Long> {
}
