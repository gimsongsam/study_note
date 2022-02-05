# JOIN
* 서로 참조하는 테이블을 하나로 연결시켜 보여주기 위해 사용함
### 예시:  

**USER_LIST Table**
ID|NAME
|--|--
YJS|유재석
JUNG|정형돈
KANG|강호동

<br>

**POST_LIST Table**
ID|TITLE|WRITER_ID
|--|--|--
1|Oracle 개요|YJS
2|SQL 구문|YJS
3|DML 사용하기|DRAGON

* post table에서 3번 WRITER_ID의 값은 User Table에서 조회할 수 없다.

<br>

## INNER JOIN
* SELECT * FROM 테이블1 INNER JOIN 테이블2 ON 테이블1.컬럼 = 테이블2.컬럼
* ON 뒤에 조건이 맞는 내용만 가져온다.
### 예시
```sql
SELECT * FROM USER_LIST INNER JOIN POST_LIST ON USER_LIST.ID = POST_LIST.WRITER_ID
```
**결과:**
ID|NAME|ID|TITLE|WRITER_ID
|--|--|--|--|--|
YJS|유재석|1|Oracle 개요|YJS
YJS|유재석|2|SQL 구문|YJS

<br>

## LEFT, RIGHT, OUTER JOIN
* outer join은 한쪽 테이블에 값이 있을 경우에 다른쪽 테이블이 조건에 맞지 않아도 가져온다.
* right는 오른쪽, left는 왼쪽 테이블에 값이 있을 경우 반대 테이블이 조건에 맞지 않아도 가져온다.
    * 따라서 조건에 맞는 값은 양쪽 테이블 모두의 값을 가져오고, 각 테이블에 값이 없으면 반대쪽 테이블을 비워서 값을 가져오게 된다.
### 예시
```sql
SELECT * FROM USER_LIST LEFT OUTER JOIN POST_LIST ON USER_LIST.ID = POST_LIST.WRITER_ID
```
ID|NAME|ID|TITLE|WRITER_ID
|--|--|--|--|--|
YJS|유재석|1|Oracle 개요|YJS
YJS|유재석|2|SQL 구문|YJS
JUNG|정형돈|(null)|(null)|(null)
KANG|강호동|(null)|(null)|(null)

```sql
SELECT * FROM USER_LIST RIGHT OUTER JOIN POST_LIST ON USER_LIST.ID = POST_LIST.WRITER_ID
```
**결과:**
ID|NAME|ID|TITLE|WRITER_ID
|--|--|--|--|--|
YJS|유재석|1|Oracle 개요|YJS
YJS|유재석|2|SQL 구문|YJS
(null)|(null)|3|DML 사용하기|DRAGON

## FULL OUTER JOIN
* 어느 한쪽 테이블에 값이 있을 경우 다른 테이블과 조건이 맞지 않아도 모두 가져온다.

ID|NAME|ID|TITLE|WRITER_ID
|--|--|--|--|--|
YJS|유재석|1|Oracle 개요|YJS
YJS|유재석|2|SQL 구문|YJS
JUNG|정형돈|(null)|(null)|(null)
KANG|강호동|(null)|(null)|(null)
(null)|(null)|3|DML 사용하기|DRAGON

## SELF JOIN
**ex) 부서장이 관리하고 있는 부서원들을 출력하시오**

### 예시:  

**USER_LIST Table**
ID|NAME|BOSS_ID
|--|--|--
YJS|유재석|yong
JUNG|정형돈|yong
KANG|강호동|(null)
yong|김용만|(null)

```sql
SELECT M.*, B.NAME BOSS_NAME
FROM MEMBER M LEFT OUTER JOIN MEMBER B ON B.ID = M.BOSS_ID;
```

### 결과:
**USER_LIST Table**
ID|NAME|BOSS_ID|BOSS_NAME
|--|--|--|--
YJS|유재석|yong|김용만
JUNG|정형돈|yong|김용만
KANG|강호동|(null)|(null)
yong|김용만|(null)|(null)

## UNION
* 두개의 레코드를 하나로 합친다.
* 중복된 데이터의 경우, 하나로 합친다.
```sql
SELECT ID, NAME FROM MEMBER
    UNION
SELECT WRITER_ID, TITLE FROM NOTICE;
```

## UNION ALL
* 두개의 레코드를 하나로 합친다.
* 중복된 데이터를 모두 보여준다.

## MINUS
* 중복된 값을 삭제하여 보여준다.

## INTERSECT
* 공통된 값만 남겨둔다.