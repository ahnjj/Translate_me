create database translate_db;

use translate_db;

-- 기본 user
-- 기본 유저 테이블 사용 

-- 언어 구분 테이블 
drop table language_code;
create table language_code(
	language_id varchar(10) not null primary key,
    language_name varchar(30)    
);
insert into language_code values('1','korean');
insert into language_code values('2','english');
insert into language_code values('3','japanese');
insert into language_code values('4','chinese');


-- 게시판

-- 질문, 정보제공 등 카테고리 분류내용
drop table category;
create table category(
	category_id varchar(10) not null primary key,
    category_name varchar(30)
);
insert into category (category_id, category_name)
values ('1', '정보제공'),
       ('2', '질문');
       

drop table board;
CREATE TABLE board (
        board_id INT AUTO_INCREMENT PRIMARY KEY,
        board_title VARCHAR(100),
        board_main_txt LONGTEXT,
        category_id VARCHAR(10),
        language_id VARCHAR(10),
        user_id BIGINT,
        reg_date DATETIME,
        lst_chg_date DATETIME,
        CONSTRAINT board_language
        FOREIGN KEY (language_id) REFERENCES language_code (language_id),
        CONSTRAINT board_users_app
        FOREIGN KEY (user_id) REFERENCES users_app_user (id), 
        CONSTRAINT board_category
        FOREIGN KEY (category_id) REFERENCES category (category_id)
      );


drop table board_comment;
CREATE TABLE board_comment(
        comment_id int auto_increment,
        board_id int,
        user_id BIGINT,
        comment_text varchar(200),
        reg_date datetime,
        lst_chg_date datetime,
        primary key(comment_id, board_id, user_id),
        CONSTRAINT board_comment_users_app
        FOREIGN KEY (user_id)
        REFERENCES users_app_user (id),
        constraint board_comment_board
        foreign key (board_id)
        references board (board_id)
      );


drop table vocabulary;
create table vocabulary( 
	vocabulary_id bigint not null auto_increment primary key, 
    vocabulary_name varchar(100), -- 단어
    vocabulary_meaning longtext, -- 뜻
    vocabulary_level int,    -- 단어 수준
    language_id varchar(10), -- 단어의 언어
    reg_date date,
    train_yn boolean, -- 학습 완료여부 n이면 단어장에 안나옴 y일 경우 테스트에 나옴
    id bigint,
    CONSTRAINT vocabulary_user_info
    foreign key (id)
    references users_app_user (id),
    CONSTRAINT vocabulary_language
    FOREIGN KEY (language_id)
    REFERENCES language_code (language_id)
);

-- 유저 테스트 결과 저장 테이블 
create table user_test_result(
	test_id bigint auto_increment not null primary key,
    id bigint,
    user_score int,
    test_date datetime,
    CONSTRAINT test_user_info
    foreign key (id)
    references users_app_user (id)
);

