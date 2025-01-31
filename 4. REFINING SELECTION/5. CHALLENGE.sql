----------- Refining Selection ------------

-- Select All Story Collections titles  That contain 'stories' --
 select title from books where title like '%stories%';
 
 -- Find The Longest Book Print Out the Title and Page Count --
 select * from books;
 select title, pages from books order by pages desc limit 1;
 
 -- Print a summary containing the title and year, for the 3 most recent books -- 
 select concat(title, '-' , released_year) as 'summary' from books order by released_year desc limit 3;
 
 -- Find all books with an author_lname that contains a space(" ") --
 select title,author_lname  from books where author_lname like '% %';
 
 --  Find The 3 Books With The Lowest Stock Select title, year, and stock --
 select title,released_year,stock_quantity from books order by stock_quantity limit 3;
 
 --  Print title and author_lname, sorted first by author_lname and then by title --
 select title, author_lname from books order by author_lname, title;
 
 --  Sort Alphabetically By Last Name --
 SELECT
    CONCAT(
        'MY FAVORITE AUTHOR IS ',
        UPPER(author_fname),
        ' ',
        UPPER(author_lname),
        '!'
    ) AS yell
FROM books ORDER BY author_lname;