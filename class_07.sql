-- Mysql Numberi Function
select ABS(-252.2);

select *
from buytbl;

-- 합계
select sum(price) as 합계
from buytbl;

-- 평균
select *, avg(price) as 평균값
from buytbl;

-- 올림 처리
select ceil(25.12);

-- 반올림 처리
select round(134.623);
select round(134.623, 1) as '소숫점 첫번째 자리까지';

-- 버림 처리
select floor(25.81);

-- 함수 안에 함수 가능
select ceil(round(10.25 - 5.16) + 5.84);

-- max 값
select max(price)
from buytbl;

-- min 값
select min(price)
from buytbl;



-- 서브 쿼리 >> 쿼리문안에 쿼리문 ( 3가지 ) >> 수행의 속도가 늦어질수 있다.
select *, (select sum(price) from buytbl) as 합계
from buytbl;

select *, (select avg(price) from buytbl) as 평균값
from buytbl;

-- 문제 user or buy 테이블을 사용해서 문제 만들어주세요
-- buytbl에서 총 매출과 전체 평균을 구하세요 평균은 1의 자리에서 반올림 해주세요
select sum(amount * price) as '총 매출', round(avg(amount * price), 1) as '전체 평균'
from buytbl;

select * from usertbl;
select * from buytbl;

select b.userName
from buytbl as b;

select b.username, (select (amount* price) as 합계 from buytbl) 
from buytbl as b
group by b.username;


