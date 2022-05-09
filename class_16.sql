use employees;
desc departments;
desc dept_emp;
desc dept_manager;
desc employees;
desc salaries;
desc titles;

select * from employees;
select * from salaries;
select * from titles;

-- 현재 근무하는 직원 정보 ( 직원번호, 이름, 성별, 근무 부서, 직함 ) <<< 직원 넘버로 찾기
select e.emp_no, concat(first_name," ",last_name) as 'Name', gender, d.dept_name, title
from employees as e 
inner join dept_emp as de
on e.emp_no = de.emp_no
inner join departments as d
on de.dept_no = d.dept_no
inner join titles as t
on e.emp_no = t.emp_no
where de.to_date = '9999-01-01'
	and e.emp_no = 10010 -- 입력 칸
order by emp_no;

-- 부서별 최고 연봉자 이름 << 부서 코드로 찾기
select s.emp_no, max(salary), de.dept_no, dept_name, e.e_name as 'Name'
from salaries as s,
	(select dept_no, dept_name from departments) as d,
    (select emp_no, dept_no from dept_emp) as de,
    (select emp_no, concat(first_name, " ",last_name) as e_name from employees) as e
where s.to_date = '9999-01-01'
	and  s.emp_no = de.emp_no
	and de.dept_no = d.dept_no
    and s.emp_no = e.emp_no
    and de.dept_no = 'd001' -- 입력 칸
group by de.dept_no;

-- 부서별 직원수를 출력
select dept_no, count(de.emp_no) as "직원 수"
from employees as e,
	(select emp_no, dept_no, to_date from dept_emp) as de
where e.emp_no = de.emp_no
	and to_date = '9999-01-01'
    and dept_no = 'd006' -- 입력 칸
group by dept_no;

-- salary 를 연봉으로 쳤을 때 직원id로 월봉, 직급 조회
select s.emp_no, round((max(salary)/12), 0) as 'month_salary' , t.title as "직급"
from salaries as s
inner join titles as t
on s.emp_no = t.emp_no
where s.emp_no = '10001';

-- X년 이상 근무자가 가장 많은 부서
select de.dept_no, count(count_year) as "인원 수", d.dept_name
from dept_emp as de,
	(select emp_no, count(s.emp_no) as count_year
		from salaries as s
		group by s.emp_no
		having count_year >= 18 ) as year_table,
	(select dept_name, dept_no from departments) as d
where de.emp_no = year_table.emp_no
	and de.dept_no = d.dept_no
group by de.dept_no;










    
    
    
    