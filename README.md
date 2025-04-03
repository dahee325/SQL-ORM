# RDBMS(Relation DataBase Management System)
- 표 형식으로 저장, SQL문으로 작성
- SQL이라고 부름 => 그 외는 NoSQL이라고 부름(document(ex. Mongo DB), key-value, graph 등)

# MySQL 설치
- mysql 홈페이지 -> download -> 맨 아래 community ~ -> `Community Server`와 `MySQL Workbench`설치
- `Communiry Server` : 데이터베이스 자체
    1. 버전 변경 : 8.4.4 LTS(Long-Term-Service)
    2. NSI Installer
    3. 만약 Visual C++오류 생기면 슬랙 링크 접속 -> X64 설치
    4. accept 동의
    5. 첫번째(t어쩌구) 선택
    6. 설정변경 -> accounts and Roles : password설정(`password`로 함)
    7. Next -> Execute
    8. 설치 완료
- `MySQL Workbench` : 데이터 베이스에 접근 => 꼭 필요하지는 않고 대신 외부의 `DBeaver`와 같은 툴 사용 가능
    1. 별 다른 설정 필요 없음 -> Install
    2. 잘 설치됐으면 `Welcome to MySQL Workbench`창이 뜸
    3. Local instance MySQL 더블클릭
    4. password 입력
    5. Communty serer 들어가기

# MySQL
- `mydb` schema 생성
- `Query` 이름을 `0.DDL`로 설정

# SQLite
- vs code -> extensions -> `SQLite` 프로그램 설치
- `sqlite3/0.DDL.sql` 폴더와 파일 생성
- `sqlite3/db.sqlite3` 파일 생성


# 0. settings
- `python -m venv venv`
- `source venv/Scripts/activate`
- `pip install django faker`
- `.gitignore` 설정 : python , windows, macOS, django
- `pip freeze >> requirements.txt`


## 프로젝트/앱 생성
- `django-admin startproject sql_orm .`
- `django-admin startapp movies`
- `sql_orm/settings.py`에 `movies`앱 등록

# 1. modeling / migration
- `movies/models.py`에 슬랙 공유코드 복붙
- `python manage.py makemigrations`
- `python manage.py migrate`
- `python manage.py sqlmigrate movies 0001` : ORM(Object Relation Mapping)이 우리가 입력한 명령어를 SQL로 만들어준 내용 확인..?

# 2. DATABASES 변경
- `sqlite3`에서 `MySQL`로
- `sql_orm/settings.py`에서 `DATABASES`설정 변경
```python
# 기존에 있던 DATABASES는 주석처리하고 새로 작성

DATABASES = {
    'default': {
        'ENGINE' : 'django.db.backends.mysql',
        'NAME': 'mydb', # workbench에서 만든 mydb
        'HOST' : 'localhost', # mysql 서버 주소
        'PORT' : '3306',
        'USER' : 'root', # mysql 서버에 누가 접속했는지
        'PASSWORD' : 'password',
    }
}
```

- `python manage.py migrate` : 데이터베이스 공간을 바꿨기 때문에 다시 알려줘야함 => `mysqlclient`설치하라고 오류
- `pip install mysqlclient`
- `python manage.py migrate` => 잘 됨, Workbench에 들어가서 Tables이 생겼는지 확인

- 그치만 우리는 sqlite3로 할 것 => workbench가 편하지 않음 => 새로 만든 DATABASES 주석처리하고 원래 코드 사용

# 3. generate
- `moveis`폴더 안에 `management`폴더 생성
- `movies/management`폴더 안에 `commands`폴더와 `__init__.py`파일 생성
- `movies/management/commands`폴더 안에 `__init__.py`와 `generate.py` 파일 생성
- `movies/management/commands/generate.py`에 슬랙에 공유된 코드 복붙
- `python manage.py generate` : db에 `generate.py`에 있는 데이터 저장하는 코드 => 코드를 2번 실행하면 2번 쌓임


# 4. DataBase 조작
## 4-1. CREATE
- `sqlite3/ 1.insert.sql`파일 생성 : 테이블에 내가 가진 데이터 삽입
- `pip install django-extensions` 설치 -> shell기능 별로여서 `ipython`다시 설치
- `sql_orm/settings.py`에 `django-extensions` 앱 등록
- `python manage.py shell_plus` : ORM 사용
- `pip install ipython` 설치 -> `python manage.py shell_plus`다시 실행

## 4-2. READ
- `sqlite3/2.select.sql`파일 생성
- django-lookup-filter : 