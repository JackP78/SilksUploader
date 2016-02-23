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
import org.parse4j.Parse;
import org.parse4j.ParseException;
import org.parse4j.ParseFile;
import org.parse4j.ParseObject;
import org.parse4j.util.ParseRegistry;
import org.parse4j.ParseBatch;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import org.hibernate.Query;
import org.hibernate.Session;
import org.json.JSONArray;

import java.sql.*;

public class Loader {
	// JDBC driver name and database URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/smartform";

	// Database credentials
	static final String USER = "root";
	static final String PASS = "B@llybunion95";

	public static void main(String[] argv) throws TranscoderException,
			ParseException, IOException, JAXBException, TransformerException {
		ParseRegistry.registerSubclass(Race.class);
		ParseRegistry.registerSubclass(Runner.class);
		ParseRegistry.registerSubclass(FormEntry.class);
		Parse.initialize("1S1kJ3kE6J5XPGFuxIlRlAYDCqpYVMZPrjAkRDhI",
				"Hh4kPlzVeoOOhf0mGmkJstTfi6Wedidj76DOdnN1");

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

		String directory = System.getProperty("user.home")
				+ "/Documents/SilksBin/";
		List<Race> list = query.list();
		int raceNumber = 1; // Race race = list.get(5);
		for (Race race : list) {
			// save the race
			//race.put("racenumber", raceNumber);
			race.save();
			System.out.println("Begin Race");
			System.out.format("Createing runner I=%d objectId=%s %n",
					raceNumber, race.getObjectId());
			for (Runner runner : race.getRunners()) {
				// save the runner
				runner.save();

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
				ParseFile file = new ParseFile(pngFile.getName(), data);
				file.save();

				// runner.setForm(FormEntry.loadRunnerForm(runner.getRunnerId()));

				// create associations
				System.out.format("I=%d objectId=%s %n", raceNumber,
						race.getObjectId());
				runner.put("race", race);
				runner.put("silks", file);
				runner.save();

				// now lets load the runners form
				List<FormEntry> formList = FormEntry.loadRunnerForm(runner);
				System.out.format("Saving %d form entries %n",formList.size());
				ParseBatch formBatcher = new ParseBatch();
				JSONArray formBatchResponse = null;
				int numBatchCommands = 0;
				for (FormEntry form : formList) {
					form.put("runner", runner);
					formBatcher.createObject(form);
					if (numBatchCommands++ > 45) {
						System.out.format("Flusing %d bath commands %n",numBatchCommands);
						numBatchCommands = 0;
						formBatchResponse = formBatcher.batch();
						formBatcher = new ParseBatch();
					}
				}
				formBatchResponse = formBatcher.batch();
			}
			System.out.println("End Race");
			raceNumber++;
			/*if (raceNumber > 1) {
				break;
			}*/
		}
		System.out.println("!!!!!Done!!!!");
	}
}
