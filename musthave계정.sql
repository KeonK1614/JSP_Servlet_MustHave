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