-- 터미널 클리어 : ctrl + L

-- 데이터 수정
-- movie = Movie.objects.get(id=1)
-- movie.title = 'spider man'
-- movie.save() -- 저장까지 해줘야 db까지 바뀜
SELECT * FROM movies_movie
WHERE id=1;

-- UPDATE와 SET은 한 세트
UPDATE movies_movie 
SET title='iron man'
WHERE id=1;