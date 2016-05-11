package com.listowel;

import java.io.Serializable;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

public class FormEntry implements Serializable {
	private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	// JDBC driver name and database URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/smartform";

	// Database credentials
	static final String USER = "root";
	static final String PASS = "B@llybunion95";

	private Date meetingDate;
	private String course;
	private String going;
	// private String raceId;
	private int runnerId;
	private int finishPosition;
	private String winner;
	private String startingPrice;
	private double startingPriceDecimal;
	private int distanceBeaten;
	private int distanceWon;
	private int distanceBehindWinner;
	private int numRunners;
	private int distanceYards;
	private String inRaceComment;


	public FormEntry() {
		// cannot be loaded directory
	}

	public static List<FormEntry> loadRunnerForm(Runner runner) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ArrayList<FormEntry> resultArray = new ArrayList<FormEntry>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			
			// STEP 4: Execute a query
			String sql;
			sql = "select runner.runner_id, meeting_date, course, going, runner.name, runner.finish_position, "
					+ "winner.name as winner, runner.starting_price, runner.starting_price_decimal, "
					+ "runner.distance_beaten, runner.distance_won, runner.distance_behind_winner, num_runners, "
					+ "distance_yards, runner.in_race_comment "
					+ "from smartform.historic_races race "
					+ "inner join smartform.historic_runners runner on runner.race_id=race.race_id "
					+ "inner join smartform.historic_runners winner on winner.race_id=runner.race_id "
					+ "where runner.runner_id=? "
					+ "and race.meeting_date<? "
					+ "and winner.finish_position=1 "
					+ "order by meeting_date desc"
					+ "limit 15";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, runner.getRunnerId());
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String dateString = format.format(runner.getRace().getMeetingDate());
			stmt.setDate(2, java.sql.Date.valueOf(dateString));
			ResultSet rs = stmt.executeQuery();

			// STEP 5: Extract data from result set
			while (rs.next()) {
				// Retrieve by column name
				FormEntry entry = new FormEntry();
				entry.setRunnerId(rs.getInt("runner_id"));
				entry.setMeetingDate(rs.getDate("meeting_date"));
				entry.setCourse(rs.getString("course"));
				entry.setGoing(rs.getString("going"));
				entry.setDistanceBeaten(rs.getInt("distance_beaten"));
				entry.setDistanceWon(rs.getInt("distance_won"));
				entry.setDistanceBehindWinner(rs
						.getInt("distance_behind_winner"));
				entry.setDistanceBehindWinner(rs.getInt("num_runners"));
				entry.setMeetingDate(rs.getDate("meeting_date"));
				entry.setCourse(rs.getString("course"));
				entry.setGoing(rs.getString("going"));
				entry.runnerId = rs.getInt("runner_id");
				entry.setFinishPosition(rs.getInt("finish_position"));
				entry.setWinner(rs.getString("winner"));
				entry.setStartingPrice(rs.getString("starting_price"));
				entry.setStartingPriceDecimal(rs
						.getDouble("starting_price_decimal"));
				entry.setDistanceBeaten(rs.getInt("distance_beaten"));
				entry.setDistanceWon(rs.getInt("distance_won"));
				entry.setDistanceBehindWinner(rs
						.getInt("distance_behind_winner"));
				entry.setNumRunners(rs.getInt("num_runners"));
				entry.setDistanceYards(rs.getInt("distance_yards"));
				entry.setInRaceComment(rs.getString("in_race_comment"));

				// Display values
				resultArray.add(entry);
			}
			// STEP 6: Clean-up environment
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException se) {
			// Handle errors for JDBC
			se.printStackTrace();
		} catch (Exception e) {
			// Handle errors for Class.forName
			e.printStackTrace();
		} finally {
			// finally block used to close resources
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			}// nothing we can do
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}// end finally try
		}// end try
		return resultArray;
	}// end main

	@JsonIgnore
	@Column(name = "meeting_date")
	public Date getMeetingDate() {
		return meetingDate;
	}
	
	public void setMeetingDate(Date meetingDate) {
		this.meetingDate = meetingDate;
		//this.put("meetingdate", meetingDate);
	}
	
	@JsonProperty("meetingDate")
	@Transient
	public String getMeetingDateString() {
		return (meetingDate != null)? dateFormat.format(meetingDate): null;
	}

	

	@Column(name = "course")
	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
		//this.put("course", course);
	}

	@Column(name = "going")
	public String getGoing() {
		return going;
	}

	public void setGoing(String going) {
		this.going = going;
		/*if (going != null) {
			this.put("going", going);
		}*/
	}

	@Column(name = "runner_id", unique = true, nullable = false)
	public int getRunnerId() {
		return runnerId;
	}

	public void setRunnerId(int runnerId) {
		this.runnerId = runnerId;
	}

	@Column(name = "finish_position", nullable = false)
	public int getFinishPosition() {
		return finishPosition;
	}

	public void setFinishPosition(int finishPosition) {
		this.finishPosition = finishPosition;
		//this.put("finishposition", finishPosition);
	}

	@Column(name = "winner")
	public String getWinner() {
		return winner;
	}

	public void setWinner(String winner) {
		this.winner = winner;
		//this.put("winner", winner);
	}

	@Column(name = "starting_price", nullable = false)
	public String getStartingPrice() {
		return startingPrice;
	}

	public void setStartingPrice(String startingPrice) {
		this.startingPrice = startingPrice;
		//this.put("startingprice", startingPrice);
	}

	@Column(name = "starting_price_decimal", nullable = false)
	public double getStartingPriceDecimal() {
		return startingPriceDecimal;
	}

	public void setStartingPriceDecimal(double startingPriceDecimal) {
		this.startingPriceDecimal = startingPriceDecimal;
		//this.put("startingpricedecimal", startingPriceDecimal);
	}

	@Column(name = "distance_beaten", nullable = false)
	public int getDistanceBeaten() {
		return distanceBeaten;
	}

	public void setDistanceBeaten(int distanceBeaten) {
		this.distanceBeaten = distanceBeaten;
		//this.put("distancebeaten", distanceBeaten);
	}

	@Column(name = "distance_won", nullable = false)
	public int getDistanceWon() {
		return distanceWon;
	}

	public void setDistanceWon(int distanceWon) {
		this.distanceWon = distanceWon;
		//this.put("distancewon", distanceWon);
	}

	@Column(name = "distance_behind_winner")
	public int getDistanceBehindWinner() {
		return distanceBehindWinner;
	}

	public void setDistanceBehindWinner(int distanceBehindWinner) {
		this.distanceBehindWinner = distanceBehindWinner;
		//this.put("distancebehindwinner", distanceBehindWinner);
	}

	@Column(name = "num_runners")
	public int getNumRunners() {
		return numRunners;
	}

	public void setNumRunners(int numRunners) {
		this.numRunners = numRunners;
		//this.put("numrunners", numRunners);
	}

	@Column(name = "distance_yards")
	public int getDistanceYards() {
		return distanceYards;
	}

	public void setDistanceYards(int distanceYards) {
		this.distanceYards = distanceYards;
		//this.put("distanceyards", distanceYards);
	}

	@Column(name = "in_race_comment")
	public String getInRaceComment() {
		return inRaceComment;
	}

	public void setInRaceComment(String inRaceComment) {
		this.inRaceComment = inRaceComment;
		/*if (inRaceComment != null) {
			this.put("inracecomment", inRaceComment);
		}*/
	}
}
