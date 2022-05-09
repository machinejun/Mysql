use shopdb;
select * from usertbl;
SELECT * FROM memberTBL WHERE memberId IN('jsa', 'Tang');
delete from buytbl where prodName ='운동화';
insert into buytbl values('이승기','운동화',100,1);

select addresss, prodName, max(amount)
from usertbl as A
left join buytbl as B 
on A.userName = B.userName
where A.addresss = '대구'
group by addresss;





