package com.Vital_Aid.Vital_Aid.Repos;

import com.Vital_Aid.Vital_Aid.Models.facility;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface facility_repo extends JpaRepository<facility, Long> {
}
