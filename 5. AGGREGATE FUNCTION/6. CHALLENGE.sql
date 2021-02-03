----------------------------------- Aggregate Exercise------------------------------------


-- Print the number of books in the database  --
select count(*) from books;

--  Print out how many books were released in each year --
select released_year ,count(*) from books group by released_year;

--  Print out the total number of books in stock --
select sum(stock_quantity) from books;

-- Find the average released_year for each author --
select author_fname, author_lname ,avg(released_year) from books group by author_fname, author_lname;

-- Find the full name of the author who wrote the longest book --
select concat(author_fname, ' ', author_lname, pages) as longbook from books where pages= (select max(pages) from books);
-- or--
SELECT CONCAT(author_fname, ' ', author_lname) FROM books
ORDER BY pages DESC LIMIT 1;

-- find out the avg pages written in a year --  
select released_year as year, count(*) as '# of book', avg(pages) as 'avg pages' from books group by released_year;

