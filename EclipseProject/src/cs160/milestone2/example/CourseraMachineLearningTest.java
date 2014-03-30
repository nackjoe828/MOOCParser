package cs160.milestone2.example;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import cs160.milestone2.parser.CourseraParser;

public class CourseraMachineLearningTest {
	public static void main(String[] args) throws IOException{
		Document doc = Jsoup.connect("https://www.coursera.org/course/ml").get();
		CourseraParser cParser = new CourseraParser();
		
		//add line to test method
		/* Example
		String str1 = cParser.getProfName(doc);
		String str2 = cParser.getProfImage(doc);
		*/
		
		//pull request after origin forward test
	}
}
