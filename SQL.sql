desc mysql.user;
show columns from mysql.user;
show full columns  from mysql.user;

select host, user, password from mysql.user;

# create user '아이디'@'접근가능한주소' identified by '비밀번호'; 
create user 'test'@'localhost' identified by '1234';
select user, host from mysql.user;

create user 'anywhere'@'%' identified by '1234';
select user, host from mysql.user;

create user 'test2'@'192.168.0%' identified by '1234';
select user, host from mysql.user;

# or replace 조건 : 이미 존재하는 사용자 이름인 경우 기존 사용자를 삭제하고 다시 만든다.
create or replace user 'test'@'localhost' identified by '1234';
select user, host from mysql.user;

# if not exists 조건 : 같은 이름의 사용자가 없을 때만 사용자를 추가한다.
create user if not exists 'test2'@'localhost' identified by '1234';
select user, host from mysql.user;

# 기존에 만든 사용자의 이름을 변경하고 싶을 때 rename user 사용
rename user 'test2'@'localhost' to 'test3'@'%';
select user, host from mysql.user;

set password for 'test3'@'%' = password('12345');
select user, host from mysql.user;
drop user 'test3'@'%';
drop user if exists'anywhere'@'%';

#데이터베이스 목록 조회
show databases;
#데이터베이스 test라는 이름으로 생성
create database test;  

#기존 권한 확인
show grants for 'test'@'localhost';
#모든 권한을 부여
grant all privileges on test.*to 'test'@'localhost';
flush privileges;

#데이터베이스 권한 확인하기
show grants for 'test'@'localhost'; 
#데이터베이스에 가진 모든 권한 제거하기
revoke all on test.* from 'test'@'localhost';
flush privileges;
show grants for 'test'@'localhost'; 

#데이터베이스 조회하기
show databases;

create database if not exists test;

create database `test.test`;

drop database `test.test`;

show databases;

# 데이터베이스 명칭 변경 편법은 cmd 명령프롬프트에서 함

#테이블 만들기 드디어..........
create database python;
use python;

#최대 문자 100개를 가질 수 있는 가변 문자형...
create table table1 ( column1 varchar(100) );

select database();

show tables;

rename table table1 to table2;

show tables;

drop table table2;

create table test_table (
	test_column1 int,
    test_column2 int,
    test_column3 int
    );
desc test_table;

alter table test_table
add test_column4 int;

desc test_table;

alter table test_table
add (
	test_column5 int,
    test_column6 int,
    test_column7 int
);
desc test_table;

alter table test_table
drop test_column1;

desc test_table;

alter table test_table
modify test_column7 int
first;

desc test_table;

alter table test_table
modify test_column7 int
after test_column6;

desc test_table;

alter table test_table
change test_column2 test_column0 int;

desc test_table;

alter table test_table
change test_columnn0 test_column0 varchar(10);

desc test_table;

alter table test_table
change test_column0 test_column2 int;

desc test_table;

create table test ( id int auto_increment primary key );

describe test;

insert into test values ();

select * from test;

insert into test value ( 100 );

insert into test value ();

select * from test;

delete from test where id = 101;
select * from test;

insert into test values ();
select * from test;

DELETE FROM test;
SELECT * FROM test;

INSERT INTO test VALUES ();
SELECT * FROM test;

SHOW TABLE STATUS 
WHERE name = 'test';

ALTER TABLE test AUTO_INCREMENT = 1;

INSERT INTO test VALUES ();
SET @count=0;
UPDATE test SET id=@count:=@count+1;
SELECT * FROM test;

# 테이블에 데이터 추가, insert
create table table1 (
column1 varchar(100),
column2 varchar(100),
column3 varchar(100)
);
desc table1;

insert into table1 (column1, column2, column3) values ('a','aa','aaa');
# 실행한 횟수만큼 아래 조건으로 조회해보면 추가된 것을 볼 수 있다.
SELECT * FROM table1;

INSERT INTO table1 VALUES ( 'a', 'aa', 'aaa' );

SELECT * FROM table1;

INSERT INTO table1 ( column1, column2 ) VALUES ( 'b', 'bb' );

SELECT * FROM table1;

UPDATE table1 SET column1 = 'z';

SELECT * FROM table1;

UPDATE table1 SET column1 = 'x' WHERE column2 = 'aa';

SELECT * FROM table1;

update table1
SET column1 = 'y'
, column2 = 'yy'
WHERE column3 = 'aaa';

SELECT * FROM table1;

DELETE FROM table1 WHERE column1 = 'y';

SELECT * FROM table1;

DELETE FROM table1;

SELECT * FROM table1;

#테스트용 테이블 생성
create table if not exists day_visitor_realtime (
ipaddress varchar(16),
iptime_first datetime,
before_url varchar(250),
device_info varchar(40),
os_info varchar(40),
session_id varchar(80));

insert into day_visitor_realtime (
	ipaddress, iptime_first, before_url, device_info
)
values('192.168.0.1', '2023-02-23 11:34:45', 'localhost', 'PC')
    , ('192.168.0.2', '2023-02-23 11:34:51', 'localhost', 'iPhone'
);
select*from day_visitor_realtime;

INSERT INTO `day_visitor_realtime` (`session_id`) VALUES
('12345.567890');
INSERT INTO `day_visitor_realtime` (`session_id`) VALUES
('1234.567890');
INSERT INTO `day_visitor_realtime` (`session_id`) VALUES ('123');
INSERT INTO `day_visitor_realtime` (`session_id`) VALUES ('1234');
INSERT INTO `day_visitor_realtime` (`session_id`) VALUES ('12345');
SELECT * FROM day_visitor_realtime;

# not null
DROP TABLE IF EXISTS day_visitor_realtime;
create table if not exists day_visitor_realtime (
ipaddress varchar(16) NOT NULL,
iptime_first datetime,
before_url varchar(250),
device_info varchar(40),
os_info varchar(40),
session_id varchar(80));

SELECT * FROM day_visitor_realtime;

# PRIMARY KEY
# 기본키는 하나의 테이블에 있는 데이터들을 고유하게 식별하는 제약조건입니다.
# 기본키는 한 개의 테이블에 하나만 생성가능합니다.
# 기본키로 설정된 열에 중복된 값을 가질 수 없으며 NULL값 또한 가질 수 없습니다.
# 형식은 PRIMARY KEY (컴럼명1, 컬럼명2, 컬럼명3, ...)와 같이 작성할 수 있습니다.alter

DROP TABLE IF EXISTS day_visitor_realtime;
CREATE TABLE day_visitor_realtime (
  id INT,    
  ipaddress varchar(16),
  iptime_first datetime,
  before_url varchar(250),
  device_info varchar(40),
  os_info varchar(40),
  session_id varchar(80),
  PRIMARY KEY(id)
);

# FOREIGN KEY(외래키)
# 는 참조하는 테이블의 컬럼에 존재하는 값만 사용하는 제약조건이다.
# 참조할 수 있는 칼럼은 참조하는 테이블의 기본키이거나 UNIQUE한 컬럼만 가능하다.

#참조할 테이블
create table orders (
order_id int,
customer_id int,
order_date datetime,
primary key(order_id)
);

CREATE TABLE order_detail (
  order_id INT,
  product_id INT,
  product_name VARCHAR(200),
  order_date DATETIME,
  CONSTRAINT FK_ORDERS_ORDERID FOREIGN KEY (order_id) REFERENCES orders(order_id),
  PRIMARY KEY(order_id, product_id)
);

insert into orders values(1, 1, now());
insert into orders values(2, 1, now());
insert into orders values(3, 1, now());
select * from orders;

#select문.......많이 사용함

CREATE TABLE `users` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `email` varchar(255) COLLATE utf8_bin NOT NULL,
    `password` varchar(255) COLLATE utf8_bin NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin
AUTO_INCREMENT=1 ;

use python;


CREATE TABLE `users` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `email` varchar(255) COLLATE utf8_bin NOT NULL,
    `password` varchar(255) COLLATE utf8_bin NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin
AUTO_INCREMENT=1 ;

select * from users;


