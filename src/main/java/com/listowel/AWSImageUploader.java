/**
 * 
 */
package com.listowel;

/**
 * @author jackmcauliffe
 *
 */
import java.io.File;
import java.io.IOException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.PutObjectResult;



public class AWSImageUploader extends ImageUploader {
	
	AWSImageUploader(String bucket) {
		super(bucket);
		readConfig("AwsCredentials.properties");
	}
		
	@Override
	public String uploadFile(File toUpload) throws IOException {
		String keyName = toUpload.getName();
		AWSCredentials creds = new BasicAWSCredentials(accessKey, secretKey);
		AmazonS3Client s3Client = new AmazonS3Client(creds);
		s3Client.setRegion(Region.getRegion(Regions.EU_WEST_1)); 	
		PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, keyName, toUpload).withCannedAcl(CannedAccessControlList.PublicRead);
		PutObjectResult result = s3Client.putObject(putObjectRequest);
		return s3Client.getResourceUrl(bucketName, keyName);
	}
}
