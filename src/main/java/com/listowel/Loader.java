package com.listowel;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.xml.bind.JAXBException;
import javax.xml.transform.TransformerException;

import org.apache.batik.transcoder.TranscoderException;

import java.util.Date;
import java.util.List;
import java.util.concurrent.CountDownLatch;

import org.hibernate.Query;
import org.hibernate.Session;

import com.firebase.client.Firebase;
import com.firebase.client.FirebaseError;

import java.text.SimpleDateFormat;

public class Loader {
	// JDBC driver name and database URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/smartform";

	// Database credentials
	static final String USER = "root";
	static final String PASS = "B@llybunion95";
	
	static final SimpleDateFormat currentTime = new SimpleDateFormat("HH:mm:ss.SSS");
	

	public static void main(String[] argv) throws TranscoderException,
			IOException, JAXBException, TransformerException, Exception {
		boolean loadForm = false, loadSilks = true;
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		Query query = session
				.createQuery("from Race where courseName = :name and year(meetingDate) = :year and month(meetingDate) = :month order by meetingDate, scheduledTime");
		query.setParameter("name", "Listowel");
		query.setParameter("year", 2014);
		query.setParameter("month", 9);

		Firebase raceRef = new Firebase("https://listowelraces.firebaseio.com/races");
		Firebase formRef = new Firebase("https://listowelraces.firebaseio.com/form");
				
		final CountDownLatch done = new CountDownLatch(1);
		
		
		List<Race> list = query.list();
		int raceNumber = 0;
		String lastDayId = "", currentDayId;
		Firebase currentDayRef = null, currentRaceRef;
		SimpleDateFormat dt1 = new SimpleDateFormat("ddEEE");
		for (Race race : list) {
			currentDayId = dt1.format(race.getMeetingDate());
			if (!lastDayId.equals(currentDayId)) {
				System.out.println(currentDayId);
				currentDayRef = raceRef.child(currentDayId);
				raceNumber = 1;
				lastDayId = currentDayId;
			}
			System.out.format("Begin race %d day %s %s%n",raceNumber,currentDayRef,currentTime.format(new Date()));
			int runnerNumber = 1;
			for (Runner runner : race.getRunners()) {
				if (loadSilks) {
					AWSImageUploader loader = new AWSImageUploader("listowelracesbucket");
					runner.setSilksUrl(loader.uploadFile(createSilksImage(runnerNumber, runner)));
				}
				
				// first lets create the silk for each runner
				//File pngFile = createSilksImage(raceNumber, runner);
				
				// now lets load the runners form
				if (loadForm) {
					System.out.format("Begin Form runner %d race %d day %s %s%n",runnerNumber++,raceNumber,currentDayRef,currentTime.format(new Date()));
					List<FormEntry> formList = FormEntry.loadRunnerForm(runner);
					Firebase newFormRef = formRef.child(Integer.toString(runner.getRunnerId()));
					newFormRef.setValue(formList, new Firebase.CompletionListener() {
					    @Override
					    public void onComplete(FirebaseError firebaseError, Firebase firebase) {
					        System.out.format("End Form %s%n",currentTime.format(new Date()));
					        done.countDown();
					    }
					});
				}
			}
			currentRaceRef = currentDayRef.child(Integer.toString(raceNumber++));
			currentRaceRef.setValue(race, new Firebase.CompletionListener() {
			    @Override
			    public void onComplete(FirebaseError firebaseError, Firebase firebase) {
			        System.out.format("End Race %s%n",currentTime.format(new Date()));
			        done.countDown();
			    }
			});
		}
		done.await();
		System.out.println("!!!!!All Done!!!!");
	}

	private static File createSilksImage(int raceNumber, Runner runner) throws JAXBException, TransformerException,
			IOException, TranscoderException {
		String directory = System.getProperty("user.home")
				+ "/Documents/SilksBin/";
		
		File theDir = new File(directory);
		// create the directory if it does not exist
		if (!theDir.exists()) {
			theDir.mkdir();
		}
		
		String fileName = String.format("%d_%d_%s", raceNumber,
				runner.getClothNumber(),
				runner.getName().replaceAll("[^A-Za-z]", ""));
		//System.out.format("Creating Silks file %s;", fileName);
		File svgFile = new File(theDir, fileName + ".svg");
		File pngFile = new File(theDir, fileName + ".png");
		String description = runner.getJockeyColours().toLowerCase();
		SilkDescription test = new SilkDescription();
		test.loadFromDescription(description);
		test.saveVectorFile(svgFile, pngFile);
		svgFile.delete();
		System.out.format("Saving Silks file %s;", pngFile.getName());
		return pngFile;
	}
}
