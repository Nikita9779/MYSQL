----------------------------------------------- EXERCISE ---------------------------------------------------------
  -- Select All Books Written Before 1980 (non inclusive) --
  select * from books where released_year < 1980;
  
 -- Select All Books Written By Eggers Or Chabon --
 select * from books where author_lname = 'Eggers' OR author_lname='Chabon';
 
 -- Select All Books Written By Lahiri, Published after 2000 --
 select * from books where author_lname = 'Lahiri' and released_year > 2000;
 
 -- Select All books with page counts between 100 and 200
 select * from books where pages between 100 and 200;
 
 -- Select all books where author_lname  starts with a 'C' or an 'S'' --
 select * from books where author_lname like 'C%' or author_lname like 'S%';
 
 -- Divide in genre(If title contains 'stories'   -> Short Stories ,Just Kids and A Heartbreaking Work  -> Memoir, 
 -- Everything Else -> Novel) --
select *, 
CASE 
when title like '%stories%' then 'Short Stories' 
when title = 'Just Kids' OR title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memoir' 
else 'Novel' 
END AS TYPE 
FROM books;
          
 -- print out the count of books ever author wrote -- 
 
 SELECT title, author_lname,
    CASE 
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
    END AS COUNT
FROM books 
GROUP BY author_lname, author_fname;