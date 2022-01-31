# SELECT
## SELECT문의 구절
SELECT > FROM > WHERE > GROUP BY > HAVING > ORDER BY
* 순서가 바뀌어서는 안된다.

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