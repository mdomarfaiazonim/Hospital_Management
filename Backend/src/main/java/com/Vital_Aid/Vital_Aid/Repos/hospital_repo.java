package com.Vital_Aid.Vital_Aid.Repos;

import com.Vital_Aid.Vital_Aid.Models.hospital;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface hospital_repo extends JpaRepository<hospital,Long> {
    @Query("SELECT h FROM hospital h WHERE " +
            "(:hospital_name IS NULL OR :hospital_name = '' OR h.hospital_name LIKE %:hospital_name%) AND " +
            "(:hospital_location IS NULL OR :hospital_location ='' OR h.hospital_location LIKE %:hospital_location%)")
    public List<hospital> getFilteredHospital(@Param("hospital_name") String hospital_name, @Param("hospital_location")  String hospital_location);
}
