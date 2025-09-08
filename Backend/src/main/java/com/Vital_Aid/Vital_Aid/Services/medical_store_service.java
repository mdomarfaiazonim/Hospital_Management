package com.Vital_Aid.Vital_Aid.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.Vital_Aid.Vital_Aid.Repos.medical_store_repo;
import com.Vital_Aid.Vital_Aid.DTOs.Medical_store_DTO;
import com.Vital_Aid.Vital_Aid.Models.medical_store;

import java.util.List;
import java.util.Optional;

@Service
public class medical_store_service {
    @Autowired
    private medical_store_repo msr;

    public medical_store_service() {

    }

    public List<medical_store> getList() {
        if (msr.findAll().isEmpty()) {
            throw new IllegalArgumentException("No Medical Store found");
        }
        return msr.findAll();
    }

    public Optional<medical_store> getMedicalStore(Long id) {
        if (!msr.existsById(id)) {
            throw new IllegalArgumentException("Medical Store not found with id: " + id);
        }
        return msr.findById(id);
    }

    public medical_store saveMedStore(Medical_store_DTO mStr) {
        medical_store mds = mapToEntity(mStr);
        if (msr.existsById(mds.getProduct_id())) {
            throw new IllegalArgumentException("Medical Store already exists with id: " + mds.getProduct_id());
        }
        return msr.save(mds);
    }

    public medical_store updateMedStore(Long product_id, Medical_store_DTO updatedMedStore) {
        medical_store mds = msr.findById(product_id)
                .orElseThrow(() -> new IllegalArgumentException(
                        "Medical Store not found with id: " + product_id));

        mds.setProduct_category(updatedMedStore.getProduct_category());
        mds.setProduct_id(updatedMedStore.getProduct_id());
        mds.setProduct_price(updatedMedStore.getProduct_price());
        mds.setProduct_quantity(updatedMedStore.getProduct_quantity());

        return msr.save(mds);
    }

    public void deleteMedStore(Long id) {
        if (!msr.existsById(id)) {
            throw new IllegalArgumentException("Medical Store not found with id: " + id);
        }
        msr.deleteById(id);
    }

    private medical_store mapToEntity(Medical_store_DTO mStr) {
        medical_store mds = new medical_store();
        mds.setProduct_category(mStr.getProduct_category());
        mds.setProduct_id(mStr.getProduct_id());
        mds.setProduct_price(mStr.getProduct_price());
        mds.setProduct_quantity(mStr.getProduct_quantity());
        return mds;
    }
}
