# 문자열 함수
## 문자열 추출함수
* SUBSTR(문자열, 시작위치, 길이)
```sql
SELECT SUBSTR('Hello', 1, 3) FROM DUAL; -- 1번째 문자부터 3번째의 문자까지 잘라 출력할 것이다.
SELECT SUBSTR('HELLO', 3) FROM DUAL; -- 3번째 문자까지 잘라 출력할 것이다.
SELECT SUBSTRB('HELLO', 3) FROM DUAL; -- 3바이트까지 잘라 출력할 것이다.
```
## 문자열 덧셈 함수
```sql
SELECT CONCAT('홍', '길동') FROM DUAL;
```
* 덧셈 함수를 사용해도 좋지만 문자열 연산이 좀 더 빠르다.
    * ```SELECT 3||'4' FROM DUAL```

## 문자열 트림 함수
```sql
SELECT LTRIM('   HELLO   ') FROM DUAL; -- 왼쪽의 공간을 없애준다.
SELECT RTRIM('   HELLO   ') FROM DUAL; -- 오른쪽의 공간을 없애준다.
SELECT TRIM('   HELLO   ') FROM DUAL;  -- 양쪽 공간을 없애준다.
```

## 문자열 소문자 또는 대문자로 변경하기
```sql
SELECT LOWER('ABcdE') FROM DUAL; -- 모든 글자를 소문자로 바꿔준다.
SELECT UPPER('abCDe') FROM DUAL; -- 모든 글자를 대문자로 바꿔준다.
```
* 대/소문자를 가리지 않고 아이디를 조회할때 사용할 수 있다.
```sql
SELECT * FROM MEMBER WHERE UPPER(MID)='ASDFVCXZ';
```

## 문자열 대치 함수
### REPLACE(문자열, 찾는 문자열, 대치할 문자열)
```sql
SELECT REPLACE('WHERE WE ARE', 'WE', 'YOU') FROM DUAL;
-- 두번째 파라미터의 값을 세번째 파라미터의 값으로 모두 바꾼다.
```
### TRANSLATE()
```sql
SELECT TRANSLATE('WHERE WE ARE', 'WE', 'YOU') FROM DUAL;
-- 두번째 파라미터의 각 문자열 인덱스 값을 세번째 파라미터의 각 문자열 인덱스 값으로 바꾼다.
```

## 문자열 패딩 함수
```sql
SELECT LPAD('HELLO', 5) FROM DUAL; -- 패딩 영역이 없기 때문에 문자가 출력되지 않는다.
SELECT LPAD('HELLO', 5, '0') FROM DUAL; -- HELLO
SELECT LPAD('HELLO', 10, '0') FROM DUAL; -- HELLO00000
SELECT RPAD('HELLO', 10, '0') FROM DUAL; -- 00000HELLO
```

## 숫자를 반환하는 문자열 함수
### 문자열 검색 함수 INSTR(문자열, 검색문자열, 위치, 찾을 수)
```sql
SELECT INSTR('ALL WE NEED TO IS JUST TO...', 'TO') FROM DUAL; -- 13
SELECT INSTR('ALL WE NEED TO IS JUST TO...', 'TO', 15) FROM DUAL; -- 24(두번째 'TO'의 위치)
SELECT INSTR('ALL WE NEED TO IS JUST TO...', 'TO', 1, 2) FROM DUAL; -- 24(두번째 'TO'의 위치)
```

**회원의 전화번호에서 두 번째 대시(-) 문자가 존재하는 위치를 출력하시오**
```sql
SELECT INSTR(PHONE, '-', 1, 2) FROM MEMBER;
```
**회원의 전화번호에서 첫 번째 대시(-) 문자와 두 번째 대시(-) 문자 사이의 간격을 구하시오**
```sql
SELECT INSTR(PHONE, '-', 1, 2) - INSTR(PHONE, '-', 1, 1) - 1 FROM MEMBER;
```
**회원의 전화번호에서 첫 번째 대시(-) 문자와 두 번째 대시(-) 문자 사이의 번호를 출력하시오**
```sql
SELECT SUBSTR(
    PHONE, INSTR(PHONE, '-', 1, 1)+1,
    INSTR(PHONE, '-', 1, 2) - INSTR(PHONE, '-', 1, 1) -1
) FROM MEMBER;
```

## 문자열 길이를 얻는 함수
```sql
SELECT LENGTH('WHERE WE ARE') FROM DUAL;
```
**모든 회원의 핸드폰 번호와 번호의 문자열 길이를 조회하시오**
```sql
SELECT PHONE, LENGTH(PHONE) FROM MEMBER;
```
**회원 전화번호 컬럼에 포함된 문자 '-'를 없앤 전화번호의 길이를 출력하시오.**
```sql
SELECT LENGTH(REPLACE(PHONE, '-', '')) FROM MEMBER;
```