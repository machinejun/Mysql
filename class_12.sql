use employees;

select * from employees limit 10;

select * FROM departments;
select * from dept_emp;
select * from dept_manager;
select * from salaries;
select * from titles;

-- 합계 함수
-- 문제 1. 전체 직원수 as 전체 직원수
-- 2. 제일 먼저 입사한 일자() as 최초 고용일자, 제일 마지막 입사일자 as 최근 고용일자
select 
	count(emp_no) as '전체 직원수', 
    min(hire_date) as '최초 고용일자' , 
    max(hire_date) as '최근 고용일자'
from employees;

-- gender로 그룹핑
select gender, count(gender)
from employees
group by gender;

-- 고용일자로 그룹핑
select *, count(*) as '동기 수'
from employees
group by hire_date, gender
order by hire_date asc;


--
select * from salaries;
desc salaries;

-- 급여 테이블 총 건수, 총 급여, 평균 급여, 최고연봉자 급여, 최소 연봉자 급여
select 
	count(*) as '총 건수' , 
	format(sum(salary), '###,###')as '총 급여' , 
	round(avg(salary), 2) as '평균 급여', min(salary) as '최고연봉자' , 
	max(salary) as '최소연봉자' 
from salaries;

-- 데이터 검증
select max(salary) from salaries;

-- having 절 연습
select *, count(emp_no) as 횟수
from salaries
group by emp_no
having count(emp_no) >= 10
order by emp_no asc
limit 30;

-- 문제
select * from titles;
select count(*) from titles;
select * from dept_emp;
select * from departments;


-- 10만명 이상 사용하고 있는 직함의 이름과 직원의 수를 출력하세요
select title, count(emp_no) as 직원수
from titles
group by title
having count(emp_no) >= 100000;

-- 5만명 이상 근무하고 있는 부서의 번호와 부서 소속사원의 수를 출력
select *, count(emp_no) as 직원수
from dept_emp as de
group by dept_no
having count(emp_no) >= 50000

-- 현재 근무중인 사람
select *
from salaries
inner join employees
on salaries.emp_no = employees.emp_no
where to_date = '9999-01-01'

-- 퇴사자
select *
from dept_manager
where to_date <> '9999-01-01';

select max(salary)
from salaries;

-- 재직자 중에서 가장 연봉이 높은 10명의 직원이름과 연봉을 출력해주세요
select e.emp_no , concat(first_name,"  " ,last_name) as 'name', salary
from employees as e
inner join salaries as s
on e.emp_no = s.emp_no
where to_date = '9999-01-01'
order by salary desc
limit 10;

-- 
select d.dept_no
from dept_emp as d
inner join salaries as s 
on d.emp_no = s.emp_no
where s.to_date = '9999-01-01'
group by d.dept_no

-- order by 연봉 desc;


use shopdb;
select * from membertbl;
delete from membertbl where memberId= 'hello';


