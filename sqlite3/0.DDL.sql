-- SQLite
-- DDL(Data Definition Language, 데이터 정의어)

-- vsCode의 sqlite 확장 설치
-- Use Database => Run Query(전체 실행)
-- Rund Selected Query(선택 실행)
-- AUTOINCREMENT 문법이 다름 : 자동으로 id 생성해줌

-- 테이블 생성
CREATE TABLE test(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    age INTEGER
);

-- table 이름 변경
ALTER TABLE test RENAME TO user;

-- 컬럼 추가
ALTER TABLE user ADD COLUMN email TEXT;

-- 컬럼 이름 변경
ALTER TABLE user RENAME COLUMN name TO username;

-- 테이블 삭제
DROP TABLE user;