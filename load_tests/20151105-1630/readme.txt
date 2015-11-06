3 phase:
phase 1: 30 second. each second comes a user,in total 30 users
phase 2: 30 second. each second comes 2 users, in total 60 users.
phase 3: 30 second, each second comes 4 users, in total 120 users.

session:
1: get home papge "/" 
2: wait for 2 seconds to go through the home page
3: get login html(form, named"authenticity_token")
4: wait for 2 seconds to fill in the login form
(the login information has already been writen in the seed.rb)
5: post the login form
6. wait for 2 seconds to wait for the user to decide to new a driver post.
7. get new driver post html
8. wait for 2 seconds to fill in the new driver form
9. post the new driver form


report:

Main statistics:
  1.The average duration of the connection establishment is 1.53 msec
  2.The average response time for each set of requests (the requests not separated by a thinktime) is 24.87 msec. 
  3.The average duration of a user's session is 7.94 sec

HTTP return code Status (rate)
  1.during 0-10 seconds, 200 status codes are good
  2.after 10 seconds, 400 status codes indicate problems: it may becuase there are too many requests.(or bug in testing code?)

 
 
