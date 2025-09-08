package com.Vital_Aid.Vital_Aid.Controllers;

import com.Vital_Aid.Vital_Aid.Services.medical_store_service;

import jakarta.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.Vital_Aid.Vital_Aid.DTOs.Medical_store_DTO;
import com.Vital_Aid.Vital_Aid.Models.medical_store;

import java.util.List;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("medical_store")
public class medical_storeController {

    @Autowired
    private medical_store_service ms;

    @GetMapping("/all")
    public List<medical_store> getList() {
        return ms.getList();
    }

    @PostMapping("/add")
    public medical_store addmedical_store(@Valid @RequestBody Medical_store_DTO msD) {
        return ms.saveMedStore(msD);
    }

    @PutMapping("/update/{product_id}")
    public medical_store updatemedical_store(@PathVariable Long product_id,@Valid @RequestBody Medical_store_DTO u) {
        return ms.updateMedStore(product_id,u);
    }

    @DeleteMapping("/delete/{product_id}")
    public void deletemedical_store(@PathVariable Long product_id) {
        ms.deleteMedStore(product_id);
    }
}
