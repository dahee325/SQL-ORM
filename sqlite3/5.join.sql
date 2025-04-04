-- 특정 사람이 작성한 스코어 점수들 출력
-- movies_score에는 user_id만 나오고 name은 안나옴 
-- => movies_score와 name과 id가 담겨져있는 movies_user와 합쳐서 코드 실행해야함
-- => movies_score의 user_id와 movies_user의 id가 같은 변수

-- 1번 유저가 작성한 모든 점수(scores)
-- user = User.objects.get(id=1)
-- User라는 클래스 안에는 score_set이라는 변수가 숨겨져 있음
-- user.score_set.all() -- 유저가 작성한 스코어 점수들 모두 가져오기

-- 위와 같은 코드
--Score.objects.filter(user_id=1)


-- 변수 이름을 바꿔서 출력하고싶으면 AS 사용
-- SELECT name, movies_score.id AS score_id
SELECT *
FROM movies_user JOIN movies_score -- 두 테이블 합치기
ON movies_user.id = movies_score.user_id -- 기준이 되는 변수 알려주기
WHERE movies_user.id=1; -- id가 두개 생겼기 때문에 어느 테이블의 id인지 알려줘야함


-- 100번 영화가 어떤 카테고리에 속해있는지
-- Movie.objects.get(id=100).categories.all()


-- movies_movie, movies_category_movies, movies_category 3개의 테이블 JOIN
SELECT * 
-- 중간 테이블을 중간에 사용
FROM movies_movie JOIN movies_category_movies
ON movies_movie.id = movies_category_movies.movie_id
-- 2개의 테이블을 합친 후 나머지 하나 합침
JOIN movies_category
ON movies_category_movies.category_id = movies_category.id
WHERE movies_movie.id=100;


-- 드라마 카테고리에 속한 모든 영화 출력
-- Category.objects.get(name='drama').movies.all()
SELECT *
FROM movies_category JOIN movies_category_movies
ON movies_category.id = movies_category_movies.category_id
JOIN movies_movie
ON movies_category_movies.movie_id = movies_movie.id
WHERE movies_category.name='drama';



-- group by
-- User.objects.values('country').annotate(Count('id'))
-- annotate() : 새로운 컬럼을 하나 더 추가
SELECT country, COUNT(*) FROM movies_user
GROUP BY country;


-- 나라별 평균 스코어
-- movies_user, movies_score 합치기
-- User.objects.values('country').annotate(Avg('score__value'))
-- score__value : User와 1:N의 관계인 score 테이블의 value 변수 가져오기
SELECT country, AVG(value)
FROM movies_user JOIN movies_score
ON movies_user.id = movies_score.user_id
GROUP BY country;