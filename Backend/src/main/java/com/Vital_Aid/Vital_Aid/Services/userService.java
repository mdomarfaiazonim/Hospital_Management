package com.Vital_Aid.Vital_Aid.Services;

import com.Vital_Aid.Vital_Aid.Models.user;
import com.Vital_Aid.Vital_Aid.Repos.UserREpository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class userService {

    @Autowired
    private UserREpository userREpository;

    public userService() {
    }

    public List<user> getList() {
        return userREpository.findAll();
    }

    public void saveUser(user usr) {

        userREpository.save(usr);
    }

    public user getUserByEmail(String email) {
        List<user> users = getList();

        for (user u : users) {
            if (u.getUser_email().equals(email)) {
                return u;
            }
        }
        return new user();
    }

    public void updateUser(user u) {
        List<user> users = getList();

        for (user it : users) {
            if (it.getUser_email().equals(u.getUser_email())) {
                userREpository.deleteById((it.getUser_id()));
                userREpository.save(u);
                return;
            }
        }
    }

    public void deleteUser(Long id) {
        userREpository.deleteById((id));
    }

    public List<user> getFilteredUsers(String user_email, String user_contact) {
        return userREpository.GetFilteredUsers(user_email, user_contact);
    }

    public user getUser(String user_email) {
        return userREpository.GetFilteredUsers(user_email, null).get(0);
    }
}
