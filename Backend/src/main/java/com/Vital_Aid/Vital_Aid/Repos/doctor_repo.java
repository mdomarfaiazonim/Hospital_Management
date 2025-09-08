package com.Vital_Aid.Vital_Aid.Repos;

import com.Vital_Aid.Vital_Aid.Models.doctor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface doctor_repo extends JpaRepository<doctor, Long> {

    @Query("SELECT h FROM doctor h WHERE " +
            "(:speciality IS NULL OR :speciality = '' OR h.speciality = :speciality) AND " +
            "(:consultationTime IS NULL OR :consultationTime ='' OR h.consultationTime = :consultationTime) AND " +
            "(:location IS NULL OR :location='' OR h.location = :location) AND " +
            "(:name IS NULL OR :name='' OR h.name = :name) AND " +
            "(:hospital IS NULL OR :hospital='' OR h.hospital = :hospital)")
    public List<doctor> getFilteredDoctors(@Param("speciality") String speciality,
            @Param("consultationTime") String consultationTime, @Param("location") String location,
            @Param("name") String name, @Param("hospital") String hospital);
}
