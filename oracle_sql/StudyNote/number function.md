# 숫자 함수
## 절대값을 구하는 함수 ABS(n)
```sql
SELECT ABS(35), ABS(-35) FROM DUAL; -- 35 | 35
```
## 음수/양수를 알려주는 함수 SIGN(n)
```sql
SELECT SIGN(35), SIGN(-35), SIGN(0) FROM DAUL -- 1 | -1 | 0
```

## ROUND: 반올림
* ROUND(실수, 소숫점 이하 자리수)
* 실수를 반올림시켜서 지정한 소숫점 이하 자리수가 되게 만든다.
```sql
SELECT ROUND(12345.6789, 1) FROM DUAL -- 결과: 12345.7
SELECT ROUND(12345.6789, 0) FROM DUAL -- 결과: 12346
```

## TRUNC: 내림(버림)
* TRUNC(실수, 소숫점 이하 자릿수)
* 실수를 내림해서 지정한 소숫점 이하 자리수가 되게 만든다.
```sql
SELECT TRUNC(12345.6789, 1) FROM DUAL -- 결과: 12345.6
```

## CEIL: 올림한 정수
* CEIL(실수)
* 올림한 정수를 출력한다.
* ex) 게시판을 만들 때 총 페이지 계산을 위해서 사용.
    * (게시물 전체 갯수 / 한 페이지에 노출시키는 게시물의 갯수) 값을 CEIL 하면 총 페이지 갯수가 된다.
```sql
SELECT CEIL(12345.6789) FROM DUAL -- 결과: 12346
SELECT CEIL(12345.0) FROM DUAL -- 결과: 12345
```

## MOD: 나머지
* MOD(숫자, 나눌값)
* 나머지 값을 구해준다.
* 자바의 %와 유사하다.
```sql
SELECT MOD(10, 3) FROM DUAL -- 결과: 1
```

## POWER(n1, n2) / SQRT(n): 숫자의 제곱을 구하는 함수 / 제곱근을 구하는 함수
```
SELECT POWER(5, 2), SQRT(25) FROM DUAL; -- 25 | 5
```