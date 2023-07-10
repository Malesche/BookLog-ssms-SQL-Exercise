# BookLog ssms-SQL-Exercise
Exercise for my SQL course. A Relational Database modeling books and a reading log.

One highlight was importing data from a goodreads csv. I wrote some functions to look at authors with several books in my data. Some more functions I used to conveniently retrieve Ids or other data and a procedure deletes a user and all his data. 

The most complex part i got around to were the triggers. They implement some logic around read dates and exclusive shelves. If a user puts a book on the currently reading shelf, it gets a new ReadDate with today as start date. If the book was on currently reading before and is then put on read, today is saved as an end date.


Very hurried for the deadline at the end of the course. let's see whether I get back to sort it all out a bit more. Enjoyed it quite a bit.

![BookLog-Diagram](https://github.com/Malesche/BookLog-ssms-SQL-Exercise/assets/32207690/3e67fbd7-14b4-4650-afbc-c7c49157baae)

Querying for authors who have several books. Table Functions.
![QueryingForAuthorsWithSeveralBooks](https://github.com/Malesche/ssms-SQL-Exercise-BookLog/assets/32207690/86420b9a-70a0-4b28-a5fd-cfa5cc44e2c0)
