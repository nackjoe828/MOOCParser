import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.LineNumberReader;
import java.io.PrintWriter;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

class IversityParser
{
	public static void main(String[] args) throws IOException, SQLException,
		InstantiationException, IllegalAccessException, ClassNotFoundException,
		ParseException
	{
		//init database loading sql file
		Database db = new Database();

		//get elements of courses
		Elements courseselements =
			Jsoup.connect("https://iversity.org/courses").get().select(
				"article[class=courses-list-item]");

		int profidx = 0;
		for (int courseidx = 0; courseidx < courseselements.size(); courseidx++)
		{
			//title
			String title =
				addSlashes(courseselements.select("h2").get(courseidx).text());

			//short desc
			String short_desc =
				addSlashes(courseselements.select("p[class=description]").get(
					courseidx).text().trim());

			//category
			String category =
				addSlashes(courseselements.select("div[class=ribbon-content]").get(
					courseidx).text());

			//prof names (truncate beginning if too long)
			String[] prof_names =
				addSlashes(
					courseselements.select("p[class=instructors truncate]").get(
						courseidx).text().trim().replaceAll("\band\b", "")).split(
					", *");
			for (int i = 0; i < prof_names.length; i++)
				if (prof_names[i].length() > 30)
					prof_names[i] =
						prof_names[i].substring(prof_names[i].length() - 30,
							prof_names[i].length());

			//course image
			String course_image =
				addSlashes(courseselements.select("img[src]").get(courseidx).attr(
					"src").trim());

			//course link
			String link =
				courseselements.select("a[class=d-block]").get(courseidx).attr(
					"href");
			if (!link.contains("https://iversity.org"))
				link = "https://iversity.org" + link;
			String course_link = addSlashes(link);

			//lang
			String language =
				addSlashes(courseselements.select("li[title=Language]").get(
					courseidx).text().trim());

			//now connect to inside this course page
			Document coursepage = Jsoup.connect(link).get();

			//start date
			String start_date =
				convertDate(coursepage.select("ul[class*=course-meta]").select(
					"li:first-of-type").text().trim());

			//long desc
			String long_desc =
				addSlashes(coursepage
					.select("div[class=row-fluid main-content course-show]")
					.select("div[class=block-wrapper]")
					.text()
					.replaceAll(
						"About this course|Course Summary|Go to course|Course Description",
						"").trim());

			//video link
			String video_link =
				addSlashes(coursepage.select("iframe[src]").attr("src"));

			//professor images
			int numprofs =
				coursepage.getElementsByClass("avatar").select("img[src]").size();
			String[] profimages = new String[numprofs];
			for (int i = 0; i < numprofs; i++)
				profimages[i] =
					addSlashes(coursepage.getElementsByClass("avatar").select(
						"img[src]").get(i).attr("src"));

			//time scraped is unix timestamp (seconds since epoch)
			String time_scraped =
				new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(Calendar
					.getInstance().getTime());

			//course length: searches in long description to find the number of the last week.
			Matcher courselengthmatcher =
				Pattern.compile("(?:[wW]eek|WEEK) *(\\d+)").matcher(long_desc);
			int course_length = 0;
			while (courselengthmatcher.find())
				course_length =
					courselengthmatcher.group(1).isEmpty() ? 0 : Integer
						.parseInt(courselengthmatcher.group(1));

			//site name
			String site = "iversity.org";

			//university name
			String university =
				coursepage.select("span[class=organisation").text();

			//whether rewards certificate
			String certificate =
				Pattern.compile("[cC]ertificat").matcher(long_desc).find() ? "yes"
					: "no";

			//price
			String course_fee = "0";

			//put all into db
			//course table
			db.update("insert into course_data values('" + 0 + "','" + title
				+ "','" + short_desc + "','" + long_desc + "','" + course_link
				+ "','" + video_link + "','" + start_date + "','" + course_length
				+ "','" + course_image + "','" + category + "','" + site + "','"
				+ course_fee + "','" + language + "','" + certificate + "','"
				+ university + "','" + time_scraped + "')");

			//get course id from db itself, because it's the one generating it
			ResultSet rs = db.query("select id from course_data order by id asc");
			int course_id = 0;
			while (rs.next())
				course_id = rs.getInt("id");

			//prof table
			for (int i = 0; i < prof_names.length; i++)
				db.update("insert into coursedetails values('" + profidx++ + "','"
					+ prof_names[i] + "','" + profimages[i] + "','" + course_id
					+ "')");
		}

		//close db
		db.close();
	}

	/**
	 * convert date to sql format
	 * @param date
	 * @return
	 * @throws ParseException
	 */
	static String convertDate(String date)
	{
		SimpleDateFormat format1 =
			new SimpleDateFormat("dd MMMM yyyy", Locale.ENGLISH);
		SimpleDateFormat format2 =
			new SimpleDateFormat("MMMM yyyy", Locale.ENGLISH);

		try
		{
			return new SimpleDateFormat("yyyy-MM-dd").format(
				format1.parse(date.trim().replaceAll("\\.", ""))).toString();
		}
		catch (ParseException e)
		{
			try
			{
				return new SimpleDateFormat("yyyy-MM-dd").format(
					format2.parse(date.trim().replaceAll("\\.", ""))).toString();
			}
			catch (ParseException e1)
			{
				return "";
			}
		}
	}

	static String addSlashes(String string)
	{
		return string.replaceAll("([\\/'\"])", "\\\\$1");
	}
}

/**
 * db reference
 * @author david
 *
 */
class Database
{
	String DRIVER_NAME = "com.mysql.jdbc.Driver";
	String URL = "jdbc:mysql://localhost/moocs160";
	String USER = "root";
	String PASSWORD = "";
	Connection connection;

	/**
	 * make db with connection
	 */
	Database() throws SQLException, InstantiationException,
		IllegalAccessException, ClassNotFoundException
	{
		Class.forName(DRIVER_NAME).newInstance();
		connection = DriverManager.getConnection(URL, USER, PASSWORD);
	}

	/**
	 * construct db with sql file
	 * @param sqlfile
	 */
	Database(String sqlfile) throws SQLException, IOException,
		InstantiationException, IllegalAccessException, ClassNotFoundException
	{
		this();

		//execute each line of sql file
		new ScriptRunner(connection, false, true).runScript(new FileReader(
			new File(sqlfile)));
	}

	/**
	 * update db
	 * @param query
	 * @return resultset
	 */
	int update(String query) throws SQLException
	{
		Statement statement = connection.createStatement();
		int result = statement.executeUpdate(query);
		statement.close();
		return result;
	}

	/**
	 * query db
	 * @param query
	 * @return resultset
	 */
	ResultSet query(String query) throws SQLException
	{
		Statement statement = connection.createStatement();
		ResultSet result = statement.executeQuery(query);
		return result;
	}

	/**
	 * close db
	 */
	void close() throws SQLException
	{
		connection.close();
	}
}