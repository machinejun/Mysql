-- 서브쿼리 1
CREATE DATABASE reservationDB;
USE reservationDB;

-- 예약정보를 관리하는 테이블 스키마 정의
CREATE TABLE reservation (
	id INT AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    reserveDate DATE NOT NULL,
    roomNum VARCHAR(5) NOT NULL,
    PRIMARY KEY(id)
);
DESC reservation;

-- 고객 테이블
CREATE TABLE customer (
	id INT AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    age INT NOT NULL,
    addr VARCHAR(10),
    PRIMARY KEY(id)
);

-- data 입력
INSERT INTO reservation VALUES(1, '홍길동', '2020-05-01 00:00:00', 1);
INSERT INTO reservation VALUES(2, '임꺽정', '2020-05-02 00:00:00', 2);
INSERT INTO reservation VALUES(3, '장길산', '2020-05-03 00:00:00', 3);
INSERT INTO reservation VALUES(4, '홍길동', '2020-05-04 00:00:00', 4);

-- 데이터 수정
-- 1 >> romNum 1001
-- 2 >> romNum 1002
-- 3 >> romNum 1003
-- 4 >> romNum 1004


UPDATE reservation SET roomNum = '1001'
WHERE roomNum = '1';
UPDATE reservation SET roomNum = '1002'
WHERE roomNum = '2';
UPDATE reservation SET roomNum = '1003'
WHERE roomNum = '3';
UPDATE reservation SET roomNum = '1004'
WHERE roomNum = '4';

-- 고객 테이블 데이터 생성
INSERT INTO customer VALUES(1, '홍길동', 20, '서울');
INSERT INTO customer VALUES(2, '임꺽정', 30, '부산');
INSERT INTO customer VALUES(3, '장길산', 24, '광주');
INSERT INTO customer VALUES(4, '전우치', 33, '울산');

-- 데이터 수정
-- 2 >> 인천
-- 3 >> 서울
-- 4 >> 수원

UPDATE customer SET addr = '인천'
WHERE addr = '부산';
UPDATE customer SET addr = '서울'
WHERE addr = '광주';
UPDATE customer SET addr = '수원'
WHERE addr = '울산';


SELECT * FROM customer;

-- 서브쿼리 >> 주소가 '서울'인 고객들의 예약 정보를 조회하는 쿼리
SELECT id, reserveDate, roomNum, name
FROM reservation
WHERE name IN(
				SELECT name 
                FROM customer 
                WHERE addr = '서울'
			);
            
--  >> 조인문으로 변경하여 같은 결과를 출력하세요
SELECT r.id, r.name, reserveDate, roomNum, addr
FROM reservation AS r
INNER JOIN customer AS c
ON r.name = c.name
WHERE addr = '서울';

-- from절 서브쿼리 = inline view
-- 서브쿼리부터 실행된다. 
SELECT name, reservedRoom
FROM (SELECT name, reserveDate, (roomNum) AS reservedRoom
		FROM reservation
        WHERE roomNum > 1001) AS reservationInfo;
        
/*
	쿼리 실행 순서
    1. reservation 테이블에서 roomNum > 1001 보다 큰 레코드를 먼저 조회 ( roomNum 필드값을 1씩 증가시켜 찾는다 )
    2. 다 찾은 후 결과 집합은 reservationInfo 이름을 가진 임시테이블로 만들어진다.(내부 쿼리, 서브쿼리)
	3. 외부쿼리에서는 만들어진 임시 테이블에서 name, reservedRoom이라는 필드만 선택하여 결과를 출력한다.
*/

-- 서브 쿼리를 사용해서 문제를 만들어서 제출
select *
from reservation as r
inner join (select *
		from customer 
        where age >= 25) as t 
on r.name = t.name;



