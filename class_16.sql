use employees;
desc departments;
desc dept_emp;
desc dept_manager;
desc employees;
desc salaries;
desc titles;


-- 현재 근무하는 직원 정보 ( 직원번호, 이름, 성별, 근무 부서, 직함 )
select e.emp_no, concat(first_name," ",last_name) as 'Name', gender, d.dept_name, title
from employees as e 
inner join dept_emp as de
on e.emp_no = de.emp_no
inner join departments as d
on de.dept_no = d.dept_no
inner join titles as t
on e.emp_no = t.emp_no
where de.to_date = '9999-01-01'
order by emp_no;

select e.emp_no, concat(first_name," ",last_name) as 'Name', gender, dept_name, title
from employees as e, 
	(select emp_no, dept_no from dept_emp where de.to_date = '9999-01-01') as de,
	(select dept_no, dept_name from departments) as d,
    (select emp_no, title from titles) as t
where e.emp_no = de.emp_no
and e.emp_no = t.emp_no
and de.dept_no = d.dept_no;

-- 부서별 최고 연봉자 이름