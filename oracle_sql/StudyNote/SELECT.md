# SELECT
## SELECT문의 구절
SELECT > FROM > WHERE > GROUP BY > HAVING > ORDER BY
* 순서가 바뀌어서는 안된다.

## 실행순서
FROM > CONNECT BY > WHERE > GROUP BY > HAVING > SELECT > ORDER BY
* 따라서 SELECT 문에서 만든 별칭은 앞쪽 구절들에서 사용할 수 없다.

<br />

# 정렬하기
## 정렬순서
ASC > DESC

**이름을 기준으로 역순으로 정렬해서 조회하시오**
```sql
-- 내림차 순으로 정렬해주겠다.
SELECT * FROM MEMBER ORDER BY NAME DESC
```
**회원 중에서 '박'씨 성을 가진 회원을 조회하시오. 단 나이를 (오름차)순으로 정렬.**
```sql
SELECT * FROM MEMBER WHERE NAME LIKE '박%' ORDER BY AGE ASC;
-- 반드시 where 절 다음 order by를 사용해야한다.

SELECT * FROM NOTICE ORDER BY HIT DESC, REGDATE DESC;
-- 2차 정렬도 할 수 있다. HIT가 큰수 > 가입일자가 큰 순서로 정렬이 된다.
```

<br />

# 집계함수
## COUNT
```sql
SELECT COUNT(TITLE) FROM NOTICE;
```
* Null의 값은 제외하고 카운트한다.

## SUM
* 칼럼의 모든 값을 합친다.
```sql
SELECT SUM(HIT) FROM NOTICE;
```

## AVG
* 칼럼의 모든 값의 평균을 구해준다.
```sql
SELECT AVG(HIT) FROM NOTICE;
```

## GROUP BY
* 유형별로 값을 집계해서 보여줌
```sql
SELECT WRITER_ID, COUNT(ID) COUNT FROM NOTICE GROUP BY WRITER_ID;

SELECT WRITER_ID, COUNT(ID) COUNT 
FROM NOTICE 
GROUP BY WRITER_ID 
ORDER BY COUNT DESC;
```

**회원별 게시글 수를 조회하시오. 단 게시글이 2이하인 레코드만 출력하시오**
```sql
-- bad query
SELECT WRITER_ID, COUNT(N.ID)
FROM NOTICE N
WHERE COUNT(N.ID) < 2 -- 실행순서에 따라서 GROUP BY 이후에만 쓸 수 있다. WHERE 절에서는 사용할 수 없다.
GROUP BY WRITER_ID


-- answer query
SELECT WRITER_ID, COUNT(N.ID)
FROM NOTICE N
GROUP BY WRITER_ID
HAVING COUNT(N.ID) < 2; -- 2미만인 아이디만 필터링
```

## ROW_NUMBER()
* 아래와 같은 쿼리를 실행하게 되면 ORDER BY에 의해 ROWNUM이 순서대로 붙지 않고 섞여서 붙게 된다.
```sql
SELECT ROWNUM, ID, TITILE, WRITER_ID, REGDATE, HIT
FROM NOTICE
ORDER BY HIT;
```
* 따라서 ROW_NUMBER 함수를 사용하면 일련번호를 붙일 수가 있다.
```sql
SELECT ROW_NUMBER() OVER (ORDER BY HIT), ID, TITLE, WRITER_ID, REGDATE, HIT
FROM NOTICE;
```

## RANK()
* 정렬된 상태에서의 등수를 붙이고 싶을때 사용한다.
* 값이 같다면 같은 등수가 매겨지게 된다.
* 마지막 등수는 반드시 행의 총 갯수와 같아지게 된다.
```sql
SELECT RANK() OVER (ORDER BY HIT), ID, TITLE, WRITER_ID, REGDATE, HIT
FROM NOTICE;
```

## DENSE_RANK()
* 공동 순위가 생겨도 그 다음 순위는 이전 순위에 +1이 되게 된다.
```sql
SELECT DENSE_RANK() OVER (ORDER BY HIT), ID, TITLE, WRITER_ID, REGDATE, HIT
FROM NOTICE;

-- 파트별로 나누어 등수를 매길 수 있다.
SELECT DENSE_RANK() OVER (PARTITION BY WRITER_ID ORDER BY HIT), ID, TITLE, WRITER_ID, REGDATE, HIT
FROM NOTICE;
```

## SUBQUERY
**최신 등록순으로 정렬한 결과에서 상위 열명을 출력하시오**
```sql
-- bad query: 순서 때문에 오류가 나게 된다.
SELECT * FROM MEMBER ORDER BY REGDATE DESC
WHERE ROWNUM BETWEEN 1 AND 10

-- answer query
SELECT * 
FROM (SELECT * FROM MEMBER ORDER BY REGDATE DESC) -- 격자 형태의 데이터, 정렬된 데이터
WHERE ROWNUM BETWEEN 1 AND 10
```
* 괄호 안에 있는 쿼리부터 연산하게 된다.

**나이가 평균나이 이상인 회원 목록을 조회하시오.**
```sql
SELECT * FROM MEMBER
WHERE AGE >= (SELECT AVG(AGE) FROM MEMBER)
```
