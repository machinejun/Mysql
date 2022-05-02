-- usertbl, buytbl 만들기
use shopdb;
-- 고객테이블 생성
create table userTbl(
	userName char(3) not null,
    birthYear int not null,
    addresss char(2) not null,
	mobileNum char(12),
    primary key (userName)
);

-- 필드 또는 컬럼 수정
alter table usertbl 
modify mobileNum char(13);
desc usertbl;

-- 구매 테이블( 외래키 생성 )
create table buyTbl(
	userName char(3) not null,
    prodName char(3) not null,
    price int not null,
    amount int not null,
    foreign key(username) references userTbl(username)
);


-- usertbl에 데이터 입력하기
insert into usertbl values('이승기',1987,'서울','010-1234-1234');
insert into usertbl values('이순신',1911,'부산','010-1222-2222');
insert into usertbl values('홍길동',1999,'대구','010-3333-1113');

select * from usertbl;
select * from buytbl;

-- buytable  테이터 입력
insert into buytbl values(
	'이승기','운동화',50,1
);
insert into buytbl values(
	'이승기','노트북',150,1
);
insert into buytbl values(
	'홍길동','책',10,5
);
insert into buytbl values(
	'홍길동','모니터',200,2
);
insert into buytbl values(
	'이순신','청바지',40,1
);
insert into buytbl values(
	'이순신','책',10,3
);


