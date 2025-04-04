-- 데이터 삭제
-- movie = Movie.objects.get(id=1)
-- movie.delete() -- delete는 저장하지 않아도 됨

DELETE FROM movies_movie
WHERE id=2;

SELECT * FROM movies_movie;