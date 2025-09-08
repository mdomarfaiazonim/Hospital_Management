package com.Vital_Aid.Vital_Aid.Repos;

import com.Vital_Aid.Vital_Aid.Models.PatientCallsAmbulance;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PatientCallsAmbulanceRepo extends JpaRepository<PatientCallsAmbulance,Long> {
}
