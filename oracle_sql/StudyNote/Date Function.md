# 날짜 함수
## 현재 시간을 얻는 함수
```sql
SELECT SYSDATE, -- 년,월,일,시,분,초
        CURRENT_DATE, -- 접속자의 시간
        SYSTIMESTAMP, -- 년,월,일,시,분,초,밀리세컨드
        CURRENT_TIMESTAMP -- 접속자의 년,월,일,시,분,초,밀리세컨드
FROM DUAL;
```

## 세션 시간과 포맷 변경
* 출력할 때의 형태를 바꿀 수 있다.
```sql
ALTER SESSION SET TIME_ZONE = '09:00'; -- 해당 나라의 Time zone을 바꿀 수 있다.
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
```

## 날짜 추출함수
### EXTRACT(YEAR/MONTH/DAY/HOUR/MINUTE/SECOND FROM ...)
```sql
SELECT EXTRACT(YEAR FROM SYSDATE) FROM DUAL;
SELECT EXTRACT(MONTH FROM SYSDATE) FROM DUAL;
SELECT EXTRACT(DAY FROM SYSDATE) FROM DUAL;
SELECT EXTRACT(MINUTE FROM SYSDATE) FROM DUAL;
SELECT EXTRACT(SECOND FROM SYSDATE) FROM DUAL;
```

**가입 회원 중에 비수기(2,3,11,12)월 달에 가입한 회원을 조회하시오.**
```sql
SELECT * FROM MEMBER WHERE EXTRACT (MONTH FROM REGDATE) IN (2, 3, 11, 12);
```

## 날짜를 누적하는 함수
### ADD_MONTH(날짜, 정수)
```sql
SELECT ADD_MONTHS(SYSDATE, 1) FROM DUAL;
SELECT ADD_MONTHS(SYSDATE, -1) FROM DUAL;
```
**가입 회원 중에 가입한지 6개월이 안 되는 회원을 조회하시오**
```sql
SELECT * FROM MEMBER WHERE ADD_MONTHS (SYSDATE, - 6) < REGDATE;
```
## 날짜의 차이를 알아내는 함수 MONTHS_BETWEEN(날짜, 날짜)
```sql
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2013-12-25')) FROM DUAL;
```
**가입 회원 중에 가입한지 6개월이 안 되는 회원을 조회하시오**
```sql
SELECT * FROM MEMBER WHERE MONTHS_BETWEEN(SYSDATE, REGDATE) < 6;
```

## 다음 요일을 알려주는 함수 NEXT_DAY(현재날짜, 다음요일)
**돌아오는 다음 요일의 날짜**
```sql
SELECT NEXT_DAY(SYSDATE, '토요일') FROM DUAL;
SELECT NEXT_DAY(SYSDATE, '토') FROM DUAL;
SELECT NEXT_DAY(SYSDATE, 7) FROM DUAL;
```
## 월의 마지막 일자를 알려주는 함수 LAST_DAY(날짜)
```sql
SELECT LAST_DAY (ADD_MONTHS(SYSDATE, 1)) FROM DUAL; -- 다음달의 마지막 날짜를 알려줌
```