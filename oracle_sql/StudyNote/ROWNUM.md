# ROWNUM
**회원 목록에서 상위 5명만 조회하시오.**
```sql
SELECT * FROM MEMBER WHERE ROWNUM BETWEEN 1 AND 5
```
**목록에서 6 ~ 10번 까지 조회하시오**  
* **아무것도 조회되지 않는 Bad Query**
```sql
SELECT * FROM MEMBER WHERE ROWNUM BETWEEN 6 AND 10
```
* ROWNUM은 SELECT문이 실행될 때 첫번째 행 부터 ROWNUM을 1부터 매기게 된다.
* 만약, ROWNUM이 1인 첫번째 행을 검사했을 때, 5보다 크다는 조건에 해당하지 않기 때문에 삭제한다.
* 그래서 두번째 행이 바로 ROWNUM이 1이 되기때문에 ROWNUM은 증가하지 않는다.
* 따라서 ROWNUM이 5보다 크다는 조건에 그 어느 행도 해당될 수 없으므로 아무것도 조회가 되지 않는다.

* **정답 Query**
```sql
SELECT * FROM (
    SELECT ROWNUM, NOTICE.* FROM NOTICE -- ROWNUM, NOTICE 테이블 join
) WHERE ROWNUM BETWEEN 1 AND 5;

```
# ROW_NUMBER()
* ORDER_BY 된 결과에 순번을 매갤때에는 ROWNUM 보다 ROW_NUMBER() 함수가 더 편하다.
```sql
SELECT ROW_NUMBER() OVER(ORDER BY EX.NAME, EX.AGE) AS ROW_NUM
        , EX.*
    FROM USER AS EX
    ORDER BY EX.NAME, EX.AGE
```

* 그룹별(PARTITION)로 순번을 따로 부여할 수 있다.
```sql
SELECT ROW_NUMBER() OVER(PARTITION BY EX.AGE ORDER BY EX.AGE, EX.NAME) AS ROW_NUM
        , EX.*
    FROM USER AS EX
    ORDER BY EX.NAME, EX.AGE
```
