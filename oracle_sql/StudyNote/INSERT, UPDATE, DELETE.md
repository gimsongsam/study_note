# INSERT 쿼리 문법
* 테이블에 데이터를 추가한다.
```sql
-- 기본 형태
INSERT INTO 테이블명(컬럼명1, 컬럼명2, 컬럼명3) VALUES ('값1', '값2', '값3' ...);

-- 칼럼 생략
INSERT INTO 테이블명 VALUES('값1', '값2', '값3' ...)
-- 이때는 모든 칼럼 수에 맞춰 값을 작성해주어야한다.
```
<br>

# UPDATE 쿼리 문법
* 기존 데이터를 새로운 데이터로 바꿔준다.
```sql
UPDATE MEMBER SET PWD='333', NAME='GG' WHERE ID='BBBBB';
```

<br>

# DELETE 쿼리 문법
* 조건에 맞는 데이터 정보를 삭제해준다.
```sql
DELETE MEMBER WHERE ID='ASDF'
```