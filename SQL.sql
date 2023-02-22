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







