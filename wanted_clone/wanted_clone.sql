select*from job;

create table job(
img varchar2(60),
subject varchar(40),
company varchar(30),
location varchar(30),
reward varchar(30),
logtime DATE,
seq varchar(30));

insert into job values ('1','kor','coupang','한국/서울','10000',sysdate,jobseq.nextval);

commit;

create table job(
img varchar2(60),
position varchar2(80),
subject varchar2(80),
company varchar2(30),
location varchar2(30),
content varchar2(15000),
reward varchar2(30),
companylocation varchar2(300),
seq number);

select*from jobtest;

drop table jobtest;
drop table job;

select*from job;


create table jobapply(
id varchar2(60),
position varchar2(80),
company varchar2(30),
logtime date default sysdate,
apply varchar2(30),
seq varchar2(50));

select*from jobapply;

drop table jobapply;
commit;
--select count(apply) from jobapply where apply='지원완료' and id=#{id};
select count(apply) from jobapply where apply='지원완료';

create table insight(
list varchar2(60),
link varchar2(500),
img varchar2(80),
subject varchar2(80),
content varchar2(500),
channel varchar2(100),
channelname varchar2(80)
);
commit;
select*from insight;


