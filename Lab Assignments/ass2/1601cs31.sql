-- vedavikas 1601cs31 

create table Paper_details(
     paper_id VARCHAR(6),
     paper_title VARCHAR(100) ,
     paper_type VARCHAR(100) ,
     publication DATE 
);

create table Paper_author(
     paper_id VARCHAR(6) ,
     author_id VARCHAR(8) 
);

create table Author_details(
     author_id VARCHAR(8) ,
     author_type VARCHAR(10) 
);


create table Student_details(
     student_id VARCHAR(8) ,
     student_name VARCHAR(100) ,
     student_institute VARCHAR(30) ,
     department VARCHAR(10) ,
     DOB DATE,
     research_area VARCHAR(20) 
);

create table Faculty_details(
     faculty_id VARCHAR(8) ,
     faculty_name VARCHAR(100) ,
     faculty_institute VARCHAR(30) ,
     department VARCHAR(10) ,
     DOB DATE,
     research_area VARCHAR(20) 
);

create table Supervisor(
     faculty_id VARCHAR(8),
     student_id VARCHAR(8)
);




INSERT INTO Paper_details VALUES ('100001', 'paper1', 'conference', NOW());

INSERT INTO Paper_details VALUES ('100002', 'paper2', 'journal', NOW());


INSERT INTO Paper_details VALUES ('100003', 'paper3', 'conference', NOW());

INSERT INTO Paper_details VALUES ('100004', 'paper4', 'journal', NOW());


INSERT INTO Paper_details VALUES ('100005', 'paper5', 'conference', NOW());

INSERT INTO Paper_details VALUES ('100006', 'paper6', 'journal', NOW());

INSERT INTO Paper_details VALUES ('100007', 'paper7', 'conference', NOW());

INSERT INTO Paper_details VALUES ('100008', 'paper8', 'journal', NOW());

INSERT INTO Paper_details VALUES ('100009', 'paper9', 'conference', NOW());

INSERT INTO Paper_details VALUES ('100010', 'paper10', 'journal', NOW());


INSERT INTO Paper_author VALUES ('100001', '101');

INSERT INTO Paper_author VALUES ('100001', '102');

INSERT INTO Paper_author VALUES ('100001', '103');

INSERT INTO Paper_author VALUES ('100002', '102');

INSERT INTO Paper_author VALUES ('100002', '103');

INSERT INTO Paper_author VALUES ('100003', '103');


INSERT INTO Paper_author VALUES ('100004', '104');


INSERT INTO Paper_author VALUES ('100005', '1501CS60');

INSERT INTO Paper_author VALUES ('100006', '1501CS61');

INSERT INTO Paper_author VALUES ('100007', '1501CS60');

INSERT INTO Paper_author VALUES ('100008', '1501CS62');

INSERT INTO Paper_author VALUES ('100008', '1501CS63');

INSERT INTO Paper_author VALUES ('100009', '1501CS64');

INSERT INTO Paper_author VALUES ('100010', '1501CS61');


INSERT INTO Author_details VALUES ('1501CS60', 'student');

INSERT INTO Author_details VALUES ('101', 'faculty');

INSERT INTO Author_details VALUES ('1501CS61', 'student');

INSERT INTO Author_details VALUES ('102', 'faculty');

INSERT INTO Author_details VALUES ('1501CS62', 'student');

INSERT INTO Author_details VALUES ('103', 'faculty');

INSERT INTO Author_details VALUES ('1501CS63', 'student');

INSERT INTO Author_details VALUES ('104', 'faculty');

INSERT INTO Author_details VALUES ('1501CS64', 'student');



INSERT INTO Student_details VALUES ('1501CS60','a Kumar','IITP','CSE','2010-03-31','Big Data');

INSERT INTO Student_details VALUES ('1501CS61','b','IITP','EE','2010-02-03','AI');

INSERT INTO Student_details VALUES ('1501CS62','c','IITP','CSE','2000-01-31','Big Data');

INSERT INTO Student_details VALUES ('1501CS63','d','IITP','CSE','2001-01-29','Big Data');

INSERT INTO Student_details VALUES ('1501CS64','e Kumar','IITP','CSE','2011-01-31','AI');

INSERT INTO Student_details VALUES ('1501CS65','f Kumar','IITP','CSE','2011-01-31','ML');



INSERT INTO Faculty_details VALUES ('101','a','IITP','CSE','2010-03-31','Big Data');

INSERT INTO Faculty_details VALUES ('102','b','IITP','EE','2010-02-03','AI');

INSERT INTO Faculty_details VALUES ('103','c','IITP','CSE','2000-01-31','AI');

INSERT INTO Faculty_details VALUES ('104','d','IITP','CSE','2001-01-29','Big Data');

INSERT INTO Faculty_details VALUES ('105','e','IITP','CSE','2011-03-31','ML');


INSERT INTO Supervisor VALUES ('101','1501CS60');

INSERT INTO Supervisor VALUES ('101','1501CS61');

INSERT INTO Supervisor VALUES ('102','1501CS60');

INSERT INTO Supervisor VALUES ('103','1501CS63');

INSERT INTO Supervisor VALUES ('102','1501CS64');




-- ALTER TABLE Paper_details ADD CONSTRAINT MyPrimaryKey PRIMARY KEY (paper_id);

-- ALTER TABLE Author_details ADD CONSTRAINT MyPrimaryKey PRIMARY KEY (author_id);

-- ALTER TABLE Student_details ADD CONSTRAINT MyPrimaryKey PRIMARY KEY (student_id);

-- ALTER TABLE Faculty_details ADD CONSTRAINT MyPrimaryKey PRIMARY KEY (faculty_id,research_area);

-- ALTER TABLE Paper_author ADD CONSTRAINT MyPrimaryKey PRIMARY KEY (paper_id,author_id);

-- ALTER TABLE Supervisor ADD CONSTRAINT MyPrimaryKey PRIMARY KEY (faculty_id,student_id);


-- ALTER TABLE Paper_author ADD FOREIGN KEY (paper_id) REFERENCES Paper_details(paper_id);

-- ALTER TABLE Paper_author ADD FOREIGN KEY (author_id) REFERENCES Author_details(author_id);

-- ALTER TABLE Supervisor ADD  FOREIGN KEY (faculty_id) REFERENCES Faculty_details(faculty_id);

-- ALTER TABLE Supervisor ADD  FOREIGN KEY (student_id) REFERENCES Student_details(student_id);

SELECT faculty_id,faculty_name FROM Faculty_details WHERE faculty_id NOT IN (SELECT faculty_id  FROM Supervisor);



select student_id,student_name from Student_details where student_institute = 'IITP' and student_id IN (select author_id from Author_details where author_type
= 'student');



select a.paper_id,a.paper_title from Paper_details as a where a.paper_id IN (select Paper_author.paper_id from Paper_author where Paper_author.author_id In (select Author_details.author_id from Author_details where 
 Author_details.author_type = 'student' and Author_details.author_id = '1501CS60'));



SELECT student_id,student_name,'102' as 'GUIDANCE Faculty' FROM Student_details WHERE student_id IN 
(SELECT student_id FROM Supervisor WHERE faculty_id='102')AND student_id IN 
(SELECT author_id FROM Paper_author WHERE paper_id IN(SELECT paper_id FROM Paper_details WHERE paper_type='conference') 
     AND author_id IN(SELECT author_id FROM Author_details WHERE author_type='student'));




select a.paper_title from Paper_details as a where a.paper_id in (select paper_id from 
Paper_author group by paper_id having count(author_id)=1);



select count(paper_id),author_id from Paper_author where author_id in (select author_id from Author_details where author_type = 'faculty')
group by author_id;




select count(paper_id) as cn,author_id  from Paper_author group by author_id having cn = 
(SELECT count(paper_id) FROM Paper_author GROUP BY author_id ORDER BY count(paper_id) DESC LIMIT 1);




select student_id,student_name from Student_details where student_id not in (select author_id from Author_details where author_type
= 'student');



select student_id from Supervisor group by student_id having count(faculty_id)=2;



select sum(a.v) as "Total papers" from (select count(paper_id) as v from Paper_author where author_id in (select author_id from Author_details where author_id
in (select faculty_id from Faculty_details      
where research_area = 'Big Data') and author_type = 'faculty' ) group by author_id having count(paper_id)>=1) a;



SELECT Faculty_details.research_area as 'research area',COUNT(Paper_author.paper_id) as 'papers published' FROM Paper_author INNER JOIN Faculty_details ON Paper_author.author_id=Faculty_details.faculty_id
GROUP BY Faculty_details.research_area ORDER BY COUNT(Paper_author.paper_id) DESC;




select faculty_id,count(student_id) as cnt from Supervisor group by faculty_id having cnt = 
(SELECT count(student_id) FROM Supervisor GROUP BY faculty_id ORDER BY count(student_id) DESC LIMIT 1);

