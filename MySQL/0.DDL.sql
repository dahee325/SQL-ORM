-- SQL에서는 키워드는 대문자 사용, ;으로 끝나야 마무리
-- 데이터베이스가 있어야함

-- Schema 선택 명령어 : 저장하고싶은 파일 선택
USE mydb;

-- 테이블 생성
-- sql에서는 요소 지정할 때 마지막에 ,가 있으면 안됌
CREATE TABLE test (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name TEXT,
    age INTEGER
);

-- table 이름 변경
-- test 테이블 이름을 user로 변경
ALTER TABLE test RENAME To user;

-- 컬럼 추가
ALTER TABLE user ADD COLUMN email TEXT;

-- 컬럼 이름 수정
ALTER TABLE user CHANGE name username TEXT;

-- 테이블 삭제
DROP TABLE user;