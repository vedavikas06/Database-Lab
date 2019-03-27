/* veda vikas potnuru , 1601cs31,CSE*/


create table Paper_details(
     paper_id VARCHAR(6),
     paper_title VARCHAR(100) ,
     paper_type VARCHAR(100) ,
     publication DATE 
);

create table Paper_author(
     paper_id VARCHAR(6) ,
     author_id VARCHAR(6) 
);

create table Author_details(
     author_id VARCHAR(6) ,
     author_type VARCHAR(10) 
);


create table Student_details(
     student_id VARCHAR(6) ,
     student_name VARCHAR(100) ,
     student_institute VARCHAR(30) ,
     department VARCHAR(10) ,
     DOB DATE,
     research_area VARCHAR(20) 
);

create table Faculty_details(
     faculty_id VARCHAR(6) ,
     faculty_name VARCHAR(100) ,
     faculty_institute VARCHAR(30) ,
     department VARCHAR(10) ,
     DOB DATE,
     research_area VARCHAR(20) 
);

create table Supervisor(
     faculty_id VARCHAR(6),
     student_id VARCHAR(6)
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

INSERT INTO Paper_author VALUES ('100001', '100001');

INSERT INTO Paper_author VALUES ('100001', '100002');

INSERT INTO Paper_author VALUES ('100001', '100003');

INSERT INTO Paper_author VALUES ('100002', '100002');

INSERT INTO Paper_author VALUES ('100002', '100003');

INSERT INTO Paper_author VALUES ('100003', '100003');


INSERT INTO Paper_author VALUES ('100004', '100004');


INSERT INTO Paper_author VALUES ('100005', '100005');

INSERT INTO Paper_author VALUES ('100006', '100006');

INSERT INTO Paper_author VALUES ('100007', '100007');

INSERT INTO Paper_author VALUES ('100008', '100008');

INSERT INTO Paper_author VALUES ('100008', '100009');

INSERT INTO Paper_author VALUES ('100009', '100009');

INSERT INTO Paper_author VALUES ('100010', '100009');

INSERT INTO Author_details VALUES ('100001', 'student');

INSERT INTO Author_details VALUES ('100006', 'faculty');

INSERT INTO Author_details VALUES ('100002', 'student');

INSERT INTO Author_details VALUES ('100007', 'faculty');

INSERT INTO Author_details VALUES ('100003', 'student');

INSERT INTO Author_details VALUES ('100008', 'faculty');

INSERT INTO Author_details VALUES ('100004', 'student');

INSERT INTO Author_details VALUES ('100009', 'faculty');

INSERT INTO Author_details VALUES ('100005', 'student');



INSERT INTO Student_details VALUES ('100001','a Kumar','IITP','CSE','2010-03-31','Big Data');

INSERT INTO Student_details VALUES ('100002','b','IITP','EE','2010-02-03','AI');

INSERT INTO Student_details VALUES ('100003','c','IITP','CSE','2000-01-31','Big Data');

INSERT INTO Student_details VALUES ('100004','d','IITP','CSE','2001-01-29','Big Data');

INSERT INTO Student_details VALUES ('100005','e Kumar','IITP','CSE','2011-01-31','AI');


INSERT INTO Faculty_details VALUES ('100006','a','IITP','CSE','2010-03-31','Big Data');

INSERT INTO Faculty_details VALUES ('100007','b','IITP','EE','2010-02-03','AI');

INSERT INTO Faculty_details VALUES ('100008','c','IITP','CSE','2000-01-31','AI');

INSERT INTO Faculty_details VALUES ('100009','d','IITP','CSE','2001-01-29','Big Data');

INSERT INTO Faculty_details VALUES ('100010','e','IITP','CSE','2011-03-31','ML');


INSERT INTO Supervisor VALUES ('100006','100001');

INSERT INTO Supervisor VALUES ('100007','100002');

INSERT INTO Supervisor VALUES ('100008','100003');

INSERT INTO Supervisor VALUES ('100009','100004');

INSERT INTO Supervisor VALUES ('100010','100005');




ALTER TABLE Paper_details ADD CONSTRAINT MyPrimaryKey PRIMARY KEY (paper_id);

ALTER TABLE Author_details ADD CONSTRAINT MyPrimaryKey PRIMARY KEY (author_id);

ALTER TABLE Student_details ADD CONSTRAINT MyPrimaryKey PRIMARY KEY (student_id);

ALTER TABLE Faculty_details ADD CONSTRAINT MyPrimaryKey PRIMARY KEY (faculty_id,research_area);

ALTER TABLE Paper_author ADD CONSTRAINT MyPrimaryKey PRIMARY KEY (paper_id,author_id);

ALTER TABLE Supervisor ADD CONSTRAINT MyPrimaryKey PRIMARY KEY (faculty_id,student_id);


ALTER TABLE Paper_author ADD FOREIGN KEY (paper_id) REFERENCES Paper_details(paper_id);

ALTER TABLE Paper_author ADD FOREIGN KEY (author_id) REFERENCES Author_details(author_id);

ALTER TABLE Supervisor ADD  FOREIGN KEY (faculty_id) REFERENCES Faculty_details(faculty_id);

ALTER TABLE Supervisor ADD  FOREIGN KEY (student_id) REFERENCES Student_details(student_id);


SELECT paper_title FROM Paper_details WHERE paper_type = 'conference';

SELECT student_name,student_id FROM Student_details WHERE research_area = 'Big Data';

SELECT COUNT(paper_id) FROM Paper_details WHERE paper_type = 'journal';

SELECT student_name,student_id FROM Student_details WHERE DOB BETWEEN '1990-04-01' AND '2010-03-31';

SELECT faculty_name,faculty_id FROM Faculty_details WHERE research_area = 'AI';

SELECT faculty_name,faculty_id FROM Faculty_details WHERE research_area = 'AI' OR research_area = 'Big Data';

SELECT student_name,student_id FROM Student_details WHERE student_name like '_%Kumar';


SELECT COUNT(student_id), faculty_id FROM Supervisor GROUP BY faculty_id;

SELECT COUNT(author_id),paper_id FROM Paper_author  GROUP BY paper_id having count(*) > 1;




