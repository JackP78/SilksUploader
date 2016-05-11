package com.listowel;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "daily_races", catalog = "smartform")
public class Race implements Serializable  {
	private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	private static final SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
	
	int raceId;
	private Date meetingDate;
	private String raceTitle;
	private int distanceYards;
	private Double prizeMoney;
	private String courseName;
	private Set<Runner> runners;
	private Date scheduledDate;
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "race_id", unique = true, nullable = false)
	public int getRaceId() {
		return raceId;
	}
	public void setRaceId(int raceId) {
		this.raceId = raceId;
	}
	
	@JsonIgnore
	@Column(name = "meeting_date", nullable = false)
	public Date getMeetingDate() {
		return meetingDate;
		//return this.getDate("meetingdate");
	}
	
	public void setMeetingDate(Date meetingDate) {
		this.meetingDate = meetingDate;
		//this.put("meetingdate",meetingDate);
	}
	
	@JsonProperty("meetingDate")
	@Transient
	public String getMeetingDateString() {
		return (meetingDate != null)? dateFormat.format(meetingDate): null;
		//return this.getDate("meetingdate");
	}
	
	@JsonIgnore
	@Column(name = "scheduled_time", nullable = false)
	public Date getScheduledTime() {
		return scheduledDate;
		//return this.getDate("scheduledtime");
	}
	
	public void setScheduledTime(Date scheduledTime) {
		this.scheduledDate = scheduledTime;
		//this.put("scheduledtime",scheduledTime);
	}
	
	@JsonProperty("scheduledTime")
	@Transient
	public String getScheduledTimeString() {
		return (scheduledDate != null)? timeFormat.format(scheduledDate): null;
	}

	
	@Column(name = "race_title", nullable = false, length=255)
	public String getRaceTitle() {
		return raceTitle;
		//return this.getString("racetitle");
	}
	public void setRaceTitle(String raceTitle) {
		this.raceTitle = raceTitle;
		//this.put ("racetitle",raceTitle);
	}
	
	@Column(name = "distance_yards", nullable = true, length=11)
	public int getDistanceYards() {
		return distanceYards;
		//return this.getInt("distanceyards");
	}
	public void setDistanceYards(int distanceYards) {
		this.distanceYards = distanceYards;
		//put ("distanceyards",distanceYards);
	}
	
	@Column(name = "prize_pos_1", nullable = true, length=11)
	public Double getPrizeMoney() {
		return prizeMoney;
		//return this.getDouble("prizemoney");
	}
	public void setPrizeMoney(Double prizeMoney) {
		this.prizeMoney = prizeMoney;
		/*if (prizeMoney != null) {
			this.put("prizemoney", prizeMoney.doubleValue());
		}*/
	}
	@Column(name = "course", nullable = false, length=255)
	public String getCourseName() {
		return courseName;
		//return this.getString("coursename");
	}
	
	public void setCourseName(String courseName) {
		this.courseName = courseName;
		//this.put("coursename",courseName);
	}
	
	public void setRunners(Set<Runner> runners) {
		this.runners = runners;
	}
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "race")
	public Set<Runner> getRunners() {
		return this.runners;
	}
}
