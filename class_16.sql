USE employees;
DESC departments;
DESC dept_emp;
DESC dept_manager;
DESC employees;
DESC salaries;
DESC titles;

SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM departments;

-- 현재 근무하는 직원 정보 ( 직원번호, 이름, 성별, 근무 부서, 직함 ) <<< 직원 넘버로 찾기
SELECT e.emp_no, CONCAT(first_name," ",last_name) AS 'Name', gender, d.dept_name, title
FROM employees AS e 
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE de.to_date = '9999-01-01'
	AND e.emp_no = 10010 -- 입력 칸
ORDER BY emp_no;

-- 부서별 최고 연봉자 이름 << 부서 코드로 찾기
SELECT s.emp_no, MAX(salary), de.dept_no, dept_name, e.e_name AS 'Name'
FROM salaries AS s,
	(SELECT dept_no, dept_name FROM departments) AS d,
    (SELECT emp_no, dept_no FROM dept_emp) AS de,
    (SELECT emp_no, CONCAT(first_name, " ",last_name) AS e_name FROM employees) AS e
WHERE s.to_date = '9999-01-01'
	AND  s.emp_no = de.emp_no
	AND de.dept_no = d.dept_no
    AND s.emp_no = e.emp_no
    AND de.dept_no = 'd001' -- 입력 칸
GROUP BY de.dept_no;

-- 부서별 직원수를 출력
SELECT dept_no, COUNT(de.emp_no) AS "직원 수"
FROM employees AS e,
	(SELECT emp_no, dept_no, to_date FROM dept_emp) AS de
WHERE e.emp_no = de.emp_no
	AND to_date = '9999-01-01'
    AND dept_no = "d001"
GROUP BY dept_no;

-- salary 를 연봉으로 쳤을 때 직원id로 월봉, 직급 조회
SELECT s.emp_no, ROUND((MAX(salary)/12), 0) AS 'month_salary' , t.title AS "직급"
FROM salaries AS s
INNER JOIN titles AS t
ON s.emp_no = t.emp_no
WHERE s.emp_no = '10001';

-- X년 이상 근무자가 가장 많은 부서
SELECT 
    de.dept_no, COUNT(count_year) AS '인원 수', d.dept_name
FROM
    dept_emp AS de,
    (SELECT 
        emp_no, COUNT(s.emp_no) AS count_year
    FROM
        salaries AS s
    GROUP BY s.emp_no
    HAVING count_year >= 10) AS year_table,
    (SELECT 
        dept_name, dept_no
    FROM
        departments) AS d
WHERE
    de.emp_no = year_table.emp_no
        AND de.dept_no = d.dept_no
GROUP BY de.dept_no;












    
    
    
    