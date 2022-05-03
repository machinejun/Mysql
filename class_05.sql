-- mysql function

-- mysql String function
select ascii('b');
select char_length("My Sql Test") as 문자길이;
select char_length("홍길동") as 이름;
select concat('boot', 'class', '100%') as class_name;
select concat_ws('->', 'boot', 'class', '100%') as class_name;
-- 문자열 목록 내에서 q를 검색할 수 있다.
select find_in_set('q', 's,q,l');

-- 숫자 형식인 "#.##.##.##"(소숫점 2자리 반올림)으로 지정한다.
select format(250500.5634, 2);

-- 대소문자 변환
select lcase('HELLO JAVA');
select Ucase('hello java');

-- 공백 제거
select trim('        M Y S Q L   ');
select replace('     aaa 11      ', ' ', '');



