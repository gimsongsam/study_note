# 정규 표현식
* [정규식 테스터](https://regexlib.com/RETester.aspx?AspxAutoDetectCookieSupport=1)

REGEXP_LIKE
* 정규식 표현을 사용하려면 WHERE문에 LIKE()가 아닌 REGEX_LIKE()를 넣어주어야한다.
* SELECT * FROM DUAL WHERE REGEX_LIKE(first_name, '^Ste(V|ph)en$')
* ^ -> 시작, $ -> 끝을 뜻한다.

**전화번호가 포함된 제목을 찾으시오**
```sql
SELECT * FROM NOTICE WHERE TITLE LIKE `^01[016-9]-\d{3,4}-\d{4}$';
```

