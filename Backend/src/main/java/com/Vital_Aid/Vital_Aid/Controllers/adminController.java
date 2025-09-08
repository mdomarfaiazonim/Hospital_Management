package com.Vital_Aid.Vital_Aid.Controllers;

import com.Vital_Aid.Vital_Aid.Services.admin_service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.Vital_Aid.Vital_Aid.Models.admin;
import java.util.List;

@RestController
@RequestMapping("/admin")
public class adminController {

    @Autowired
    private admin_service asc;

    @GetMapping("/all")
    public List<admin> getAlladmins() {
        return asc.getList();
    }

    @PostMapping("/add")
    public void addAdmin(@RequestBody admin aa) {
        asc.Save(aa);
    }

    @PutMapping("/update")
    public void updateadmin(@RequestBody admin u) {
        asc.Update(u);
    }
    @DeleteMapping("/delete/{id}")
    public void deleteadmin(@PathVariable String id) {
        asc.delAdmin(id);
    }
}
