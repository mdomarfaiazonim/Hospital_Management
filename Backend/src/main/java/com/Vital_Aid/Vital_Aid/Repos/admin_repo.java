package com.Vital_Aid.Vital_Aid.Repos;

import com.Vital_Aid.Vital_Aid.Models.admin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface admin_repo extends JpaRepository<admin, Long> {

}
