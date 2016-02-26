package com.listowel;

import static javax.persistence.GenerationType.IDENTITY;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "daily_runners", catalog = "smartform")
public class Runner implements Serializable {

	private Race race;
	private String trainerName;
	private Integer clothNumber;

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "runner_id", unique = true, nullable = false)
	public int getRunnerId() {
		return runnerId;
	}

	public void setRunnerId(int runnerId) {
		this.runnerId = runnerId;
	}

	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "race_id", nullable = false)
	public Race getRace() {
		return this.race;
		// return null;
	}

	public void setRace(Race race) {
		this.race = race;
		// this.put("race", race);
	}

	@Column(name = "name", nullable = false, length = 255)
	public String getName() {
		return name;
		//return this.getString("name");
	}

	public void setName(String name) {
		this.name = name;
		//this.put("name", name);
	}

	@Column(name = "owner_name", nullable = true, length = 80)
	public String getOwnerName() {
		return ownerName;
		//return this.getString("ownername");
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
		//this.put("ownername", ownerName);
	}

	@Column(name = "jockey_name", nullable = true, length = 80)
	public String getJockeyName() {
		return jockeyName;
		//return this.getString("jockeyname");
	}

	public void setJockeyName(String jockeyName) {
		this.jockeyName = jockeyName;
		//this.put("jockeyname", jockeyName);
	}
	
	@Column(name = "trainer_name", nullable = true, length = 80)
	public String getTrainerName() {
		return trainerName;
		//return this.getString("trainerName");
	}

	public void setTrainerName(String trainerName) {
		this.trainerName = trainerName;
		//this.put("trainerName", trainerName);
	}

	@Column(name = "jockey_colours", nullable = true, length = 255)
	public String getJockeyColours() {
		return jockeyColours;
	}

	public void setJockeyColours(String jockeyColours) {
		this.jockeyColours = jockeyColours;
	}

	@Column(name = "age", nullable = true, length = 2)
	public int getAge() {
		return age;
		//return this.getInt("age");
	}

	public void setAge(int age) {
		this.age = age;
		//this.put("age", age);
	}

	@Column(name = "form_figures", nullable = true, length = 80)
	public String getFormFigures() {
		return formFigures;
		//return this.getString("formfigures");
	}

	public void setFormFigures(String formFigures) {
		this.formFigures = formFigures;
		/*if (formFigures != null) {
			this.put("formfigures", formFigures);
		}*/
	}

	@Column(name = "dam_name", nullable = true, length = 80)
	public String getDamName() {
		return damName;
		//return this.getString("damname");
	}

	public void setDamName(String damName) {
		this.damName = damName;
		//this.put("damname", damName);
	}

	@Column(name = "sire_name", nullable = true, length = 80)
	public String getSireName() {
		return sireName;
		//return this.getString("sirename");
	}

	public void setSireName(String sireName) {
		this.sireName = sireName;
		//this.put("sirename", sireName);
	}

	@Column(name = "forecast_price", nullable = true, length = 10)
	public String getForecastPrice() {
		return forecastPrice;
		//return this.getString("forecastprice");
	}

	public void setForecastPrice(String forecastPrice) {
		this.forecastPrice = forecastPrice;
		/*if (forecastPrice != null) {
			// this.forecastPrice = forecastPrice;
			this.put("forecastprice", forecastPrice);
		}*/
	}

	@Column(name = "forecast_price_decimal", nullable = true)
	public Double getForecastPriceDecimal() {
		return forecastPriceDecimal;
		// return this.getDouble("forecastpricedecimal");
	}

	public void setForecastPriceDecimal(Double forecastPriceDecimal) {
		this.forecastPriceDecimal = forecastPriceDecimal;
		/*if (forecastPriceDecimal != null) {
			// this.forecastPriceDecimal = forecastPriceDecimal;
			this.put("forecastpricedecimal", forecastPriceDecimal);
		}*/
	}

	@Column(name = "bred", nullable = true, length = 3)
	public String getCountryBred() {
		return countryBred;
		//return this.getString("countrybred");
	}

	public void setCountryBred(String countryBred) {
		this.countryBred = countryBred;
		//this.put("countrybred", countryBred);
	}

	@Column(name = "official_rating", nullable = true, length = 11)
	public Integer getOfficialRating() {
		return officialRating;
		//return new Integer(this.getInt("officialrating"));
	}

	public void setOfficialRating(Integer officialRating) {
		this.officialRating = officialRating;
		/*if (officialRating != null) {
			this.put("officialrating", officialRating.intValue());
		}*/
	}
	
	@Column(name = "cloth_number", nullable = true, length = 11)
	public Integer getClothNumber() {
		return clothNumber;
		//return new Integer(this.getInt("clothnumber"));
	}

	public void setClothNumber(Integer clothNumber) {
		this.clothNumber = clothNumber;
		/*if (stallNumber != null) {
			this.put("clothnumber", stallNumber.intValue());
		}*/
	}

	@Transient
	public String getSilksUrl() {
		return silksUrl;
	}

	public void setSilksUrl(String silksUrl) {
		this.silksUrl = silksUrl;
	}
	
	@Transient
	public int getNumberTips() {
		return numberTips;
	}

	public void setNumberTips(int numberTips) {
		this.numberTips = numberTips;
	}

	private int numberTips;
	private int runnerId;
	private String jockeyColours;
	private String name;
	private String ownerName;
	private String jockeyName;
	private int age;
	private String formFigures;
	private String damName;
	private String sireName;
	private String forecastPrice;
	private Double forecastPriceDecimal;
	private String countryBred;
	private Integer officialRating;
	private String silksUrl;

}
