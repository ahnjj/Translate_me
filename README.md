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
      > 번잡해서 드롭다운으로 넣어놓음
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

#### 브랜치명 (ghtkim_board) - 팀원 김근형 (2023-10-16 17:43)
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

