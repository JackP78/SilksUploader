package com.listowel;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "daily_races", catalog = "smartform")
public class Race implements Serializable  {
	int raceId;
	private Date meetingDate;
	private String raceTitle;
	private int distanceYards;
	private Double prizeMoney;
	private String courseName;
	private Set<Runner> runners;
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "race_id", unique = true, nullable = false)
	public int getRaceId() {
		return raceId;
	}
	public void setRaceId(int raceId) {
		this.raceId = raceId;
	}
	
	@Column(name = "meeting_date", nullable = false)
	public Date getMeetingDate() {
		return meetingDate;
		//return this.getDate("meetingdate");
	}
	public void setMeetingDate(Date meetingDate) {
		this.meetingDate = meetingDate;
		//this.put("meetingdate",meetingDate);
	}
	
	@Column(name = "scheduled_time", nullable = false)
	public Date getScheduledTime() {
		return meetingDate;
		//return this.getDate("scheduledtime");
	}
	public void setScheduledTime(Date scheduledTime) {
		this.meetingDate = meetingDate;
		//this.put("scheduledtime",scheduledTime);
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
