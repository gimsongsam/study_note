INSERT INTO MEMBER(ID, PWD) VALUES('ASDF', '111');
INSERT INTO MEMBER(ID, PWD) VALUES('asdf', '111');
SELECT * FROM MEMBER; -- 전체 데이터를 조회하겠다.
SELECT id as user_id, name, pwd FROM MEMBER; -- 쿼리문을 통해 컬럼 이름을 변경해 조회하는 방법 user_id를 별칭으로 정해줌
SELECT id user_id, name, pwd FROM MEMBER; -- as 생략가능
SELECT id "USER ID", name, pwd FROM MEMBER; -- 빈 공간 이름 설정시

UPDATE MEMBER SET PWD='333', NAME='GG' WHERE ID='BBBBB';
DELETE MEMBER WHERE ID='ASDF'