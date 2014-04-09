#!/usr/bin/env python2.7

import json
import urllib
import datetime
import time    


jsonurl = urllib.urlopen('https://www.coursera.org/maestro/api/topic/list2')
data = json.load(jsonurl)

"""
for `coursedetails`:
{
  `id` 
  `profname`  //multiple professors????
  `profimage` (link?)
  `course_id (as an int)
}


for `course_data`:
{ 
  `id` (primary key, used to join coursedetails) //course_info (id)
  `title`   //topic_info (full name)
  `short_desc` //topic_info
  `long_desc` //need api call using short name from topic_info
  `course_link` //course_info (home_link)
  `video_link` 
  `start_date` //course_info (start_month, start_day, start_year)
  `course_length` (int) //course_info (duration)
  `course_image` (text) //topics_info (large_icon)
  `category` //topic_info (cats[])
  `site` 
  `course_fee` 
  `language` //topic_info (language)
  `certificate` (yes/no) //course_info (signature_track_registration_open -boolean value)
  `university`  //uni_info
  `time_scraped` 
}
"""

course_details = {}
course_data = {}


courses = data["courses"]
unis = data["unis"] 
topics = data["topics"]
cats = data["cats"]
insts = data["insts"]

instructor_info = {}
#generate id - instructor name pairs
for inst in insts:
    fullname = [inst['first_name'],inst['middle_name'],inst['last_name']]
    instructor_info[inst['instructor_id']] = ' '.join(fullname)
        
cat_info = {}
#generate id - cat name pairs
for cat in cats:
    cat_info[cat['id']] = cat['name']

uni_info = {}
#generate id -uni name pairs
for uni in unis:
    uni_info[uni['id']] = uni['name']

for course in courses:
    #course_data##########################################################################
    course_id = course['id']
    title = topics[str(course["topic_id"])]['name']
    short_desc = topics[str(course["topic_id"])]['short_description']

    short_name = topics[str(course["topic_id"])]['short_name']
    url = urllib.urlopen('https://www.coursera.org/maestro/api/topic/information?topic-id=' + short_name)
    content = json.load(url)
    long_desc = content['about_the_course']

    course_link = course['home_link']
    video_link = topics[str(course["topic_id"])]['video_baseurl'] + 'full/540p/index.webm'
    start_date = ''
    if course['start_year'] is not None and course['start_month'] is not None and course['start_day'] is not None:
        date = datetime.datetime(course['start_year'], course['start_month'], course['start_day'])
        start_date = '{:%Y-%m-%d}'.format(date)
    course_length = course['duration_string'] #needs to be converted into int
    course_image = topics[str(course["topic_id"])]['large_icon']
    categories = []
    if 'cats' in topics[str(course["topic_id"])]:
        categories = [cat_info[cat] for cat in topics[str(course["topic_id"])]['cats']]
    site = "https://www.coursera.org"
    course_fee = 0 #free
    language = topics[str(course["topic_id"])]['language']
    certificate = 'yes' if course['signature_track_registration_open'] else 'no'
    universities = []
    if 'unis' in topics[str(course["topic_id"])]:
        universities = [uni_info[uni] for uni in topics[str(course["topic_id"])]['unis']]
    time_scraped = time.strftime('%Y-%m-%d %H:%M:%S')

    #course_details##########################################################################
    instructors = [instructor_info[inst_id] for inst_id in course['instructors']] #prof names
    url = urllib.urlopen('https://www.coursera.org/maestro/api/user/instructorprofile?topic_short_name=' +
            short_name + '&exclude_topics=1')
    content = json.load(url)
    if content:
        profimage = [professor['photo'] for professor in content]
    #course_id is same as above

    output = "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s" % (course_id, title, short_desc, long_desc, course_link, video_link, start_date, course_length,course_image, categories, site, course_fee, language, certificate, universities, time_scraped,instructors, profimage)
    print output
"""
    print "Course ID: ", course_id
    print "Title: ", title
    print "Short desc: ", short_desc
    print "Long desc: ", long_desc
    print "Course link: ", course_link
    print "Video link: ", video_link
    print "Start date: ", start_date
    print "Course length: ", course_length
    print "Course image: ", course_image
    print "Categories: ", categories
    print "Site: ", site
    print "Course fee: ", course_fee
    print "Language: ", language
    print "Certificate offered: ", certificate
    print "Universities: ", universities
    print "Time scraped: ", time_scraped
    print "Professor(s): ", instructors
    print "Professor image(s): ", profimage
"""

