package com.listowel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.batik.transcoder.Transcoder;
import org.apache.batik.transcoder.TranscoderException;
import org.apache.batik.transcoder.TranscoderInput;
import org.apache.batik.transcoder.TranscoderOutput;
import org.apache.batik.transcoder.image.PNGTranscoder;
/*import org.parse4j.Parse;
import org.parse4j.ParseException;
import org.parse4j.ParseFile;
import org.parse4j.ParseObject;
import org.parse4j.util.ParseRegistry;*/














import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.concurrent.CountDownLatch;

import org.hibernate.Query;
import org.hibernate.Session;
import org.json.JSONArray;

import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.firebase.client.Firebase;
import com.firebase.client.FirebaseError;

import java.sql.*;

public class Loader {
	// JDBC driver name and database URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/smartform";

	// Database credentials
	static final String USER = "root";
	static final String PASS = "B@llybunion95";

	public static void main(String[] argv) throws TranscoderException,
			IOException, JAXBException, TransformerException, Exception {
		/*ParseRegistry.registerSubclass(Race.class);
		ParseRegistry.registerSubclass(Runner.class);
		ParseRegistry.registerSubclass(FormEntry.class);
		Parse.initialize("1S1kJ3kE6J5XPGFuxIlRlAYDCqpYVMZPrjAkRDhI",
				"Hh4kPlzVeoOOhf0mGmkJstTfi6Wedidj76DOdnN1");*/

		/*
		 * List<FormEntry> form = FormEntry.loadRunnerForm(2069361); for
		 * (FormEntry entry : form) { System.out.format("%s %n",
		 * entry.getMeetingDate().toLocaleString()); }
		 */

		Session session = HibernateUtil.getSessionFactory().openSession();
		Query query = session
				.createQuery("from Race where courseName = :name and day(meetingDate) = :date and year(meetingDate) = :year and month(meetingDate) = :month order by scheduledTime");
		query.setParameter("name", "Listowel");
		query.setParameter("year", 2014);
		query.setParameter("month", 9);
		query.setParameter("date", 17);

		Firebase raceRef = new Firebase("https://listowelraces.firebaseio.com/races");
		Firebase formRef = new Firebase("https://listowelraces.firebaseio.com/form");
		AmazonS3Client s3client = new AmazonS3Client(new ProfileCredentialsProvider()); 
		
		Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
				  "cloud_name", "listowelraces",
				  "api_key", "275766598556953",
				  "api_secret", "IPDyfPYSrVxTMcZt18CsJavXPP8"));
		
		
		final CountDownLatch done = new CountDownLatch(1);
		
		String directory = System.getProperty("user.home")
				+ "/Documents/SilksBin/";
		List<Race> list = query.list();
		int raceNumber = 1; // Race race = list.get(5);
		for (Race race : list) {
			System.out.println("Begin Race");
			for (Runner runner : race.getRunners()) {
				// first lets create the silk for each runner
				String fileName = String.format("%d_%d_%s", raceNumber,
						runner.getClothNumber(),
						runner.getName().replaceAll("[^A-Za-z]", ""));
				System.out.format("Creating Silks file %s;", fileName);
				File svgFile = new File(directory + fileName + ".svg");
				File pngFile = new File(directory + fileName + ".png");
				String description = runner.getJockeyColours().toLowerCase();
				SilkDescription test = new SilkDescription();
				test.loadFromDescription(description);
				test.saveVectorFile(svgFile, pngFile);
				svgFile.delete();

				byte[] data = org.apache.commons.io.FileUtils
						.readFileToByteArray(pngFile);
				System.out.format("Saving Silks file %s;", pngFile.getName());
				
				Map uploadResult = cloudinary.uploader().upload(pngFile, null);
				runner.setSilksUrl((String) uploadResult.get("url"));
				//s3client.putObject(new PutObjectRequest("listowelracesbucket", pngFile.getName(), pngFile).withCannedAcl(CannedAccessControlList.PublicRead));
				//s3client.getResourceUrl("listowelracesbucket", "some-path/some-key.jpg");

				// runner.setForm(FormEntry.loadRunnerForm(runner.getRunnerId()));
				
				Firebase newRaceRef = raceRef.push();
				newRaceRef.setValue(race, new Firebase.CompletionListener() {
				    @Override
				    public void onComplete(FirebaseError firebaseError, Firebase firebase) {
				        System.out.println("done");
				        done.countDown();
				    }
				});
				String raceId = newRaceRef.getKey();
				System.out.format("Creating raceId=%s %n",raceId);

				// now lets load the runners form
				List<FormEntry> formList = FormEntry.loadRunnerForm(runner);
				Firebase newFormRef = formRef.child(Integer.toString(runner.getRunnerId()));
				newFormRef.setValue(formList, new Firebase.CompletionListener() {
				    @Override
				    public void onComplete(FirebaseError firebaseError, Firebase firebase) {
				        System.out.println("done");
				        done.countDown();
				    }
				});
			}
			System.out.println("End Race");
		}
		done.await();
		System.out.println("!!!!!New Done!!!!");
	}
}
