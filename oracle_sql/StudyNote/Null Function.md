# Null 관련 함수
## NVL(NUL, 대체값)
* 반환 값이 NULL일 경우에 대체 값을 제공하는 함수
```sql
SELECT NVL(AGE, 0) FROM MEMBERS;

-- 나이대를 구함
SELECT TRUNC(NVL(AGE, 0)/10)*10 FROM MEMBER;
```
## NVL2(입력값, NOTNULL 대체값, NULL 대체값)
* NVL에서 조건을 하나 더 확장한 함수
```sql
-- NULL이 0이 아닐때만 'TRUNC(NVL(AGE/10)*10' 연산을 해주어라
SELECT NVL2(AGE, TRUNC(NVL(AGE/10)*10 ,0)) FROM MEMBER;
```
* 수행하는 횟수가 달라지게 된다.

## NULLIF(값1, 값2)
* 두 값이 같은 경우 NULL 그렇지 않을 경우 첫 번째 값 반환하는 함수
```sql
SELECT NULLIF(AGE, 19) FROM MEMEBER; -- AGE 칼럼이 19일 경우에 NULL로 바꿈
```

## DECODE(기준값, 비교값, 출력값, 바교값, 출력값)
```sql
SELECT DECODE(GENDER, '남성', 1, 2) FROM MEMBER;
-- gender의 값이 '남성'일 경우 1, 그렇지 않을 경우에는 2를 출력하게 함

SELECT DECODE(SUBSTR(PHONE, 1, 3),
                        '011', 'SK',
                        '016', 'KT',
                        '기타') FROM MEMBERS;
```
