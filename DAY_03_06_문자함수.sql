-- 1. 대소문자 변환하기
SELECT UPPER('apple')
     , LOWER('APPLE')
     , INITCAP('apple computer')
FROM DUAL;

-- 2. 글자수/바이트수 반환하기
SELECT NAME
     , LENGTH(NAME) AS 글자수
     , LENGTHB(NAME) AS 바이트수
FROM EMP_T;

-- 3. 문자 연결하기
-- 1) || : 연결 연산자 (오라클에서만 사용 가능)
-- 2) CONCAT(A, B) : 연결 함수 (범용)
SELECT 'A' || 'B' || 'C'
     , CONCAT(CONCAT('A', 'B'), 'C')
FROM DUAL;

SELECT *
FROM EMP_T
WHERE NAME LIKE '한' || '%';

-- 4. 특정 문자의 위치 반환
-- 1) 문자의 위치는 1부터 시작한다.
-- 2) 못 찾으면 0을 반환한다.

SELECT NAME 
     , INSTR(NAME, '이')
FROM EMP_T;

-- 5. 일부 문자열 반환
SELECT NAME
     , SUBSTR(NAME, 1, 1) AS 성 -- 1번째 글자부터 1글자를 반환
     , SUBSTR(NAME ,2) AS 이름 -- 2번째 글자부터 끝까지 반환
FROM EMP_T;

-- 구*민, 김*서, 이*영, 한*일 이름 조회하기
SELECT SUBSTR(NAME, 1, 1) || '*' || SUBSTR(NAME, LENGTH(NAME)) AS 이름
FROM EMP_T;

-- 6. 찾아 바꾸기
SELECT REPLACE(DEPT_NAME, '부', '팀') AS 부서 -- '부'를 '팀'으로 바꾸기
FROM DEPT_T;

SELECT REPLACE(DEPT_NAME, '부', '') AS 부서 -- '부'를 ''으로 바꾸기
FROM DEPT_T;

-- 7. 채우기
-- 1) LPAD(EXPR1, N, [EXPR2]) : N자리의 EXPR1을 반환, 왼쪽에 EXPR2를 채움(생략하면 공백 채움)
-- 2) RPAD(EXPR1, N, [EXPR2]) : N자리의 EXPR1을 반환, 오른쪽에 EXPR2를 채움(생략하면 공백 채움)

SELECT LPAD(NAME, 10, '*') -- 10자리의(한글은 5자리)의 NAME 반환, 왼쪽에 '*' 채움
     , RPAD(NAME, 10, '*') -- 10자리의(한글은 5자리)의 NAME 반환, 오른쪽에 '*' 채움
FROM EMP_T;

-- 8. 공백 제거하기
-- 1) LTRIM(EXPR) : 왼쪽 공백 제거
-- 2) RTRIM(EXPR) : 오른쪽 공백 제거
-- 3) TRIM(EXPR) : : 양쪽 공백 제거
SELECT LTRIM('   HELLO   WORLD   ')
     , RTRIM('   HELLO   WORLD   ')
     , TRIM('   HELLO   WORLD   ')
FROM DUAL;