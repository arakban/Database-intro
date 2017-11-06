# "Database code" for the DB Forum.

import datetime
import psycopg2
import bleach
from bleach.sanitizer import Cleaner

POSTS = [("This is the first post.", datetime.datetime.now())]

def get_posts():
  """Return all posts from the 'database', most recent first."""
  db =  psycopg2.connect(database = "forum")
  c = db.cursor()
  QUERY = "select content, time from posts order by time desc"
  c.execute(QUERY)
  posts = c.fetchall()
  db.close()
  return posts

def add_post(content):
  """Add a post to the 'database' with the current timestamp."""
  db = psycopg2.connect(database = "forum")
  c = db.cursor()
  bleached_content1 = bleach.Cleaner().clean(content)
  bleached_content_final = bleach.clean(bleached_content1)
  c.execute("insert into posts values (%s)", (bleached_content_final,))
  db.commit()
  db.close()


