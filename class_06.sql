
-- 50 이상 구매한 고객의 이름과 사용 금액을 보여주세요

select a.userName, (b.price * b.amount) as total, a.addresss
from usertbl as a
inner join buytbl as b
on a.username = b.username
where b.price > 50;

select concat_ws('가 구매한 ', u.userName, b.prodName) as 'list', b.amount, b.price
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;

select *, find_in_set('홍길동', u.userName) as 'findgildong' 
from usertbl as u
inner join buytbl as b
on u.userName = b.userName;

select u.userName
from usertbl as u
