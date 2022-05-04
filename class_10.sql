--

create database shop_db;
use shop_db;

create table shop_db.product(
	id tinyint not null,
    p_name varchar(30) not null,
    created date,
    company varchar(30)
);

-- index : create index(Unique index)
-- 검색속도를 빠르게 하기 위해서 사용

create index idx_product_name
on product(p_name);
show Index from product;

-- 데이터 넣기
select * from product group by p_name;
desc product;


insert into product values(1, '세탁기', '2020-12-12', '삼성');
insert into product values(2, '냉장고', now(), 'LG');
insert into product values(3, '모니터', curdate(), 'LG');
insert into product values(4, '컴퓨터', curdate(), '소니');

-- 컬럼 추가
alter table product add input_time timestamp;

-- 가상 테이블(뷰 테이블) 생성하기 >> 기존 테이블을 참조하는 개념이다.
create view product_view 
as select p_name, created, company
from product;

select * from product_view;

-- 데이터 삭제 >> 뷰테이블 삭제 >> 기존테이블에도 영향을 준다.
delete from product_view where p_name = '컴퓨터';
-- drop database shop_db;
show databases;

-- index 조회하는 방법
show index from product;

-- index 삭제
alter table product
drop index idx_product_name;

-- index 수정(추가확인)
alter table product ;

-- table 복사
select * from product_2;

create table product_2 select * from product group by p_name;

-- 집계 함수

-- groub by 
use shopdb;
select * from buytbl;
select userName
from buytbl
group by username;

select *
from buytbl
group by price;

select *
from buytbl
group by amount;

-- 이름으로 묶고 amount 3보다 큰사람들을 출력하라
select *
from buytbl
where amount >= 3
group by username;

-- 집계 함수
select count(*) as 판매횟수
from buytbl;

select username, sum(price) as '구매 금액'
from buytbl;

-- 집계함수화 그룹바이 
select username, sum(price) as '구매 금액'
from buytbl
group by username;

select username, count(*) as 'total'
from buytbl
group by username;



