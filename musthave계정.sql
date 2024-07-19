--system 계정에서 실행
alter session set "_ORACLE_SCRIPT"=true;

create user musthave identified by 1234;

--테이블 스페이스 권한 주기
grant connect, resource, unlimited tablespace to musthave;
--테이블 스페이스 리스트 확인
select tablespace_name, status, contents from dba_tablespaces;
--테이블스페이스에 용량 확인
select tablespace_name, sum(bytes), max(bytes) from dba_free_space group by tablespace_name;
--개인 계정이 어느 테이블스페이스에 들어있는지 확인
select username, default_tablespace from dba_users where username in upper('musthave');

--musthave계정에 users 테이블 스페이스에 데이터를 입력할 수 있도록 5m의 용량 할당
alter user musthave quota 5m on users;


--musthave계정으로 변경
select * from tab;

drop table member;
drop table board;
drop table seq_board_num;

--회원 테이블 만들기
CREATE TABLE member
(
	id VARCHAR2(10) NOT NULL,
	pass VARCHAR2(10) NOT NULL,
	name VARCHAR2(30) NOT NULL,
	regidate DATE DEFAULT SYSDATE not null,
	PRIMARY KEY (id)
);



-- 모델 1 방식의 테이블 만들기

CREATE TABLE board
(
    num number primary key,
    title varchar2(200) not null,
    content varchar2(2000) not null,
    id varchar2(10) not null, 
    postdate date default sysdate not null,
    visitcount number(6)
);

alter table board
    add constraint board_mem_fk foreign key (id)
    references member(id);

create sequence seq_board_num
    increment by 1  -- 1식 증가
    start with 1    -- 시작값 1
    minvalue 1      -- 최소값 1
    nomaxvalue      -- 최대값은 무한대
    nocycle         -- 순환 x
    nocache;        -- 캐시 사용 안함
    
-- 더미 데이터 입력 (미리 많이 만들어놓고 사용하기)
insert into member (id, pass, name) values ('musthave', '1234', '머스트해브');
insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '제목1입니다', '내용1입니다', 'musthave', sysdate, 0);
insert into board values (seq_board_num.nextval, '지금은 봄입니다', '봄의왈츠', 'musthave', sysdate, 0);
insert into board values (seq_board_num.nextval, '지금은 여름입니다', '여름향기', 'musthave', sysdate, 0);
insert into board values (seq_board_num.nextval, '지금은 가을입니다', '가을동화', 'musthave', sysdate, 0);
insert into board values (seq_board_num.nextval, '지금은 겨울입니다', '겨울연가', 'musthave', sysdate, 0);
commit;

SELECT COUNT(*) FROM board;
SELECT * FROM board  ORDER BY num DESC;

select * from member;
select * from board;
select id, pass, rownum from member;

select * from board order by num desc;

select Tb.*, rownum rNum
    from (select * from board order by num desc) Tb;
    
select *
    from (select Tb.*, rownum rNum
            from (select * from board order by num desc) Tb)
            where rNum between 1 and 10;
            
            
----------- JSP 13장 파일 업로드

create table myfile (
    idx number primary key,

    title varchar2(200) not null,
    cate varchar2(100),
    ofile varchar2(100) not null,
    sfile varchar2(30) not null,
    postdate date default sysdate not null
);

desc myfile;

delete * from myfile;--초기화 및 안에 있는 데이터 지우기
select * from myfile;--확인하기

drop table mvcboard;

create table mvcboard (
	idx number primary key, 
	name varchar2(50) not null, 
	title varchar2(200) not null, 
	content varchar2(2000) not null, 
	postdate date default sysdate not null, 
	ofile varchar2(200), 
	sfile varchar2(30), 
	downcount number(5) default 0 not null, --다운로드 한 횟수 카운트
	pass varchar2(50) not null, 
	visitcount number default 0 not null
);

desc mvcboard;

insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '김유신', '자료실 제목1 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '장보고', '자료실 제목2 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '이순신', '자료실 제목3 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '강감찬', '자료실 제목4 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '대조영', '자료실 제목5 입니다.','내용','1234');

commit;

select * from mvcboard;

select dbtimezone from dual;

select sessiontimezone from dual;

select sysdate from dual;

select CURRENT_TIMESTAMP AT TIME ZONE "Asia/Seoul' AS seoul_time from dual;