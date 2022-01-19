-- 스칼라 서브쿼리(Scalar Subqueries)
SELECT '이영희' AS NAME,
	   (SELECT AGE FROM TB1
	    WHERE NAME = '이영희') AS AGE
FROM DUAL;


-- 인라인 뷰(Inline View)
SELECT AGE
  FROM (SELECT AGE FROM TB1
	WHERE NAME = '이영희');
    

-- 중첩 서브쿼리(Nested Subqueries) 
SELECT NAME, AGE
  FROM TB1
 WHERE NAME = (SELECT NAME FROM TB1
	       WHERE NAME = '이영희');