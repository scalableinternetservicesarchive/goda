3 phase:
phase 1: 30 second. each second comes a user,in total 30 users
phase 2: 30 second. each second comes 2 users, in total 60 users.
phase 3: 30 second, each second comes 4 users, in total 120 users.

session:
1: get home papge "/" 
2: wait for 2 seconds to go through the home page
3: get signup html(form, named"authenticity_token")
4: wait for 2 seconds to fill in the signup form
(generate "random_user_name","randon_email_name")
5: post the signup form


report:

Main statistics:
  1.The average duration of the connection establishment is 1.66 msec
  2.The average response time for each set of requests (the requests not separated by a thinktime) is 31.93 msec. 
  3.The average duration of a user's session is 3.93 sec

HTTP return code Status (rate)
  1.at the beginining of the test, the 422 status the codes have some problem.

 
 
