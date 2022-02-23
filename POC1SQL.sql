
create database POC1Sql;
use POC1Sql;

-- CREATING TABLES 
create table author (
id int primary key,
name varchar(100)
);

create table post(
id int primary key,
name varchar(100),
createdts datetime,
authorid int, foreign key (authorid) references author(id)
);

create table comment (
id int primary key,
content varchar(1000),
postid int, foreign key (postid) references post(id) ,
createdts datetime,
userid int, foreign key (userid) references user(id) 
);

create table user(
id int primary key,
name varchar(100)
);

desc author;
desc post;
desc comment;
desc user;
-- --------------------------------------
-- INSERT VALUES TO TABLES 
insert into author values
(100,"James Bond"),
(101,"James"),
(102,"vasu"),
(103,"ram"),
(104,"veer"),
(105,"karan"),
(106,"Bama");

select * from author;

insert into post values
(1,"The Greate Education -Post1","2000-05-03",100),
(2,"Army -post2","2002-06-03",101),
(3,"Nature Beauty -post3","1998-05-03",100),
(4,"Nature Treenary -Post4","2010-02-09",103),
(5,"flowers Beauty -post5","2021-05-03",105);

select * from post;

insert user values
(501,"Raju"),(502,"Guru"),(503,"Bheem"),(504,"Karan"),(505,"Veerendra"),
(506,"Varun"),(507,"Vinay"),(508,"Kumar"),(509,"Vimal"),(510,"Raghav"),
(511,"veena"),(512,"soundarya"),(513,"meghana"),(514,"sinchana"),(515,"prajwala"),
(516,"Mouna"),(517,"punya"),(518,"Kavya"),(519,"Megha"),(520,"Bharath");

select * from user;

insert into comment values
(201,"very Beautyful flowers",5,"2020-04-04",501),
(202,"Education is power of life",3,"2020-05-04",501),
(203,"Look deep into nature, and then you will understand everything better.",3,"2020-05-09",505),
(204,"The more that you read, the more things you will know, the more that you learn, the more places you’ll go",1,"2021-01-01",504),
(205,"Education is one thing no one can take away from you.",1,"2021-02-01",502),
(206,"Only the best of friends and the worst of enemies visit us.",2,"2021-02-03",507),
(207,"Education is the key that unlocks the golden door to freedom.",1,"2021-03-09",506),
(208,"A tree is our most intimate contact with nature.",4,"2021-03-12",503),
(209,"Education is the key that unlocks the golden door to freedom.",3,"2021-04-09",504),
(210,"Nature does not hurry, yet everything is accomplished.",3,"2021-05-11",508),
(211,"Woderfull education.",1,"2021-05-12",509),
(212,"Change is the end result of all true learning",1,"2021-06-10",510),
(213,"Choose only one master—nature.",3,"2021-06-24",507),
(214,"The roots of education are bitter, but the fruit is sweet.",1,"2021-07-12",512),
(215,"The learning process continues until the day you die.",1,"2021-08-20",514),
(216,"I regret I have but one life to give for my country.",2,"2021-08-23",514),
(217,"Love is the flower you’ve got to let grow.",5,"2021-08-24",516),
(218,"Education is the vaccine of violence",1,"2021-08-24",515),
(219,"Colors are the smiles of nature.",3,"2021-09-10",518),
(220,"Learning is not compulsory… Neither is survival.",1,"2021-09-10",517),
(221,"Land really is the best art.",3,"2021-09-15",519),
(222,"Change is the end result of all true learning.",1,"2021-09-20",520),
(223,"Spring is nature’s way of saying, ‘Let’s party!’ ",3,"2021-09-20",506),
(224,"A weed is no more than a flower in disguise",3,"2021-09-25",507),
(225,"The learning process continues until the day you die.",1,"2021-09-26",503),
(226,"Nature is loved by what is best in us. ",1,"2021-09-26",511),
(227,"The goal of life is living in agreement with nature.",3,"2021-09-27",510),
(228,"By discovering nature, you discover yourself",3,"2021-09-28",506),
(229,"The ocean is a mighty harmonist.",3,"2021-09-28",514),
(230,"Education is not preparation for life; education is life itself. –",1,"2021-10-01",515),
(231,"Deep in their roots, all flowers keep the light. ",3,"2021-10-10",518),
(232,"Nature is not a place to visit. It is home.",3,"2021-10-15",519);


delete from comment;
SET SQL_SAFE_UPDATES = 0;

select * from comment ;
select id from author where name="James Bond";
SELECT * FROM ( SELECT * FROM comment  ORDER BY createdts DESC LIMIT 5 )Var1 ORDER BY createdts ASC;

-- QUERY to display list of Posts with latest 10 comments of post authored by 'James Bond'.

select * 
from post p left join comment c on (p.id=c.postid) 
and 
authorid in(select id 
		  from author 
          where name="James Bond")
ORDER BY c.createdts DESC LIMIT 10;


-- QUERY to display list of Posts with latest 10 comments of each post authored by 'James Bond'.

select *
from  post p
left join comment c on 
    (p.id=c.postid)
    and 
    c.id >
    (select id from comment c
        where postid=p.id 
        ORDER BY c.createdts DESC LIMIT 10,1),author a
where a.id=p.authorid and authorid in(select id from author where name="James Bond");









