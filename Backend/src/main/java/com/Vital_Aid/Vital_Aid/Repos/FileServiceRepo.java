package com.Vital_Aid.Vital_Aid.Repos;

import com.Vital_Aid.Vital_Aid.Services.FileServices;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileServiceRepo implements FileServices {
    
    @Override
    public String uploadFile(String path, MultipartFile file) {
        
        String name = file.getOriginalFilename();
        String filePath = path + File.separator + name;
        File dest = new File(path);
        if (!dest.exists()) {
            dest.mkdir();
        }
        try{
            
        Files.copy(file.getInputStream(), Paths.get(filePath));
        
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return name;
    }
}
