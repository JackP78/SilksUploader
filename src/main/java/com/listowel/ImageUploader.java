package com.listowel;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

abstract class ImageUploader {
	protected String accessKey;
	protected String secretKey;
	protected String bucketName;
	
	ImageUploader(String bucketName) {
		this.bucketName = bucketName;
	}
	
	public abstract String uploadFile(File toUpload) throws IOException;

	protected void readConfig(String configFile) {
		Properties props = new Properties();
		InputStream resourceStream = ClassLoader.getSystemResourceAsStream(configFile);
	    try 
	    {
	        props.load(resourceStream);
	    } catch (IOException e) 
	    {
	        e.printStackTrace();
	    }
	    accessKey = props.getProperty("accessKey");
	    secretKey = props.getProperty("secretKey");
	}
}