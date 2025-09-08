package com.Vital_Aid.Vital_Aid.Repos;

import com.Vital_Aid.Vital_Aid.Models.medical_store;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface medical_store_repo extends JpaRepository<medical_store, Long> {
}
