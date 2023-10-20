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

    > venv 설치목록 (window 기준)
      10/16
      > pip install django
      > pip install mysqlclient
      > pip install django_bootstrap5
      > pip install pillow

      10/18
      > pip install bs4

      10/19
      > pip install openpyxl
      > pip install django-environ
      > pip install daphne
      > pip install requests
      > pip install uvicorn
      > pip install channels

      requirments.txt 못 읽을경우
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

#### 브랜치명 (jsh) - 팀원 장승헌 (2023-10-17 16:30)
    > 깃 로그명 : translate_app modify 001
    > translate_app 폴더 기준으로 표시

    >> 생성
    >>> templates/translate_app/result.html : 기존 index.html의 section에 해당하는 부분을 따로 html로 빼내어 검색결과를 표시하는 기능을 추가

    >>> naver_dict_search.py : 네이버에서 검색하여 크롤링한 결과를 반환해주는 기능들 추가 / 미완성!

    >>> ../static/js/index_search.js : 검색한 단어를 ajax로 요청하여 결과를 받는 기능 구현


    >> 수정
    >>> templates/translate_app/index.html : 위의 result.html에 해당하는 부분만큼이 생략되었고 검색란에 form태그를 추가하여 검색 기능 활성화

    >>> urls.py : 검색기능 path 추가

    >>> views.py : 검색기능 함수(index_search) 추가

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


#### 브랜치명 (ghkim_board) - 팀원 김근형 (2023-10-18 13:18)
    ! 하단의 작업은 nvbar가 페이지 출력시 바로 보이지 않는 것을 해결하기 위해 수정하였습니다.
    > templates 
    >> nvbar.html
    > static
    >> css
    >>> styles.css

#### 브랜치명 (ldh) - (2023-10-18 18:00)
    > 단어장 기본 기능 추가
        > db의 단어장 테이블에서 user의 id로 데이터 가져와 뿌려주기
        > 사용자가 단어장에 추가 가능
        > 단어장페이지에서 단어 학습완료, 삭제 가능

#### 브랜치명 (ghkim_board) - 팀원 김근형 (2023-10-19 22:19)
    ! 금일은 게시물 검색, 댓글 목록과 작성 기능을 추가하기 위해 작업하였습니다.
    > static \ js
    >>> board_search.js
    >>>> 검색시 출력이 잘 안되는 사항 수정 
    >>>>> 카테고리, 언어가 숫자로 출력되는 것 수정 필요

    > board_app
    >> templates \ board_app
    >>> board_detail.html
    >>>> 댓글 목록 및 작성 가능하도록 코드 추가

    >> forms.py
    >>> BoardCommentForm 작성
    
    >> models.py
    >>> BoardComment 변경
    
    >> urls.py
    >>> board_comment url 추가

    >> views.py
    >>> board_detail에 댓글 작성할 수 있도록 추가
    
#### 브랜치명 (jsh) - 팀원 장승헌 (2023-10-20 10:10)
    > 깃 로그명 : translate_app modify 006

    >> index 페이지에서의 사전 검색기능 1차 완성

    >> 수정
    >>> static/js/index_search.js
    >>> translate_app/templates/translate_app/index.html
    >>> translate_app/templates/translate_app/result.html
    >>> translate_app/online_dict_search.py
    >>> translate_app/views.py
    >>> templates/base.html : bootstrap 관련 스크립트를 bundle파일로 변경
