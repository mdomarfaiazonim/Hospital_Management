package com.Vital_Aid.Vital_Aid.Controllers;

import com.Vital_Aid.Vital_Aid.DTOs.UserDTO;
import com.Vital_Aid.Vital_Aid.Models.user;
import com.Vital_Aid.Vital_Aid.Services.userService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/user")
public class UserController {

    @Autowired
    private userService us;

    @GetMapping("/all")
    public List<user> getAllUsers() {
        return us.getList();
    }

    @PostMapping("/add")
    public void addUser(@Valid @RequestBody UserDTO U) {
        user u = new user();
        u.setUser_id(U.getUser_id());
        u.setUser_email(U.getUser_email());
        u.setUser_password(U.getUser_password());
        u.setUser_contact(U.getUser_contact());
        u.setUser_name(U.getUser_name());
        us.saveUser(u);
    }

    @PutMapping("/update")
    public void updateUser(@Valid @RequestBody UserDTO U) {
        user u = new user();
        u.setUser_contact(U.getUser_contact());
        u.setUser_email(U.getUser_email());
        u.setUser_id(U.getUser_id());
        u.setUser_name(U.getUser_name());
        u.setUser_password(U.getUser_password());
        us.updateUser(u);
    }

    @DeleteMapping("/delete/{id}")
    public void deleteUser(@PathVariable("id") Long id) {
        us.deleteUser(id);
    }

    @GetMapping("/get/{user_email}")
    public user getUser(@PathVariable("user_email") String user_email) {
        return us.getUser(user_email);
    }

    @GetMapping("/filter")
    public List<user> GetUsersbyfilter(
            @RequestParam(required = false) String user_email,
            @RequestParam(required = false) String user_contact) {
        return us.getFilteredUsers(user_email, user_contact);
    }

}
