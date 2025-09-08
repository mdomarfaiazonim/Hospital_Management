package com.Vital_Aid.Vital_Aid.Repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.Vital_Aid.Vital_Aid.Models.user;
import java.util.List;

@Repository
public interface UserREpository extends JpaRepository<user, Long> {

        @Query("SELECT h FROM user h WHERE " +
                        "(:user_email IS NULL OR :user_email='' OR h.user_email = :user_email) AND " +
                        "(:user_contact IS NULL OR :user_contact='' OR h.user_contact = :user_contact)")
        public List<user> GetFilteredUsers(@Param("user_email") String user_email,
                        @Param("user_contact") String user_contact);
}
