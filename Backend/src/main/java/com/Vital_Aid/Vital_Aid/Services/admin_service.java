package com.Vital_Aid.Vital_Aid.Services;

import com.Vital_Aid.Vital_Aid.Models.admin;
import com.Vital_Aid.Vital_Aid.Repos.admin_repo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class admin_service {

    @Autowired
    private admin_repo ar;

    public admin_service(){
    }
    public List<admin> getList(){
        return ar.findAll();
    }

    public void Save(admin ad){
        ar.save(ad);
    }
    public void Update(admin ad){
        List<admin> list = getList();

        for(admin a:list){
            if(a.getAdmin_id().equals(ad.getAdmin_id())){
                ar.delete(a);
                ar.save(ad);
                return;
            }
        }
    }
    public admin getAdmin(String id){
        List<admin> list= getList();

        for(admin a: list){
            if(a.getAdmin_id().equals(id))return a;
        }
        return new admin();
    }
    public void delAdmin(String id){
        List<admin> list= getList();

        for(admin a : list){
            if(a.getAdmin_id().equals(id)){
                ar.delete(a);
            }
        }
    }
}
