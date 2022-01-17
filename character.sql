CREATE TABLE MEMBER
(
    ID          VARCHAR2(50),
    PWD         VARCHAR2(50),
    NAME        VARCHAR2(50),
    -- �Ʒ��� ���� ������ ����Ͽ�����, 6byte���� �����Ƿ� ��ȿ�����̴�.
    -- GENDER      CHAR(2 CHAR), -- ����, ���� 
    -- �Ʒ��� ���� ������ ����Ͽ��� ����, 4byte�� �����Ƿ� �� �� ������ ������ �� �ִ�.
    GENDER NCHAR(2),
    AGE         NUMBER,
    BIRTHDAY    VARCHAR2(10), -- 2000-01-02
    PHONE       CHAR(13), -- 010-1234-2345
    REGDATE     DATE
);

-- 2byte�� �����Ͽ� insert���� ��, ������ �߻��Ѵٴ� ���� �� �� �ִ�.
INSERT INTO MEMBER (GENDER) VALUES('����');

-- ���̺��� �����ϰڴ�.
DROP TABLE MEMBER;

-- byte ���̸� �� �� �ִ� ����
SELECT LENGTHB(GENDER) FROM MEMBER;
SELECT LENGTHB('ab') FROM DUAL; -- ����� �� ���� �� 1byte��� ���� �� �� �ִ�.
SELECT LENGTHB('�ѱ�') FROM DUAL; -- �ѱ��� �� ���� �� 3byte��� ���� �� �� �ִ�.

-- �� ���� ��� ���� ����
SELECT * FROM NLS_DATABASE_PARAMETERS;

