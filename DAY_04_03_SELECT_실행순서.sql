/*
    SELECT 문의 실행 순서
    
    1. FROM
    2. WHERE
    3. GROUP BY
    4. HAVING
    5. SELECT
    6. ORDER BY
*/

-- 1. 부서번호를 기준으로 오름차순 정렬하시오.
SELECT DEPART AS 부서번호  -- 2
FROM EMP_T -- 1
ORDER BY 부서번호; -- 3

-- 2. 부서별로 연봉 평균을 구하시오.
SELECT DEPART AS 부서번호, AVG(SALARY) AS 평균연봉 -- 3
FROM EMP_T -- 1
-- 실행순서때문에 DEPART를 부서번호라고 적을 수 없다.
GROUP BY DEPART; -- 2

-- 3. 부서별로 연봉 평균과 사원수를 조회하시오. 사원수가 2명 이상인 부서만 조회하시오. 평균연봉의 내림차순 정렬을 하시오.
SELECT DEPART AS 부서번호, AVG(SALARY) AS 평균연봉, COUNT(*) AS 사원수 -- 4
FROM EMP_T -- 1
GROUP BY DEPART -- 2
HAVING COUNT(*) >= 2 -- 3
ORDER BY 평균연봉 DESC; -- 5