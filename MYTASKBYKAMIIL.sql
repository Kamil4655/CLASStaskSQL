CREATE DATABASE CLASSTASK
USE CLASSTASK

CREATE TABLE Students(
Id INT IDENTITY PRIMARY KEY,
Name NVARCHAR (15) NOT NULL,
Surname NVARCHAR (20) NOT NULL,
Age INT CHECK (Age>=0),
Point INT CHECK (Point>=0 AND Point<=100)
)

INSERT INTO Students 
VALUES
('Anar','Amanli',19,91),
('Kamil',N'Qəhrəmanov',20,100),
('John','Wick',49,71)

DROP TABLE Subjects

CREATE TABLE Subjects(
Id INT IDENTITY PRIMARY KEY,
Name NVARCHAR (25) NOT NULL,
)

INSERT INTO Subjects
VALUES
('Proqramlas'),
('Tarix'),
('Riyaziyyat'),
('Fizika'),
('Kimya'),
('Edebiyyat')

CREATE TABLE StudentSubjects(
StudentId INT NOT NULL REFERENCES Students(Id),
SubjectId INT NOT NULL REFERENCES Subjects(Id)
)

INSERT INTO StudentSubjects
VALUES
(1,1),
(1,2),
(2,3),
(2,1);


CREATE VIEW GetStudentsSubjects
AS
SELECT s.Name +''+ s.Surname AS FullName,sub.Name AS Subject
FROM Students AS s
JOIN StudentSubjects AS ss
ON s.Id = ss.StudentId
JOIN Subjects as sub
ON ss.SubjectId = sub.Id

SELECT FullName, COUNT(Subject) FROM GetStudentsSubjects
GROUP BY FullName

SELECT s.Name + ' ' + s.Surname AS FullName, COUNT(ss.SubjectId) 
FROM Students AS s
JOIN StudentSubjects AS ss 
ON s.Id = ss.StudentId
JOIN Subjects AS sub 
ON ss.SubjectId = sub.Id
GROUP BY s.Name, s.Surname;