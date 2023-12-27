-- 부서 테이블
CREATE TABLE DEPARTMENT_T (
    DEPT_NO VARCHAR2(15 BYTE) NOT NULL PRIMARY KEY,
    DEPT_NAME VARCHAR2(30 BYTE),
    DEPT_LOCATION VARCHAR2(50 BYTE)
);

-- 사원 테이블
CREATE TABLE EMPLOYEE_T (
    EMP_NO NUMBER NOT NULL PRIMARY KEY,
    DEPT_NO VARCHAR2(15 BYTE) REFERENCES DEPARTMENT_T(DEPT_NO) ON DELETE SET NULL,
    POSITION CHAR(10 BYTE),
    NAME VARCHAR2(15 BYTE),
    HIRE_DATE DATE,
    SALARY NUMBER
);

-- 프로젝트 테이블
CREATE TABLE PROJECT_T (
    PJT_NO NUMBER NOT NULL PRIMARY KEY,
    PJT_NAME VARCHAR2(30 BYTE),
    BEGIN_DATE DATE,
    END_DATE DATE
);

-- 진행 테이블
CREATE TABLE PROCEEDING_T (
    PCD_NO NUMBER NOT NULL PRIMARY KEY,
    EMP_NO NUMBER REFERENCES EMPLOYEE_T(EMP_NO) ON DELETE CASCADE,
    PJT_NO NUMBER REFERENCES PROJECT_T(PJT_NO) ON DELETE SET NULL,
    PJT_STATE NUMBER NOT NULL
);

-- 진행 테이블 삭제
DROP TABLE PROCEEDING_T;
-- 프로젝트 테이블 삭제
DROP TABLE PROJECT_T;
-- 사원 테이블 삭제
DROP TABLE EMPLOYEE_T;
-- 부서 테이블 삭제
DROP TABLE DEPARTMENT_T;