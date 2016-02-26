package com.listowel;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

public class CloudinaryUploader extends ImageUploader {

	CloudinaryUploader(String bucketName) {
		super(bucketName);
		readConfig("Cloudinary.properties");
	}

	@Override
	public String uploadFile(File toUpload) throws IOException {
		Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
				  "cloud_name", bucketName,
				  "api_key", accessKey,
				  "api_secret", secretKey));
		
		Map uploadResult = cloudinary.uploader().upload(toUpload, null);
		return (String) uploadResult.get("url");		
	}

}
