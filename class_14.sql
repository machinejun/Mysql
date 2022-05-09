-- 서브쿼리 2
use employees;

-- employees vs dept_emp  >> 1 : N 관계
select * from dept_emp;
desc dept_emp;
select * from employees limit 30;

select * from departments; -- departments vs dept_emp >> 1 : N 관계
desc departments;
desc dept_manager; -- employees vs dept_manger >> 1 : N

select *, dept_no as '뽑아야 하는 값'
from departments as a
where a.dept_name = 'development'

-- 중첩 서브쿼리
-- dept_emp 테이블에서 development인 emp_no필드와 dept_no를 출력하세요
desc dept_emp;
desc departments;
desc titles;
select * from titles;

select de.*
from dept_emp as de
inner join (select * 
				from departments 
                where dept_name = 'development') as d
on de.dept_no = d.dept_no;

-- 문2. employees 테이블에서 현재 development 메니저인 직원만 조회
select dept_emp.emp_no , dept_no
from dept_emp
inner join titles
on dept_emp.emp_no = titles.emp_no
and titles.title = 'manager'
where dept_emp.dept_no = ( select dept_no from departments where dept_name = 'development');

select e.emp_no, first_name, last_name, de.dept_no
from employees as e
inner join dept_emp as de
on e.emp_no = de.emp_no
where de.dept_no = (select dept_no
						from departments
						where dept_name = 'development');

select *
from employees as A
where a.emp_no = ( select emp_no
					from dept_manager
                    where to_date = '9999-01-01'
                    and dept_no = 'd005');
                    
-- 단일행 결과 집합 나와서 외부 쿼리인 emp_no 조건식으로 처리가 된다.
-- 서브쿼리를 사용할때 단일행 집합으로 만들어주는 것이 편하다.

select *
from employees as A
where a.emp_no = ( select emp_no
					from dept_manager
                    where to_date = '9999-01-01'
                    and dept_no = (select dept_no 
									from departments 
                                    where dept_name = 'development'
                                    )
					);

-- >> d005 => development (값으로 변경해서 쿼리문을 완성해 주세요)

select emp_no
from dept_manager
where to_date = '9999-01-01';

select *
from dept_manager
where to_date = '9999-01-01' and dept_no = 'd005';

select dept_no
from departments
where dept_name = 'development';

/*
	 다중행 서브쿼리
     결과값이 2건 이상 출력되는 것을 말한다.
     다중 행 서브쿼리는 쿼리에 결과가 여러건 출력되기 때문에
     단일행 연산자를 사용할 수 없다.
     
     if 다중 행 결과값을 사용해야 할 경우 별도의 연산자를 사용해주어야 한다. ex in()
*/

select * from employees;
select * from titles;

select A.emp_no, A.first_name, B.title
from employees as A
inner join titles as B
on A.emp_no = B.emp_no
where B.title = 'manager'
and B.to_date = '9999-01-01';

-- 인라인 뷰로 결과를 출력
select A.emp_no, A.first_name, B.title
from employees as A, (select * from titles) as B
where A.emp_no = B.emp_no;

-- 문제 1 직원테이블에서 manager만 출력하세요
select A.emp_no, A.first_name, B.title
from employees as A
inner join titles as B
on A.emp_no = B.emp_no
where B.title = 'manager'
and B.to_date = '9999-01-01';

-- 문제 2 인라인 뷰로 출력

-- 나의 답
select A.emp_no, A.first_name, B.title
from employees as A, (select * from titles) as B
where A.emp_no = B.emp_no
and B.title = 'manager'
and B.to_date = '9999-01-01';

-- 스칼라 서브쿼리 select절에 서브 쿼리 (컬럼처럼 사용하기 위해서)
-- join문 대체 표현식으로 자주 사용하지만 성능면에서 좋은 편이 아니다.

select *, (select dept_name
			from departments as b
            where a.dept_no = b.dept_no) as '부서명'
from dept_manager as a
where to_date = '9999-01-01';

-- 문제 : employees 테이블에서 emp_no, first_name, secon_name, title명 
-- 스칼라 서브쿼리를 사용해서 결과를 조회

select emp_no, 
		concat(first_name,"_" ,last_name) as '이름',
        (select title 
			from titles as t 
			where t.emp_no = a.emp_no
            group by emp_no) as '부서명' 
from employees as a
group by emp_no;

select *
from employees as a
inner join titles as t
on a.emp_no = t.emp_no;

select * from dept_emp;

select s.emp_no, salary, d.dept_no, s.max(salary)
from (select emp_no, salary
		from salaries
        where to_date = '9999-01-01') as s
inner join dept_emp as d
on s.emp_no = d.emp_no
group by dept_no
order by salary desc, dept_no asc;

select * from departments;

-- 부서별로 가장 높은 연봉을 받는 사람을 구하세요




select e.emp_no, last_name, salary
from employees as e 
inner join salaries as s
on e.emp_no = s.emp_no
where s.to_date = '9999-01-01' -- as '직원별 연봉'
and e.emp_no = d.emp_no






