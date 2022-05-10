use shopdb;

select * from membertbl;
select * from bookingTBL;

drop table bookingTbl;
update membertbl set memberAddress = '서울시 강남구' where memberName = '탕탕이';
insert membertbl values ('Jyp', '박진영', null);

create table bookingTBL (
	memberId varchar(10) not null,
    roomNum int not null,
    booking_date datetime
);

insert bookingTbl values( 'Dao', 101, '2022-05-02 17:30:00');
insert bookingTbl values( 'Jsa', 106, '2022-04-28 12:10:00');
insert bookingTbl values( 'Jyp', 102, '2022-05-01 08:30:00');
insert bookingTbl values( 'Son', 104, '2022-05-02 12:00:00');
insert bookingTbl values( 'Dao', 103, '2022-04-20 16:00:00');


