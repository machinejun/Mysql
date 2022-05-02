-- C R U D (dbms의 핵심)

-- C : 데이터를 생성 insert 구문
use shopdb;
desc membertbl;

insert into memberTbl values("Tang", "탕탕이", "경기도 부천시");
insert into membertbl values('Han',"한주연","부산시 해운대구");
insert into membertbl(memberAddress, membername, memberid) values('서울시 상암동','지운이','Jee');

-- 오류구문 membertbl에서 mebmerid & membername은 not null로 설계했기 때문에 
-- insert into membertbl(memberid) values('Nugouri');
insert into membertbl(membername, memberid) values('너구리', 'Nugouri');

-- 한건에 대한 데이터 조회를 어떻게 할까 ?
select * from membertbl where memberId = "Jee";

-- 쿼리문은 아래와 같이 써야 이쁨(조회 + 조건절)
select membername
from membertbl
where memberid = "Dang";

-- 한건에 대한 데이터 삭제
delete 
from membertbl
where memberid = "Tang";

-- 전체에 대한 데이터 삭제
delete
from membertbl;
-- 얘도 데이터 날리는기능
truncate membertbl;

-- 한 건의 데이터 수정
update membertbl
set membername = '홍길동'
where memberid = 'Han';

-- 전체 데이터에 대한 값 수정
update membertbl
set memberaddress = null;

select * from membertbl;
-- --------------------------------------
desc producttbl;
select * from producttbl;
-- 문제 1 >> producttbl 의 데이터를 3건 입력해 주세요
insert into producttbl values(1, "선풍기", 80, "삼성전자", 10);
insert into producttbl values(2, "세탁기", 70, "LG", 9);
insert into producttbl values(3, "스마트폰", 100, "삼성전자", 20);

-- 검색 2 >>
select productid, productname
from producttbl
where productid = '1';

select productid, productname
from producttbl
where company = '삼성전자';

select productname, cost
from producttbl
where company = '삼성전자';

-- 수정 3 >>
update producttbl
set productname = 'TV'
where productid = 3;

-- 삭제 4>>
delete 
from producttbl
where productId = '2';

alter table producttbl drop makedate;

-- char vs varchar
-- char(8) = 8글자 이하  >>> '안녕000000'
-- varchar(8) = 가변배열 >>> '안녕'
