	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

	<html>
	<head>

		<style>
		body
		{
			background-color:#b0c4de;
		}
		</style>

		<title></title>
	</head>

	<body>
		<h1 style="text-align:center;">UC DANDYS</h1>
	    
	    <!-- Temporary search bar (doesn't work atm) -->
		<div id="searchbar" style="text-align:center">
			<input maxlength="120" name="q" size="21" type="text"><input type="submit" value="search">
		</div><br>


		<table border="1" class="footable footable-sortable table" data-page-size="6" id="coursetable">
			<thead>
				<tr>
					<th data-sort-ignore="true">Image</th>

					<th data-sort-ignore="true">Name</th>

					<th data-sort-ignore="true">Category</th>

					<th data-sort-ignore="true">Start Date</th>

					<th data-sort-ignore="true">Length</th>
		        
	    				<th data-sort-ignore="true">Professor</th>

					<th data-sort-ignore="true">Prof. image</th>

					<th data-sort-ignore="true">Site</th>
				</tr>
			</thead>
			<?php
print ('showing only first 50 courses');

				//get database info on courses.
				$link = mysqli_connect('localhost', 'sjsucsor_s5g114s', 'dandys123', 'sjsucsor_160s5g12014s');
		    		if($result = mysqli_query($link, 'SELECT * FROM ((SELECT * FROM course_data ORDER BY site DESC LIMIT 50)) TEMP'))
				{
		        	//for each course
					while($row = $result->fetch_assoc())
					{
						//get id.
						$id = $row['id'];
						echo "<tr class='hv' id='course" . $row['id'] . "'>";
						echo "<td style='display:none;'>" . $row['id'] . "</td>";
						
						//build table rows.
						echo "<td><a href='" . $row['course_link'] . "'><img src=\"" . $row['course_image'] . "\" width=\"100\" height=\"100\"></a></td>"; //image
						echo "<td><a href='" . $row['course_link'] . "'>" . $row['title'] . "</a></td>"; //course name
						echo "<td>" . $row['category'] . "</td>"; //category
						echo "<td>" . ($row['start_date'] == "0000-00-00"? "Self Paced" : $row['start_date']) . "</td>"; //start date
						echo "<td>" . ($row['course_length'] <= 0? "Self Paced" : $row['course_length']) . "</td>"; //course length

						//fetch course details for this course.
				    		if ($result2 = mysqli_query($link, 'SELECT * FROM ((SELECT * FROM coursedetails WHERE course_id = ' . $id . ')) TEMP'))
				    		{
							$row2 = $result2->fetch_assoc();
							echo "<td>" . $row2['profname'] . "</td>"; //prof name
							echo "<td><img src =\"" . $row2['profimage'] . "\" width=\"100\" height=\"100\"></td>"; //prof image
				    		}
						else //no fetch result case.
						{
							echo "<td></td>";
							echo "<td></td>";						
						}
						echo "<td>" . $row['site'] . "</td>"; //site
						
						echo "</tr>";
					}
				}
			?>

			<tfoot>
				<tr>
					<td colspan="5"></td>
				</tr>
			</tfoot>
		</table>
	</body>
	</html>		