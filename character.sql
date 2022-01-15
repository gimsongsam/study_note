CREATE TABLE MEMBER
(
    ID          VARCHAR2(50),
    PWD         VARCHAR2(50),
    NAME        VARCHAR2(50),
    -- 아래와 같은 쿼리를 사용하였을때, 6byte으로 나오므로 비효율적이다.
    -- GENDER      CHAR(2 CHAR), -- 남성, 여성 
    -- 아래와 같은 쿼리를 사용하였을 때는, 4byte가 나오므로 좀 더 공간을 절약할 수 있다.
    GENDER NCHAR(2),
    AGE         NUMBER,
    BIRTHDAY    VARCHAR2(10), -- 2000-01-02
    PHONE       CHAR(13), -- 010-1234-2345
    REGDATE     DATE
);

-- 2byte로 설정하여 insert했을 때, 오류가 발생한다는 것을 알 수 있다.
INSERT INTO MEMBER (GENDER) VALUES('남성');

-- 테이블을 삭제하겠다.
DROP TABLE MEMBER;

-- byte 길이를 알 수 있는 쿼리
SELECT LENGTHB(GENDER) FROM MEMBER;
SELECT LENGTHB('ab') FROM DUAL; -- 영어는 한 글자 당 1byte라는 것을 알 수 있다.
SELECT LENGTHB('한글') FROM DUAL; -- 한글은 한 글자 당 3byte라는 것을 알 수 있다.

-- 각 국의 언어 지원 여부
SELECT * FROM NLS_DATABASE_PARAMETERS;

