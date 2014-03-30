package cs160.milestone2.parser;

import java.util.Date;

import org.jsoup.nodes.Document;

/**
 * Interface for MOOC website parser.
 * Each method takes a single course pages,
 * and returns a data in the required data type.
 * 
 * @author develover
 *
 */
public interface MOOCParser {
	
	//for table "coursedetails"
	public String getProfName(Document doc);
	public String getProfImage(Document doc);
	public int getCourseID(Document doc);
	
	//for table "course_data"
	public String getTitle(Document doc);
	public String getShortDescription(Document doc);
	public String getLongDescription(Document doc);
	public String getCourseLink(Document doc);
	public String getVideoLink(Document doc);
	public int getCourseLength(Document doc);
	public int getCourseImage(Document doc);
	public String getCategory(Document doc);
	public String getSite(Document doc);
	public int getCourseFee(Document doc);
	public String getLanguage(Document doc);
	public boolean getCertificate(Document doc);
	public String getUniversity(Document doc);
	public Date getTimeScraped(Document doc);
}
