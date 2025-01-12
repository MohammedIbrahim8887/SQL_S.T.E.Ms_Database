CREATE DATABASE STEM1--TO CREATE THE DATABASE 
use STEM1--TO INFORCE THE SYSTEM  TO  USE THIS QUERY
/*BACKUP DATABASE STEM
TO DISK = 'C:\Users\hp\Desktop\STEM.bak';*/--it isn't working to backup my database on my pc
CREATE TABLE Department(--DEPARTMENT TABLE COLUMS/ATTRIBUTES
	DID VARCHAR(5) PRIMARY KEY ,
	DepartmentName NVARCHAR(50) NOT NULL,
	No_Of_Year INT NULL
);
INSERT INTO  Department(DID,DepartmentName,No_of_Year)--TO INSERT TUPLES INTO THE TABLE
VALUES('CS','Computer Science',4),
          ('IS','Information Science',4),
		  ('IT','Information Technogy',4),
		  ('ARC','Architecture',6),
		  ('ACC','Accounting',4),
		  ('CCC','Cross Cutting Courses',NULL),
		  ('MGT','Managment',4);
SELECT * FROM Department;--TO VIEW WHAT WE HAVE ENTERED INTO THIS SPECIFIC TABLE
CREATE TABLE Teacher (--TEACHER COLUM/ATTRIBUTES 
	TID VARCHAR(5) PRIMARY KEY,
	DID VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES Department(DID),
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Sex CHAR NOT NULL,
	PhoneNumber NVARCHAR(20)  UNIQUE NOT NULL,
	email NVARCHAR(50) UNIQUE NOT NULL,
	Passwords NVARCHAR(50) NOT NULL
);
INSERT INTO Teacher (TID,DID,FirstName,LastName,Sex,PhoneNumber,email,Passwords)
-- TO INSERT TUPLES INTO THIS TABLE 
VALUES('232','IT','Kaitlyn','Carine','F','+33 849 382 9565','kcarine0@ft.com','R4HqC1X'),
		     ('691','CS','Harwell','McPhillips','M','+86 789 109 8479','hmcphillips1@istockphoto.com','zNGjX0M'),
		     ('922','CCC','Hercules','Florio','M','+86 440 665 8560','hflorio2@prlog.org','bimOiiasGIhZ'),
		     ('589','ARC','Pansy','Talby','F','+265 880 890 3165','ptalby3@devhub.com','iZNbj9O'),
		     ('346','MGT','Troy','Shorthouse','M',	'+86 466 804 1491',	'tshorthouse4@goo.gl','E8Ff2ZjTY'),
		     ('453','CCC','Warren','McKillop','M','+58 303 253 6928','warenmc0@abc.com','mUj3dsmn');
SELECT*FROM Teacher;--TO VIEW THE DATA WE HAVE ENTERED INTO THIS SPECIFIC TABLE 

CREATE TABLE Course(--COURSE COLUMN/ATTRIBUTE
	CID VARCHAR(8) PRIMARY KEY,
	DID VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES Department(DID),
	Course_Name  NVARCHAR(50) NOT NULL,
	Credit_Hour INT NOT NULL,
	Contact_Hour INT NOT NULL
);
INSERT INTO Course(CID,DID,Course_Name,Credit_Hour,Contact_Hour)
--TO INSERT TUPLES INTO THE TABLE
VALUES ('CS02','IT','DSA',3,4),
		      ('HH101','CCC','History	',5,4),
		      ('CRP103','CS','Cryptography',3,3),
		      ('M51','CS','Mobile Computing',4,5),
		      ('M077','CCC','Mobility',5,2);
SELECT*FROM Course;--TO VIEW WHAT WE HAVE ENTERED INTO THIS SPECIFIC TABLE

SELECT Contact_Hour AS Lecture_Hr FROM Course--TO ENFORCE LECTURE HOUR TO NOT BE GREATER THAN THE CONTACT HOUR ASSIGNED IN THE DEPARTMENT TABLE
CREATE TABLE Lecture_Course(--LECTURE COURSE COLUMN/ATTRIBUTES 
	CID VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES Course(CID),
	Lecture_Hr INT NOT NULL, 
);
INSERT INTO Lecture_Course(CID,Lecture_Hr)--TO INSERT TUPLES TO THE TABLE LECTURE COURSE
VALUES('M077',4),
	         ('HH101',5);
SELECT*FROM Lecture_Course;--TO VIEW THE DATA WE HAVE ENTERED INTO THIS SPECIFIC TABLE

CREATE TABLE Lab_Lecture_Course( --LAB LECTURE COURSE COLUMN/ATTRIBUTE
    CID VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES Course(CID),
	Lab_Hr INT ,
	Lecture_Hour INT ,
	Equipments_needeed NVARCHAR(100) NOT NULL	
);
SELECT Lecture_Hour  FROM  Lab_Lecture_Course--TO INITIALIZE LECTURE HOUR  WE CALL THE TABLE
UPDATE Lab_Lecture_Course SET  Lecture_Hour = Lab_Hr -Lecture_Hour --AND THEN INSIDE THE TABLE IT WILL CALCULATE THE LEFT HOUR FOR LECTURE HOUR
--AND THEN CHANGE THE VALUE INSIDE LAB LECTURE COURSE  (LECTURE HOUR) 
SELECT Contact_Hour AS Lab_Hr   FROM  Course--TO ASSIGN THE VALUE OF LAB HOUR AS CONTACT HOUR 
INSERT INTO Lab_Lecture_Course(CID,Lab_Hr,Lecture_Hour,Equipments_needeed)
--TO INSERT TUPLES INSIDE THE TABLE
VALUES('CS02',2,5,'PC,PROJECTOR'),
		     ('CRP103',1,2,'Cryptographer');
SELECT*FROM Lab_Lecture_Course;--TO VIEW WHAT DATA WE HAVE ENTERED TO THIS SPECIFIC TABLE 

CREATE TABLE Student(--STUDENT COLUMN/ATTRIBUTES
	SID_ VARCHAR(15) PRIMARY KEY,
	DID VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES Department(DID),
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Sex CHAR NOT NULL,
	PhoneNumber NVARCHAR(20)  UNIQUE NOT NULL,
	email NVARCHAR(50) UNIQUE NOT NULL,
	Passwords NVARCHAR(50) NOT NULL
);
 SELECT SUM(Credit_Hour)
FROM COURSE
AS Total_Credits
SELECT*FROM[dbo].[Transcript]
SELECT*FROM Student--this is just a try i guess
UPDATE Student SET SELECT SUM( Credit_Hour) AS Total_Credits  FROM  Student
--TO INSERT TUPLES INTO THE TABLE
INSERT INTO Student(SID_,DID,FirstName,LastName,Sex,PhoneNumber,Email,Passwords)
VALUES('RCS/322/21','CS','Berne','Adamovicz','M','+964 464 320 2513',	'badamovicz0@netvibes.com','HjVfcJVE'),
			 ('RARC/454/21','ARC','Maddi','Klimov','F','+48 574 220 1769	','mklimov1@loc.gov','LdYNvR'),
			 ('RMT/326/20','MGT','Lorettalorna','Penrose','F','+212 985 381 8648','lpenrose5@ycombinator.com','xxZcE4kmOx'),
			 ('RCS/227/20','CS','Broddy','Alfonso','M',	'+7 655 365 0517	','balfonso6@homestead.com',	'YuBWYll'),
			 ('RIT/400/21','IT','Dannie','Fidler','F','+62 986 745 1417','dfidler7@plala.or.','jp	2yxbA63OISm');
SELECT*FROM Student;--TO VIEW THE DATA WE HAVE ENTERED IN THIS SPECIFIC TABLE

CREATE TABLE Graduate_Student(--GRADUATE STUDENT COLUMN/ATTRIBUTE
	SID_ VARCHAR(15)NOT NULL FOREIGN KEY REFERENCES Student(SID_),
	Degree_File NVARCHAR(100) NOT NULL
);
INSERT INTO Graduate_Student(SID_,Degree_File)--TO INSERT TUPLES INTO THE TABLE
VALUES('RCS/322/21','.pdf'),
			 ('RCS/227/20','.pdf');
SELECT*FROM Graduate_Student;--TO VIEW THE DATA WE HAVE ENTERED IN THIS SPECIFIC TABLE

CREATE TABLE Course_taken(--COURSE TAKEN COLUMN/ATTRIBUTE
	SID_ VARCHAR(15)NOT NULL FOREIGN KEY REFERENCES Student(SID_),
	TID VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES  Teacher(TID),
	CID VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES Course(CID),
	Years INT,
	Semester VARCHAR(3) NOT NULL,
	Mark	INT  NULL,
	Grade_Letter VARCHAR(4) NULL,
);
 UPDATE COURSE_TAKEN SET Grade_Letter = 
			(CASE
				 WHEN MARK >= 90 THEN 'A+'
				 WHEN MARK >= 83 THEN 'A'
				 WHEN MARK >= 80 THEN 'A-'
				 WHEN MARK >= 75 THEN 'B+'
				 WHEN MARK >= 70 THEN 'B'
				 WHEN MARK >= 65 THEN 'B-'
				 WHEN MARK >= 60 THEN 'C+'
				 WHEN MARK >= 55 THEN 'C'
				 WHEN MARK >= 50 THEN 'C-'
				 WHEN MARK >= 40 THEN 'D'
				 ELSE 'F'
				 END
				 );
INSERT INTO Course_taken(SID_,TID ,CID,Years ,Semester,Mark,Grade_Letter)--TO INSERT TUPLES INTO THE TABLE
VALUES('RIT/400/21','232','CS02',2013,	1,32,NULL),
			 ('RCS/322/21','922','HH101',2014,2,56,NULL),
			 ('RCS/227/20','453','HH101',2014,2,78,NULL),
			 ('RIT/400/21','922','HH101',2015,1,98,NULL),
			 ('RCS/322/21','453','M077',	2013,1,56,NULL),
			 ('RARC/454/21','453','M077',2013,2,78,NULL),
			 ('RMT/326/20','922','M077',2014,2,76,NULL),
			 ('RCS/227/20','691','CRP103',2013,1,65,NULL),
			 ('RCS/227/20','691','M51',2014,1,	87,NULL),
			 ('RCS/322/21','691','M51',2015,1,56,NULL);
SELECT*FROM Course_taken;--TO VIEW THE DATA WE HAVE ENTERED IN THIS SPECIFIC TABLE

CREATE TABLE Message_s(--MESSAGE_S COLUMN / ATTRIBUTE 
	TID VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES Teacher(TID),
	SID_ VARCHAR(15)NOT NULL FOREIGN KEY REFERENCES Student(SID_),
	SenderType CHAR,
	Datas NVARCHAR(100) NULL,
	TimeStamps TIMESTAMP NOT NULL
);
INSERT INTO Message_s(TID,SID_,SenderType,Datas, TimeStamps)--TO INSERT TUPLES INTO THE TABLE
VALUES( '232','RCS/322/21','S','.txt',DEFAULT),
			 ('691','RARC/454/21','T','.jpg',DEFAULT),
			 ('922','RMT/326/20','S','.csv',DEFAULT),
			 ('589','RCS/227/20','S','.mp4',DEFAULT),
			 ('346','RIT/400/21','T','.mp3',DEFAULT);
SELECT*FROM Message_s;--TO VIEW THE DATA WE HAVE ENTERED IN THIS SPECIFIC TABLE

CREATE TABLE Transfer_Student(--TRANSFER STUDENT COLUMN / ATTRIBUTES
	SID_ VARCHAR(15)NOT NULL FOREIGN KEY REFERENCES Student(SID_),
	T_CGPA FLOAT NOT NULL,
	Transcript_File NVARCHAR(100) NOT NULL
);
INSERT INTO Transfer_Student(SID_,T_CGPA,Transcript_File)--TO INSERT TUPLES INTO THE TABLE
VALUES('RCS/322/21',3.2,'.pdf'),
			 ('RARC/454/21',2.5,'.pdf');
SELECT*FROM Transfer_Student;--TO VIEW THE DATA WE HAVE ENTERED IN THIS SPECIFIC TABLE

CREATE TABLE Attendance(--ATTENDANCE COLUMN / ATTRIBUTE 
	SID_ VARCHAR(15)NOT NULL FOREIGN KEY REFERENCES Student(SID_),
	CID VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES Course(CID),
	TID VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES Teacher(TID),
	Dates VARCHAR(20) NOT NULL,
	Present BIT NOT NULL
);
INSERT INTO  Attendance(SID_,TID,CID,Dates,Present)--TO INSERT TUPLES INTO THE TABLE
VALUES('RIT/400/21','232','CS02','12/28/2021',1),
			 ('RCS/322/21','922','HH101','10/2/2022',0),
			 ('RCS/227/20','453','HH101','11/13/2022',1),
			 ('RIT/400/21','922','HH101','8/11/2022',0),
			 ('RCS/322/21','453','M077',	'9/25/2022',0),
			 ('RARC/454/21','453','M077','4/27/2022',0),
			 ('RMT/326/20','922','M077','11/23/2022',0),
			 ('RCS/227/20','691','CRP103','4/30/2022',1),
			 ('RCS/227/20','691','M51','5/20/2022',0),
			 ('RCS/322/21','691','M51','1/13/2022',0);
SELECT*FROM Attendance;--TO VIEW THE DATA WE HAVE ENTERED IN THIS SPECIFIC TABLE

CREATE TABLE Retaken(--RETAKEN COLUMN / ATTRIBUTE 
	SID_ VARCHAR(15)NOT NULL FOREIGN KEY REFERENCES Student(SID_),
	CID VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES Course(CID),
	TID VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES Teacher(TID),
	Previous_Grade VARCHAR(3) NOT NULL
);
INSERT INTO Retaken(SID_	,TID,CID,	Previous_Grade)--TO INSERT TUPLES INTO THE TABLE
VALUES('RCS/322/21','453','M077','D'),
			 ('RIT/400/21','232','CS02','D'),
			 ('RCS/227/20','691','M51','F');
SELECT*FROM Retaken;--TO VIEW THE DATA WE HAVE ENTERED IN THIS SPECIFIC TABLE

CREATE TABLE Transcript(--TRANSCRIPT COLUMN / ATTRIBUTES
	SID_ VARCHAR(15)NOT NULL FOREIGN KEY REFERENCES Student(SID_),
	GPA FLOAT ,
	CGPA FLOAT 
);

INSERT INTO Transcript(SID_,GPA,CGPA)--TO INSERT TUPLES INTO THE TABLE
VALUES('RCS/322/21',0.00,0.00),
		     ('RARC/454/21',0.00,0.00),
			 ('RMT/326/20',0.00,0.00),
			 ('RCS/227/20',0.00,0.00),
			 ('RIT/400/21',0.00,0.00);
SELECT*FROM Transcript;--TO VIEW THE DATA WE HAVE ENTERED IN THIS SPECIFIC TABLE

ALTER TABLE COURSE_TAKEN
ADD GRADE_VALUE FLOAT

UPDATE Course_taken SET GRADE_VALUE = 
						(CASE
							WHEN Grade_Letter = 'A+' THEN 4.00
						    WHEN Grade_Letter = 'A' THEN 4.00
							WHEN Grade_Letter =  'A-' THEN 3.75
							WHEN Grade_Letter = 'B+' THEN 3.50
							WHEN Grade_Letter = 'B' THEN 3.00
							WHEN Grade_Letter = 'B-' THEN 2.75
							WHEN Grade_Letter=  'C+' THEN 2.50
							WHEN Grade_Letter=  'C' THEN 2.00
							WHEN Grade_Letter=  'C-' THEN 1.50
							WHEN Grade_Letter=  'D' THEN 1.00
							ELSE 0.00
							END
							);


SELECT * FROM Transcript;
SELECT * FROM Course_taken;
SELECT * FROM Course;


UPDATE Transcript
SET GPA = (SELECT (SUM(t.GRADE_VALUE * c.Credit_Hour) / SUM(C.Credit_Hour))
FROM Student s
INNER JOIN Course_taken t ON s.SID_ = t.SID_ 
INNER JOIN Course c ON t.CID = c.CID
WHERE Transcript.SID_ = s.SID_)

UPDATE Transcript
SET CGPA = (SELECT AVG(GPA)
FROM Transcript AS t
WHERE Transcript.SID_ = t.SID_)