# SEMI PROJECT (2023.10.13 ~ )

## 주제 : 언어 학습 사이트 개발 

### 1일차 

#### 프로젝트 기본 세팅

    > DB 접속 정보 (./db_settings.py)
      > mysql사용
      > 계정 자기것으로 수정 필요
      > database명 translate_db

    > template 아래 base.html, nvbar.html 생성
      > nvbar에 회의때 나온 메뉴목록 써놓기만 한 상태 
      > 유저 메뉴는 로그인안하면 안보이는 상태(static/js/common.js)

    > static 폴더 생성
      > css, js 생성
      > jquery는 사용해본 버전인 3.7.1 (필요시 변경 가능)

    > index페이지 bootstrap 적용

    > pip install list (window 기준)
      > django
      > mysqlclient
      > django_bootstrap5
      > pillow
      > pip install -r requirements.txt

#### 기능별 앱
    > translate_app : index 

    > board_app : 게시판

    > vocavulary_app : 단어장 

    > users_app : 유저 관리

    > 검색 기능은 필요시 app 생성, 아니면 translate_app에 구현

#### 브랜치명 (ghkim_board) - 팀원 김근형 (2023-10-16 17:43)
    > board_app
    
    >> templates\board_app
    >>> 생성 : board_detail.html, board_form.html, board_list.html, board_search_form.html, board_update.html
    >>>> 추가 의견 : 커뮤니티 관련 페이지를 고려하여 변경 또는 통합해야 할 수 있습니다.

    >> forms.py : 생성

    >> models.py
    >>> reg_date, lst_chg_date = Date에서 DateTime으로 수정

    >> urls.py
    >>> 생성 : list, detail, insert, update, delete, search_form, search 

    >> views.py
    >>> 생성 : list, detail, insert, update, delete, search_form, search
    >>>> 1. 로그인을 해야 게시물 작성 가능하도록 내용 추가
         2. 작성자만 작성된 게시물에 대한 수정 및 삭제 권한 부여 내용 추가

    >> static \ js
    >>> board_search.js 생성


    > 수정이 필요한 내용 : 
    >> templates
    >>> nvbar.html


#### 브랜치명 (ghkim_board) - 팀원 김근형 (2023-10-17 20:33)
    > board_app
    >> templates \ board_app
    >>> board_detail.html
        - 코드 작성
        - 부트스트랩을 통해 테이블, 버튼 디자인
    >>> board_form.html
        - 코드 작성
    >>> board_list.html
        - 코드 작성
        - 부트스트랩을 통해 테이블, 버튼 디자인
    >> forms.py
        - 유저 정보를 전달하도록 내용(init, save) 추가
    >> models.py
        - 유저가 전달안되는 문제 해결을 위해 변경 (user columns)
    >> views.py
        - 로그인 유저와 게시물 작성 유저 일치 여부에 따라 수정, 삭제 버튼이 나타나거나 나타나지 않도록 설정
        -- board_insert에 대하여 로그인 후에 게시물 등록하도록 수정
        -- board_update, board_delete 에 대하여 로그인하고 게시물 작성 유저와 현재 로그인 유저가 같아야지만,
           수정, 삭제 버튼이 나타나도록 내용 수정

    > MySQL
    >> CREATE TABLE board (
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
    >>> 위의 board 테이블 수정 (사유: 로그인 정보가 user_info가 아닌 users_app_user와 연결됨) 
        - 수정 내용 : user_id columns을 위해 외래키를 user_info가 아닌 users_app_user테이블로 받아왔음

    >> CREATE TABLE board_comment(
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
    >>> 위의 board_comment 테이블 수정 (사유: 로그인 정보가 user_info가 아닌 users_app_user와 연결됨) 
        - 수정 내용 : user_id columns을 위해 외래키를 user_info가 아닌 users_app_user테이블로 받아왔음
        !!! 주의 : 내일 2023년 10월 18일 comment 작업시 제대로 작동하는지 확인 필요 !!!

    > 2023년 10월 18일 예정 작업
    >> 1_게시물 comment을 포함하여 게시판의 모든 작업 완료
    >> 2_게임 관련하여 여러가지 정보 찾아보고 빠른 완료가 가능한 작업부터 신속하게 진행