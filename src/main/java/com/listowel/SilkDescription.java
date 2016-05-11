package com.listowel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.batik.transcoder.TranscoderException;
import org.apache.batik.transcoder.TranscoderInput;
import org.apache.batik.transcoder.TranscoderOutput;
import org.apache.batik.transcoder.image.PNGTranscoder;

import java.util.logging.*;

@XmlRootElement(name = "silks")
public class SilkDescription {
	public enum colour {
		beige, 
		black, 
		brown, 
		dark_blue, 
		dark_green, 
		emerald_green,
		green,
		grey, 
		light_blue, 
		light_green, 
		maroon, 
		mauve, 
		orange,
		amber, // alias for orange
		pink,
		cyclamen, // alias for pink
		purple, 
		red, 
		royal_blue, 
		white, 
		yellow,
		gold, // alias for yellow
	};

	public enum bodypattern {
		plain, 
		seams, 
		epaulets,
		epaulettes,
		stripe,
		panel, //alias for strip
		stripes,
		striped,
		braces,
		hooped,
		hoops, 
		hoop, 
		quartered, 
		cross_belts,
		cross_sashes,
		chevrons, 
		chevron,
		check,
		diamonds, 
		triple_diamond, 
		diamond, 
		large_spots, 
		spots, 
		stars, 
		star, 
		cross_of_lorraine, 
		disc, 
		inverted_triangle, 
		diabolo, 
		hollow_box, 
		sash, 
		halve,
		halved
	};

	public enum sleevepattern {
		plain, 
		armlet, 
		hooped,
		hoops, // alias for hooped
		striped, 
		chevrons, 
		seams, 
		stars, 
		spots, 
		halves,
		halved,
		diabolo, 
		diamonds, 
		check, 
		mismatched
	};

	public enum cappattern {
		plain, 
		hooped, 
		striped, 
		check, 
		spots, 
		quartered, 
		stars, 
		star, 
		diamonds, 
		diamond
	}

	private SilksDescriptionElement body;
	private SilksDescriptionElement sleeve;
	private SilksDescriptionElement cap;
	private static List<String> keywords;
	final static Logger logger = Logger.getLogger(SilkDescription.class.getName());

	static {
		keywords = new ArrayList();
		for (SilkDescription.colour colour : SilkDescription.colour.values()) {
			keywords.add(colour.toString());
		}
		for (SilkDescription.bodypattern body : SilkDescription.bodypattern
				.values()) {
			keywords.add(body.toString());
		}
		for (SilkDescription.sleevepattern sleeve : SilkDescription.sleevepattern
				.values()) {
			keywords.add(sleeve.toString());
		}
		for (SilkDescription.cappattern cap : SilkDescription.cappattern
				.values()) {
			keywords.add(cap.toString());
		}
		keywords.add("cap");
		keywords.add("sleeves");
	}

	private boolean isColour(String toTest) {
		try {
			if (SilkDescription.colour.valueOf(toTest) != null) {
				return true;
			}
			return false;
		} catch (IllegalArgumentException e) {
			return false;
		}
	}
	
	private boolean isBodyPattern(String toTest) {
		try {
			if (SilkDescription.bodypattern.valueOf(toTest) != null) {
				return true;
			}
			return false;
		} catch (IllegalArgumentException e) {
			return false;
		}
	}
	
	private boolean isSleevePattern(String toTest) {
		try {
			if (SilkDescription.sleevepattern.valueOf(toTest) != null) {
				return true;
			}
			return false;
		} catch (IllegalArgumentException e) {
			return false;
		}
	}
	
	private boolean isCapPattern(String toTest) {
		try {
			if (SilkDescription.cappattern.valueOf(toTest) != null) {
				return true;
			}
			return false;
		} catch (IllegalArgumentException e) {
			return false;
		}
	}
	
	public void loadFromDescription(String description) {
		try {
			this.logger.info(description);
			
			// need to do some basic replacements
			description = description.replace(" slvs ", " sleeves ");
			
			List<String> tokens = new ArrayList();
			StringTokenizer tokenizer = new StringTokenizer(description, " ,&",
					false);
			String nextToken = "";
			while (tokenizer.hasMoreTokens()) {
				String lastToken = nextToken;
				nextToken = tokenizer.nextToken();
				if (keywords.contains(lastToken + "_" + nextToken)) {
					tokens.add(lastToken + "_" + nextToken);
				} else if (keywords.contains(nextToken)) {
					tokens.add(nextToken);
				}
			}

			body = new SilksDescriptionElement();
			// pop off the first word as the jacket colour
			body.setColour(tokens.remove(0));
			// search for the body pattern
			int bodyLimit = (tokens.indexOf("sleeves") > 0) ? tokens
					.indexOf("sleeves") : ((tokens.indexOf("cap") > 0) ? tokens
					.indexOf("cap") : tokens.size());
			// look for the body pattern
			for (int patternIndex = 0; patternIndex < bodyLimit; patternIndex++) {
				String token = tokens.get(patternIndex);
				if (isBodyPattern(token)) {
					// special logic for large spots
					if (description.contains("large")) {
						body.setPattern("large_spots");
					}
					else {
						body.setPattern(token);
					}
					tokens.remove(patternIndex);
					break;
				}
			}
			// if we have a body pattern then we must have a pattern colour
			if (!body.getPattern().equals("plain")) {
				int index = 0;
				for (String token : tokens) {
					if (isColour(token)) {
						body.setPatternColour(token);
						tokens.remove(index);
						break;
					}
					index++;
				}
			}
			// look for the sleeve pattern
			sleeve = new SilksDescriptionElement();
			if (tokens.contains("sleeves")) {
				int sleeveIndex = tokens.indexOf("sleeves");
				// look for the pattern
				for (int i = sleeveIndex - 1; i >= 0; i--) {
					String token = tokens.get(i);
					if (isSleevePattern(token)) {
						sleeve.setPattern(token);
						tokens.remove(i);
						break;
					}
				}
				// look for the colours
				for (int i = sleeveIndex - 1; i >= 0; i--) {
					String token = tokens.get(i);
					if (isColour(token)) {
						if (sleeve.getPattern().equals("plain")) {
							sleeve.setColour(token);
						} else if (sleeve.getPatternColour() == null) {
							sleeve.setPatternColour(token);
						} else {
							sleeve.setColour(token);
						}
						tokens.remove(i);
					}
				}
			}
			else {
				for (String token : tokens) {
					if (isSleevePattern(token) && !isCapPattern(token)) {
						sleeve.setPattern(token);
					}
				}
				// if no sleeves are specified and the body pattern is also applicable to the sleeve
				if (sleeve.getPattern().equals("plain") && isSleevePattern(body.getPattern())) {
					sleeve.setPattern(body.getPattern());
				}
			}
			if (description.contains("& sleeves") && !body.getPattern().equals("plain") && sleeve.getPattern().equals("plain")) {
				sleeve.setColour(body.getPatternColour());
			}
			sleeve.copyFrom(body);
			
			// look for the sleeve pattern
			if (tokens.contains("cap")) {
				cap = new SilksDescriptionElement();
				int capIndex = tokens.size();
				// look for the pattern
				for (String token : tokens) {
					if (isCapPattern(token)) {
						cap.setPattern(token);
						break;
					}
				}
				// look for the colours
				capIndex = tokens.size();
				for (int i = 0; i < capIndex; i++) {
					String token = tokens.get(i);
					if (isColour(token)) {
						if (cap.getPattern().equals("plain")) {
							cap.setColour(token);
						} else if (cap.getPatternColour() == null) {
							cap.setPatternColour(token);
						} else {
							cap.setColour(token);
						}
					}
				}
				cap.copyFrom(body);
			}
			if (cap == null) {
				cap = new SilksDescriptionElement();
				cap.setColour("white");
			}
			if (description.contains("& cap")) {
				if (isCapPattern(sleeve.getPattern())) {
					cap.setPattern(sleeve.getPattern());
				}
				if (description.contains("sleeve")) {
					cap.copyFrom(sleeve);
				}
				else {
					cap.copyFrom(body);
				}
			}
			
			
			this.logger.info(this.toString());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.log(Level.SEVERE, description, e);
		}
	}

	@XmlElement(name = "body")
	public SilksDescriptionElement getBody() {
		return body;
	}

	public void setBody(SilksDescriptionElement body) {
		this.body = body;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return String.format("body: %s,sleeves: %s, cap: %s", body.toString(),
				sleeve.toString(), cap.toString());
	}

	@XmlElement(name = "sleeve")
	public SilksDescriptionElement getSleeve() {
		return sleeve;
	}

	public void setSleeve(SilksDescriptionElement sleeve) {
		this.sleeve = sleeve;
	}

	@XmlElement(name = "cap")
	public SilksDescriptionElement getCap() {
		return cap;
	}

	public void setCap(SilksDescriptionElement cap) {
		this.cap = cap;
	}
	
	public void saveVectorFile(File svgFile, File pngFile) throws JAXBException, TransformerException, IOException, TranscoderException {
		File xmlFile = File.createTempFile("temp-file-name", ".xml");  
		
		JAXBContext context = JAXBContext.newInstance(SilkDescription.class);
		Marshaller m = context.createMarshaller(); //for pretty-print XML in
		m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
		m.marshal(this, xmlFile);
		
		
		
		TransformerFactory factory = TransformerFactory.newInstance();
		ClassLoader cl = this.getClass().getClassLoader();
		String systemID = "CreateSilkSvg.xsl"; 
		InputStream in = cl.getResourceAsStream(systemID);
		URL url = cl.getResource(systemID);
		Source source = new StreamSource(in);
		source.setSystemId(url.toExternalForm()); 
		Transformer transformer = factory.newTransformer(source); 
		StreamSource xmlSource = new StreamSource(xmlFile);
		FileOutputStream stream = new FileOutputStream(svgFile);
		StreamResult result = new StreamResult(stream);
		transformer.transform(xmlSource, result);
		xmlFile.delete();
		
		// this bit converts the svg to png and uploads to parse Transcoder
		PNGTranscoder transcoder = new PNGTranscoder();
		TranscoderInput transcoderInput = new TranscoderInput(new FileInputStream(svgFile));
		TranscoderOutput transcoderOutput = new TranscoderOutput(new FileOutputStream(pngFile));
		transcoder.transcode(transcoderInput, transcoderOutput);
		this.logger.info(String.format("svg file:%s,png file:%s", svgFile.getAbsolutePath(), pngFile.getAbsolutePath()));
	}
}
