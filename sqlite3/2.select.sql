-- Movie.objects.all()
SELECT * FROM movies_movie;

-- User.objects.all()
SELECT * FROM movies_user;

-- Movie.objects.all().order_by('year')
SELECT * FROM movies_movie -- 데이터 가져오기
-- ORDER BY year; -- 정렬
ORDER BY year DESC; -- 역순으로 정렬


-- 조건에 맞는 데이터 골라내기

-- 나이가 31인 사람
-- User.objects.filter(age=31)
SELECT * FROM movies_user
WHERE age=31;

-- User.objects.filter(age__lt=20), lt(less then), ORM은 =만 사용가능
SELECT * FROM movies_user
WHERE age<20;

-- 나이가 20대인 사람
-- User.objects.filter(age__gte=20, age__lt=30)
SELECT * FROM movies_user
WHERE age >= 20 and age < 30;

-- Movie.objects.filter(Q(year__lt=2000) | Q(year__gt=2010))
SELECT * FROM movies_movie
where year < 2000 or year > 2010;

-- Movie.objects.aggregate(Max('year'))
-- MAX() : 가장 최근
SELECT title, MAX(year) FROM movies_movie;

-- ORM에서 aggregate는 계산이 목적이므로 값만 출력
-- 최신 영화의 제목을 출력할려면 order_by사용
-- Movie.objects.values('title', 'year').order_by('-year')[0]

-- AVG() : 평균
-- User.objects.aggregate(Avg('age'))
SELECT AVG(age) FROM movies_user;

-- 1번 영화의 평균 평점
-- Score.objects.filter(movie_id=1).aggregate(Max('value'), Avg('value'))
SELECT MAX(value), AVG(value) FROM movies_score
WHERE movie_id=1;

-- 1번 유저가 작성한
-- len(Score.objects.filter(user_id=1))
-- Score.objects.filter(user_id=1).count()
SELECT COUNT(*) FROM movies_score
WHERE user_id=1;



-- the가 들어가는 title 골라내기
-- LIKE : 글자 필터링
-- Movie.objects.filter(title__contains='the')
SELECT * FROM movies_movie
WHERE title LIKE '%the%'; -- the 앞뒤에 뭐가 와도 됨, the를 포함

-- Movie.objects.filter(title__startswith='the')
SELECT * FROM movies_movie
WHERE title LIKE 'the%'; -- the로 시작해야됨, the뒤에는 뭐가 와도 됨

-- Movie.objects.filter(title__endswith='on.')
SELECT * FROM movies_movie
WHERE title LIKE '%on.'; -- on.으로 끝나야함

-- ORM에서 사용하려면 정규표현식을 사용해야함 -> 사용하기 불편
SELECT * FROM movies_movie
WHERE title LIKE '%g__d%'; --g로 시작하면서 d로 끝나는 4글자 단어 포함, 띄어쓰기도 포함

-- DISTINCT : 중복 제거
-- User.objects.values('country').distinct().count()
SELECT COUNT(DISTINCT country) FROM movies_user;

-- 범위
-- User.objects.filter(age__range=[20, 29])
SELECT * FROM movies_user
WHERE age BETWEEN 20 AND 29;

-- 특정 경우 선택
--  Movie.objects.filter(year__in=[2000, 2005, 2010])
SELECT * FROM movies_movie
WHERE year IN (2000, 2005, 2010);