#!/usr/bin/env python2.7

import json
import urllib
import datetime
import time    
import MySQLdb


jsonurl = urllib.urlopen('https://www.coursera.org/maestro/api/topic/list2')
data = json.load(jsonurl)

"""
for 'coursedetails':
{
  'id' 
  'profname'  //multiple professors????
  'profimage' (link?)
  'course_id (as an int)
}


for 'course_data':
{ 
  'id' (primary key, used to join coursedetails) //course_info (id)
  'title'   //topic_info (full name)
  'short_desc' //topic_info
  'long_desc' //need api call using short name from topic_info
  'course_link' //course_info (home_link)
  'video_link' 
  'start_date' //course_info (start_month, start_day, start_year)
  'course_length' (int) //course_info (duration)
  'course_image' (text) //topics_info (large_icon)
  'category' //topic_info (cats[])
  'site' 
  'course_fee' 
  'language' //topic_info (language)
  'certificate' (yes/no) //course_info (signature_track_registration_open -boolean value)
  'university'  //uni_info
  'time_scraped' 
}
"""
db = MySQLdb.connect("192.168.0.91", "root", "arctura", "moocs160")

cursor = db.cursor()

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
id_counter = 0
for course in courses:
    #course_data##########################################################################
    course_id = course['id']
    title = str(MySQLdb.escape_string(topics[str(course["topic_id"])]['name'].encode('ascii', 'ignore')))
    short_desc = str(MySQLdb.escape_string(topics[str(course["topic_id"])]['short_description'].encode('ascii', 'ignore')))

    short_name = topics[str(course["topic_id"])]['short_name']
    url = urllib.urlopen('https://www.coursera.org/maestro/api/topic/information?topic-id=' + short_name)
    content = json.load(url)
    long_desc = (content['about_the_course']).encode('ascii', 'ignore')
    long_desc = str(MySQLdb.escape_string(long_desc))

    course_link = str(course['home_link'])
    video_link = topics[str(course["topic_id"])]['video_baseurl'] + 'full/540p/index.webm'
    start_date = ''
    if course['start_year'] is not None and course['start_month'] is not None and course['start_day'] is not None:
        date = datetime.datetime(course['start_year'], course['start_month'], course['start_day'])
        start_date = '{:%Y-%m-%d}'.format(date)
    duration = course['duration_string'] #needs to be converted into int
    if duration:
        course_length = int(''.join(x for x in duration if x.isdigit()))
    else:
        course_length = 0
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
    #course_id is same as 

    coursera_data = "INSERT INTO course_data VALUES (0, '%s', '%s', '%s', '%s', '%s', '%s', %d, '%s', '%s', '%s', %d, '%s', '%s', '%s', '%s')" % (title, short_desc, long_desc, course_link, video_link, start_date, course_length, course_image, ' '.join(categories), site, course_fee, language, certificate, ' '.join(universities), time_scraped)

    cursor.execute(coursera_data)
    db.commit()
    cur_id = "SELECT id from course_data order by id desc" #get latest added id
    cursor.execute(cur_id)
    results = cursor.fetchall()

    for pair in zip(instructors, profimage):
        prof_name = str(MySQLdb.escape_string(pair[0].encode('ascii', 'ignore')))
        prof_image = str(MySQLdb.escape_string(pair[1].encode('ascii', 'ignore')))
        courseradetails = "INSERT INTO coursedetails VALUES (%d, '%s', '%s', %d)" % (id_counter, prof_name, prof_image, results[0][0])
        cursor.execute(courseradetails)
        db.commit()
        id_counter += 1

db.close()
