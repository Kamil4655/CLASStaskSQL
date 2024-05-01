--USE AB106Practise

CREATE TABLE Users(
	Id INT PRIMARY KEY IDENTITY,
	Username VARCHAR(20)NOT NULL,
	Name NVARCHAR(15),
	Age INT Check(Age>=16)
)
INSERT INTO Users VALUES ('JAKE PAUL','JAKE875',20)

CREATE TABLE Posts(
	Id INT PRIMARY KEY IDENTITY,
	Text NVARCHAR(1000)NOT NULL,
	LikeCount INT CHECK(LikeCount>=0),
	UserId INT REFERENCES Users(Id)
)
drop table Users
drop table Posts


INSERT INTO Posts VALUES('CLASH', 2, 2)

SELECT * FROM Users
SELECT * FROM Posts
SELECT u.Name AS Username,p.Text AS Post,p.LikeCount
FROM Users AS u
INNER JOIN Posts as p 
ON u.Id=p.UserId

