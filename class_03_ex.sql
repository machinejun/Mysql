use shopdb_1;

-- table 생성
create table usertbl(
	userid varchar(8),
    username varchar(5),
    userAddress varchar(20),
    userphoneNum int,
    usergrade char(1),
    primary key(userid)
);
create table buytbl(
	userid varchar(8)
	
);

create table producttbl(

);

-- 연관관계 생성

-- CRUD 연습

-- 