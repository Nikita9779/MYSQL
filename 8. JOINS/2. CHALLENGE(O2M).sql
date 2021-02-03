----------------------------------------- Exercise(ONE TO MANY & JOINS) -------------------------------------------------

-- Create a table with students and papers with foreign key--
use nikita;
create table students( 
id int auto_increment primary key, 
first_name varchar(20)
);


create table papers(
title varchar(100),
grade int,
student_id int,
foreign key (student_id) references students(id) on delete cascade);

INSERT INTO students (first_name) VALUES 
('Caleb'), 
('Samantha'), 
('Raj'), 
('Carlos'), 
('Lisa');

insert into papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

-- print grade title and name of students in descending order -- 
select first_name,title,grade from students join papers on papers.student_id = students.id order by grade desc;

-- print this !!!!!!!
-- +------------+---------------------------------------+-------+
-- | first_name | title                                 | grade |
-- +------------+---------------------------------------+-------+
-- | Caleb      | My First Book Report                  |    60 |
-- | Caleb      | My Second Book Report                 |    75 |
-- | Samantha   | Russian Lit Through The Ages          |    94 |
-- | Samantha   | De Montaigne and The Art of The Essay |    98 |
-- | Raj        | NULL                                  |  NULL |
-- | Carlos     | Borges and Magical Realism            |    89 |
-- | Lisa       | NULL                                  |  NULL |
-- +------------+---------------------------------------+-------+

select first_name, title, grade from students 
left join papers on papers.student_id = students.id;

-- Print this !!!!!!!!!!!
-- +------------+---------------------------------------+-------+
-- | first_name | title                                 | grade |
-- +------------+---------------------------------------+-------+
-- | Caleb      | My First Book Report                  | 60    |
-- | Caleb      | My Second Book Report                 | 75    |
-- | Samantha   | Russian Lit Through The Ages          | 94    |
-- | Samantha   | De Montaigne and The Art of The Essay | 98    |
-- | Raj        | MISSING                               | 0     |
-- | Carlos     | Borges and Magical Realism            | 89    |
-- | Lisa       | MISSING                               | 0     |
-- +------------+---------------------------------------+-------+

select first_name,
ifnull(title ,'Missing') as title,
ifnull(Grade ,'0')as grade from students left join papers on papers.student_id = students.id;

-- Print first name and average --
select first_name, ifnull(avg(grade), '0') as average from students 
left join papers on papers.student_id = students.id 
group by students.id
order by average desc;

-- Print pass or fail based on average --
 SELECT first_name, 
 Ifnull(Avg(grade), 0) AS average, 
 case 
 when avg(grade) is null then 'FAIL'
 WHEN avg(grade) >= 75 THEN 'PASS' 
 ELSE 'FAIL' 
 end as Passing_status
 from students left join papers
 on papers.student_id= students.id group by students.id order by average desc;