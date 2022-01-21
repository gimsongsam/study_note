# 산술 연산자
### +(숫자열 더하기 연산자)
**공지사항의 조회수를 조회하시오. 단 기존 값에 1을 더해서 조회하시오.**
```sql
SELECT HIT+1 FROM NOTICE;
```
* 그러나 위의 쿼리로 조회하였을때 컬럼이름이 HIT+1이 되는 문제가 발생한다.
    * 따라서 컬럼명을 "HIT"이 되도록 바꿔주어야한다.
```sql
SELECT HIT+1 AS HIT FROM NOTICE;
SELECT HIT+1 HIT FROM NOTICE;
```

* 또 한가지 문제는 +연산자는 문자열을 더하지 않고 숫자열만을 연산해준다.
```sql
SELECT 3+'1' FROM DUAL; 
-- 결과: 4
-- 문자열을 숫자열로 바꿔준다.
SELECT 1+'a' FROM DUAL;
-- 따라서 위와 같은 쿼리는 에러가 나게 된다.
```
* 따라서 문자열만을 전용으로 더해주는 연산자를 사용해야한다.

### ||(문자열 더하기 연산자)
```sql
SELECT '1'||3 FROM DUAL; -- 결과: 13
```
**모든 회원의 이름을 조회하시오. 단 이름은 ID를 붙여서 나타내시오. 예)홍길동(hong)**
```sql
SELECT NAME||'('||ID||')' NAME FROM MEMBER;
```
<br/>

# 비교 연산자
부호|뜻
|--|--
**=**|같다 
**!=, ^=, <>**|같지 않다.(표준인 !=를 사용하는 것을 추천)
**>, <**|~보다 작다, 크다
**>=, <=**| ~보다 작거나 같다, 크거나 같다
IS NULL | NULL인 값이다
IS NOT NULL | NULL이 아닌 값이다

<br />

**게시글 중에서 작성자가 'gildong'인 게시글만 조회하시오.**
```sql
SELECT * FROM NOTICE WHERE WRITE_ID = 'gildong';
```

**게시글 중에서 조회수가 3이 넘는 글만 조회하시오.**
```sql
SELECT * FROM NOTICE WHERE HIT > 3;
```

# 관계 연산자
부호종류|
|--
NOT
AND
OR
BETWEEN
IN

**조회수가 0, 1, 2인 게시글을 조회하시오**
```sql
SELECT * FROM NOTICE WHERE HIT = 0 OR HIT = 1 OR HIT = 2;
-- 효율적인 쿼리
SELECT * FROM NOTICE WHERE 0 <= HIT AND HIT <= 2;
SELECT * FROM NOTICE WHERE HIT BETWEEN 0 AND 2;
```

**조회수가 0, 2, 7인 게시글을 조회하시오**
```sql
SELECT * FROM NOTICE WHERE HIT=0 OR HIT=2 OR HIT=7;

-- 효율적인 쿼리
SELECT * FROM NOTICE WHERE HIT IN (0, 2, 7);
```

**조회수가 0, 2, 7가 아닌 게시글을 조회하시오**
```sql
SELECT * FROM NOTICE WHERE HIT NOT IN (0, 2, 7);
```

# 패턴 비교 연산자
부호|
|--
LIKE
%
_

**회원 중에서 '박'씨 성을 조회하시오.**
```sql
-- FALSE
SELECT * FROM MEMBER WHERE NAME = '박%'; -- 정말 '박&' 이라는 값을 가진 데이터를 찾기 시작한다.
SELECT * FROM MEMBER WHERE NAME LIKE '박%';
```

**회원 중에서 '박'씨이고 이름이 외자인 회원을 조회하시오**
```sql
SELECT * FROM WHERE NAME LIKE '박%_';
```
**회원 중에서 '박'씨 성을 제외한 회원을 조회하시오**
```sql
SELECT * FROM MEMBER WHERE NAME NOT LIKE '박%';
```
**회원 중에서 이름에 '도'자가 들어간 회원을 조회하시오.**
```sql
SELECT * FROM MEMBER WHERE NAME LIKE '%도%';
```