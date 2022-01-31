# 변환함수
## NUMBER 형식을 문자열(VARCHAR2)로 변환 TO_CHAR(NUMBER)
```sql
SELECT TO_CHAR(12345678, '$99,999,999,999.99') FROM DUAL;
```
* 변환 포멧 파라미터는 숫자 길이 보다 길어야 한다.

**위의 식을 실행했을 때 나타나는 가격의 빈 공백을 없애고 출력하시오.**
```sql
SELECT TRIM(TO_CHAR(1234567, '9,999,999,999')) || '원' FROM DUAL;
SELECT TRIM(TO_CHAR(1234567.34567, '9,999,999,999.99')) || '원' FROM DUAL;
```

## DATE 형식을 문자열(VARCHAR2)로 변환 TO_CHAR(DATETIME)
```sql
SELECT TO_CHAR (SYSDATE, 'YY/MM/DD HH24:MI:SS') FROM DUAL;
```
* 정해진 포맷 문자열만 넣을 수 있다.

## 문자열을 날짜 형식으로 변환하는 함수 TO_DATE(문자열, 날짜포맷)
```sql
SELECT TO_DATE('1994-01-01 12:23:03', 'YYYY-MM-DD HH:MI:SS') FROM DAUL;
```
* 시, 분, 초 까지 표현하고 싶으면 포맷을 넣어주어 설명해주어야 오류가 나지 않는다.

## 문자열을 숫자형식으로 변환하는 함수 TO_NUMBER(문자열)
```sql
SELECT TO_NUMBER('2') + 3 FROM DUAL;
```