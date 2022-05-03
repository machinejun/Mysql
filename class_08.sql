-- MySql Date Function
-- 현재 날짜를 출력하는 함수(년 월 일)


select curdate();
select current_date();

-- 현재 시간을 출력하는 함수
select curtime();
select current_time();

-- 일자를 반환하는 함수
select day('2017-06-15');
select day(curdate());

-- 주 단위를 계산할 때
select week('2017-06-15');
select week(curdate());

-- 1주일 부터 월요일이 0, 화 1, 수 2 .......
select weekday('2017-06-15');
select weekday(curdate());

-- 다 뽑아다 줌
select now();

-- 시스템 시간
select sysdate();

-- 문자열을 타임스템프라는 타입으로 반환  >>> 문자열 시간으로 반환 >> 인수에 따라서 datetime 값을 반환한다.
select timestamp('2019-06-15', '13:10:11');

-- 시간의 차이 최댓값 확인
select timediff('13:10:11', '13:10:10');
select timediff('2022-05-03 00:00:00', '2022-01-03 13:10:10');
select timediff(now(),'2022-05-01 13:10:10');

-- 날짜 빼기 ,,, 10일 빼기
select subdate(now(), interval 10 day);
select date_add(now(), interval 10 day);

-- 시스템 유저 확인
select system_user();
select session_user();
select version();
select current_user();

-- 넘겨오는 값이 null 이면 어떠한 문자 출력
select nullif("x", null);

-- date 포맷
select date_format(now(), '%Y/%m/%d') as 날짜;



