select*from job;

create table job(
img varchar2(60),
subject varchar(40),
company varchar(30),
location varchar(30),
reward varchar(30),
logtime DATE,
seq varchar(30));

insert into job values ('1','kor','coupang','�ѱ�/����','10000',sysdate,jobseq.nextval);

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
id varchar2(30),
position varchar2(80),
company varchar2(30),
logtime date default sysdate,
apply varchar2(30),
seq number);


