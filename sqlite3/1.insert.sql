-- Use DataBase => 최상단의 db.sqlite3사용

-- ORM 문법1
-- Movie.objects.create(
--     title='dark night',
--     year=2008
-- )
-- ORM 문법2
-- movie = Movie()
-- movie.title = 'spider man'
-- movie.year = 2010
-- movie.save()

-- 테이블에 데이터 추가
-- INSERT INTO 테이블 이름(넣고싶은 변수) VALUES (값)
INSERT INTO movies_movie (title, year)
VALUES ('dark night', 2008);