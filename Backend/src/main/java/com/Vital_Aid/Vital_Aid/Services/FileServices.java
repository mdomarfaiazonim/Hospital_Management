package com.Vital_Aid.Vital_Aid.Services;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public interface FileServices {
    public String uploadFile(String path, MultipartFile file);
}