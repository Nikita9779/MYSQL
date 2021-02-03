

----------------------------- Exercise String Functions -------------------------------------

-- Reverse and Uppercase the following sentence "Why does my cat look at me with such hatred?"-- 

select upper(reverse("Why does my cat look at me with such hatred?"));

-- Print this 'I-like-cats'
SELECT REPLACE(CONCAT('I', ' ', 'like', ' ', 'cats'), ' ', '-'); 
 
--- Replace ' ' with '->' --

use nikita;
select * from books;

select replace(title, ' ', '->') from books;

-- Print the name forward and backward
select author_lname, reverse(author_lname) from books;

-- Print fullname in Upper case
select upper( concat(author_fname,' ', author_lname)) as 'full name in caps' from books;

-- Print book released year
select concat(title ,' was released in', released_year) as 'name' from books; 

-- Print the book title and length of it --
select title, char_length(title)  as 'Character_Count' from books;

-- Print short title with author name and quantity
SELECT
   CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title',
   CONCAT(author_lname, ',', author_fname) AS author,
   CONCAT(stock_quantity, ' in stock') AS quantity
FROM books;