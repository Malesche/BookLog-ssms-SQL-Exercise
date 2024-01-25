# BookLog - SQL Exercise with SQL Server Management Studio (SSMS)
A Relational Database modeling books and a reading log. Exercise for my  month long relational databases and SQL course.

One highlight was importing data from a goodreads csv. I wrote some functions to look at authors with several books in my data. Some more functions I used to conveniently retrieve Ids or other data and a procedure deletes a user and all their data. 

The most complex part I got around to were the triggers. They implement some logic around read dates and exclusive shelves. If a user puts a book on the currently reading shelf, it gets a new read date with the curent date as start date. If the book was on currently reading before and is then put on read, the current date is saved as an end date.


Very hurried for the deadline at the end of the course but I really enjoyed working on it!

![BookLog-Diagram](https://github.com/Malesche/BookLog-ssms-SQL-Exercise/assets/32207690/3e67fbd7-14b4-4650-afbc-c7c49157baae)

Querying for authors who have several books. Table Functions.
![QueryingForAuthorsWithSeveralBooks](https://github.com/Malesche/ssms-SQL-Exercise-BookLog/assets/32207690/86420b9a-70a0-4b28-a5fd-cfa5cc44e2c0)
