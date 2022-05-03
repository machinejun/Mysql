use shopdb;

select * from userdb;
select * from buytbl;

-- inner join
select *
from usertbl
inner join buytbl
on usertbl.username = buytbl.username;

-- inner join 2
select a.userName, a.addresss, a.mobileNum, b.prodName, b.price, b.amount
from usertbl as a
inner join buytbl as b
on a.username = b.username;

-- as : 별칭 >> usertbl = a

-- left join
select *
from usertbl as u
left join buytbl as b
on u.username = b.username;

-- usertbl 고객 등록
select * from usertbl;
insert into usertbl values('야스오', 2000, '여수', '010-1234-1234');
insert into buytbl values('티모', '컴퓨터', 100, 1);
-- 구매 테이블을 생성할 때 외래키에 대한 제약을 생상했기 때문에 티모는 안들어간다.
-- 하지만 구매 테이블을 생성할 때 외래키(FK)를 제약하지 않았다면 insert 가능하다.


-- left join 2
select *
from usertbl as u
left join buytbl as b
on u.username = b.username
where b.username is not null;

-- left join 2 복습
select *
from buytbl as b
left join usertbl as u
on b.username = u.username;

select *
from buytbl as b
left join usertbl as u
on b.username = u.username
where u.username is not null;

-- right join 1
select u.username, b.prodName, b.price, b.amount
from usertbl as u
right join buytbl as b
on u.username = b.username;

-- 곱 집합 cross join 1
select *
from usertbl as u
cross join buytbl as b
on u.username = b.username;

-- 곱 집합 cross join 2
select a.userName, a.addresss, a.mobileNum, b.prodName, b.price, b.amount
from usertbl as a
cross join buytbl as b
on a.username = b.username;



