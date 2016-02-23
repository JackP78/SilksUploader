package com.listowel;

import javax.xml.bind.annotation.XmlElement;

public class SilksDescriptionElement {
	private String colour;
	private String pattern = "plain";
	private String patternColour;
	
	@Override
	public String toString() {
		String description;
		if (pattern == null || pattern.equals("plain")) {
			description = String.format("%s plain",colour);
		}
		else {
			description = String.format("%s with %s %s",colour, patternColour, pattern);
		}
		return description;
	}
	
	@XmlElement(name = "colour")
	public String getColour() {
		return colour;
	}
	public void setColour(String colour) {
		this.colour = colour;
	}
	
	@XmlElement(name = "pattern")
	public String getPattern() {
		return pattern;
	}
	public void setPattern(String pattern) {
		this.pattern = pattern;
	}
	
	@XmlElement(name = "patterncolour")
	public String getPatternColour() {
		return patternColour;
	}
	public void setPatternColour(String patternColour) {
		this.patternColour = patternColour;
	}
	
	public void copyFrom(SilksDescriptionElement master) {
		if (this.colour == null) {
			this.colour = master.colour;
		}
		if (!this.pattern.equals("plain") && this.patternColour == null) {
			this.patternColour = master.patternColour;
		}
	}
}
