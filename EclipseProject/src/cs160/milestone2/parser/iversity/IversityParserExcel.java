import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class IversityParserExcel
{
	public static void main(String[] args) throws IOException
	{
		Elements courseselements =
			Jsoup.connect("https://iversity.org/courses").get().select(
				"article[class=courses-list-item]");

		System.out
			.println("<!DOCTYPE html><html><head><style>table,th,td{border:1px solid black;}</style></head><table style=\"width:300px\">");
		System.out
			.println("<tr><th>title</th><th>id</th><th>category</th><th>professors</th><th>short desc</th><th>img src</th><th>course link</th><th>start date</th>"
				+ "<th>language</th><th>long desc</th><th>video</th><th>prof imgs</th><th>time scraped</th><th>course length</th><th>site</th><th>university</th><th>certification</th><th>price</th></tr>");
		for (int i = 0; i < courseselements.size(); i++)
		{
			System.out.println("<tr>");

			//title
			System.out.print("<td>");
			String title = courseselements.select("h2").get(i).text();
			System.out.print(title);
			System.out.print("</td>\n");

			//course id
			System.out.print("<td>");
			String courseid = Integer.toString(i);
			System.out.print(courseid);
			System.out.print("</td>\n");

			//category
			System.out.print("<td>");
			String category =
				courseselements.select("div[class=ribbon-content]").get(i).text();
			System.out.print(category);
			System.out.print("</td>\n");

			//prof names
			System.out.print("<td>");
			String prof_names =
				courseselements.select("p[class=instructors truncate]").get(i)
					.text();
			System.out.print(prof_names);
			System.out.print("</td>\n");

			//short desc
			System.out.print("<td>");
			String short_desc =
				courseselements.select("p[class=description]").get(i).text();
			System.out.print(short_desc);
			System.out.print("</td>\n");

			//img src
			System.out.print("<td>");
			String imgsrc = courseselements.select("img[src]").get(i).attr("src");
			System.out.print(imgsrc);
			System.out.print("</td>\n");

			//course link
			System.out.print("<td>");
			String link =
				courseselements.select("a[class=d-block]").get(i).attr("href");
			if (!link.contains("https://iversity.org"))
				link = "https://iversity.org" + link;
			System.out.print(link);
			System.out.print("</td>\n");

			//start date
			System.out.print("<td>");
			System.out.print(courseselements.select("li[title=Start date]").get(i)
				.text());
			System.out.print("</td>\n");

			//lang
			System.out.print("<td>");
			System.out.print(courseselements.select("li[title=Language]").get(i)
				.text());
			System.out.print("</td>\n");

			//now connect to inside this course page
			Document coursepage = Jsoup.connect(link).get();

			//long desc
			System.out.print("<td>");
			String longdesc =
				coursepage.select("div[class=row-fluid main-content course-show]")
					.select("div[class=block-wrapper]").text().replaceAll(
						"About this course|Course Summary|Go to course|Course Description", "")
					.trim();
			System.out.print(longdesc);
			System.out.print("</td>\n");

			//video link
			System.out.print("<td>");
			String videolink = coursepage.select("iframe[src]").attr("src");
			System.out.print(videolink);
			System.out.print("</td>\n");

			//professor image
			System.out.print("<td>");
			int numprofs =
				coursepage.getElementsByClass("avatar").select("img[src]").size();
			String profimgsrc = "";
			for (int j = 0; j < numprofs; j++)
				profimgsrc +=
					coursepage.getElementsByClass("avatar").select("img[src]")
						.get(j).attr("src")
						+ ", ";
			System.out.print(profimgsrc);
			System.out.print("</td>\n");

			//time scraped is unix timestamp (seconds since epoch)
			System.out.print("<td>");
			long time_scraped = System.currentTimeMillis() / 1000L;
			System.out.print(time_scraped);
			System.out.print("</td>\n");

			//course length: searches in long description to find the number of the last week.
			System.out.print("<td>");
			Matcher courselengthmatcher =
				Pattern.compile("(?:[wW]eek|WEEK) *(\\d+)").matcher(longdesc);
			int course_length = 0;
			while (courselengthmatcher.find())
				course_length =
					courselengthmatcher.group(1).isEmpty() ? 0 : Integer
						.parseInt(courselengthmatcher.group(1));
			System.out.print((course_length == 0 ? "unknown" : course_length)
				+ " weeks");
			System.out.print("</td>\n");

			//site name
			System.out.print("<td>");
			String sitename = "iversity.org";
			System.out.print(sitename);
			System.out.print("</td>\n");

			//university name
			System.out.print("<td>");
			String university =
				coursepage.select("span[class=organisation").text();
			System.out.print(university);
			System.out.print("</td>\n");

			//whether rewards certificate
			System.out.print("<td>");
			boolean certificate =
				Pattern.compile("[cC]ertificat").matcher(longdesc).find();
			System.out.print(certificate);
			System.out.print("</td>\n");

			//price
			System.out.print("<td>");
			String price = "free";
			System.out.print(price);
			System.out.print("</td>\n");

			System.out.println("</tr>");
			System.out.println();
		}
		System.out.println("</table></body></html>");
	}
}
