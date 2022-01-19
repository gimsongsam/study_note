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
**CHAR(50) (character)**

    * 50개의 글자를 작성하지 않아도 50개의 공간을 차지하게 만든다.  
    * 50개의 공간을 차지하겠다라는 뜻이다.  
    * 따라서 크기가 고정적인 데이터에 사용하기가 좋지 않다. ex) 전화번호  
    * size -> 1byte  
    * 검색 속도가 빠르다.  
    
**VARCHAR2(50) (variable character)**

    * 얼마만큼 사용했는지 표시해주는 구분자를 사용하게 된다. 따라서 검색 속도가 느리다.
    * 최대 50개 까지라는 뜻이다.
    * 따라서 크기가 변할 수 있는 데이터에 사용하기가 좋다. ex) 아이디
    * size -> 1byte

**NCHAR(3) (national character)**

    * size -> 2 or 3 bytes. 따라서 메모리를 많이 사용하게 된다
    * 각국의 모든 언어를 표현할 수 있다. (UTF-8)

**NVARCHAR(3) (variable national character)**
    
    * 가변적인 national한 데이터를 뜻한다.

**LONG**

    * 2기가까지 표현가능

**CLOB**
    
    * 대용량 텍스트 데이터 타입(최대 4Gbyte)

**NCLOB**

    * 대용량 텍스트 유니코드 데이터 타입(최대 4Gbyte)

<br/>

# 오라클 데이터 형식 2(숫자형식)  
## Numeric 형식
**NUMBER**

    * NUMBER(4)
        - 최대 4자로 이루어진 숫자
    * NUMBER(6, 2) 
        - 소수점 2자리를 포함하는 최대 6자리의 숫자(소수점 둘째 자리에서 반올림)
    * NUMBER(6, -2)
        - 소수점 -2자리에서 반올림하는 최대 6자리의 숫자
    * NUMBER 
        - 아무것도 쓰지 않으면 최대값인 38이 들어간 것으로 인식한다. 
        - NUMBER(38, *)
    * NUMBER(*, 5) 
        - 아무것도 쓰지 않으면 소숫점이 5자리 38이 들어간 것으로 인식한다. 
        - NUMBER(38, 5)


## Data 형식
**DATA**

    * 4712 BC ~ 9999 AD(ex: 01-JAN-99)

**TIMESTAMP**

    * NLS_TIMESTAMP_FORMAT 파라미터에 명시된 값을 따름

**TIMESTAMP WITH TIME ZONE**  

    * NLS_TIMESTAMP_TZ_FORMAT 파라미터에 명시된 값을 따름

**TIMESTAMP WITH LOCAL TIME ZONE**

    * NLS_TIMESTAMP_FORMAT 파라미터에 명시된 값을 따름