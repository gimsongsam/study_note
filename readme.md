# 데이터 타입 종류
<!-- <div style="margin: 0 auto"> -->
type|Example
---|---|
Character| 'shKim'<br/>'A'<br/>'148'
Numeric|38<br/>3.85<br/>8.85F<br/>137
Date|'2022-01-13'
TIMESTAMP|'2022-01-13 10.38.29.00000'
<!-- <div> -->

<br/>
# 오라클 데이터 형식 1(문자형식)
## Character 형식
<strong> CHAR(50) (character)</strong>

    * 50개의 글자를 작성하지 않아도 50개의 공간을 차지하게 만든다.  
    * 50개의 공간을 차지하겠다라는 뜻이다.  
    * 따라서 크기가 고정적인 데이터에 사용하기가 좋지 않다. ex) 전화번호  
    * size -> 1byte  
    * 검색 속도가 빠르다.  
    
<strong> VARCHAR2(50) (variable character)</strong>

    * 얼마만큼 사용했는지 표시해주는 구분자를 사용하게 된다. 따라서 검색 속도가 느리다.
    * 최대 50개 까지라는 뜻이다.
    * 따라서 크기가 변할 수 있는 데이터에 사용하기가 좋다. ex) 아이디
    * size -> 1byte

<strong> NCHAR(3) (national character)</strong>

    * size -> 2 or 3 bytes. 따라서 메모리를 많이 사용하게 된다
    * 각국의 모든 언어를 표현할 수 있다. (UTF-8)

<strong> NVARCHAR(3) (variable national character)</strong>
    
    * 가변적인 national한 데이터를 뜻한다.

