-- 문제 1번 shopdb_1 데이터 베이스 생성
create database shopdb_1;
use shopdb_1;
-- 문제 2번 memberTBL  테이블 생성
create table memberTBL(
	memberId char(5) not null,
    memberName char(4) not null
);
-- drop table memberTBL;
select memberId from membertbl;
-- 문제 3번 produtTBL 생성
create table productTBL(
	productId int not null,
    productName char(5) not null,
    CompanyName char(10) not null,
    productType char(6),
    primary key(productId)
);
select productId, productName from producttbl;
-- 문제 4번 (간단한 테이블 생성 필드 2개 이상)
create table coffee(
	coffeeName char(10) not null,
    coffeePrise int not null,
    coffebrand char(8),
    beanOrigin char(10),
    preference int,
    primary key(coffeeName)
);

select * from coffee;
desc coffee;
-- 문제 5번 (간단한 테이블 생성 필드 3개 이상 + primary key)

