-- Create Database
CREATE DATABASE DEBBYFIELD_SCHOOL;

-- Use the Database
USE DEBBYFIELD_SCHOOL;

-- Create Tables
CREATE TABLE STUDENTS (
    STUDENT_ID INT PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    DATE_OF_BIRTH DATE,
    GENDER VARCHAR(10),
    CONTACT_INFO VARCHAR(100),
    ENROLLMENT_DATE DATE,
    GRADE_LEVEL VARCHAR(10)
);

CREATE TABLE TEACHERS (
    TEACHER_ID INT PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    SUBJECT_TAUGHT VARCHAR(50),
    EMAIL VARCHAR(100),
    PHONE_NUMBER VARCHAR(15)
);

CREATE TABLE COURSES (
    COURSE_ID INT PRIMARY KEY AUTO_INCREMENT,
    COURSE_NAME VARCHAR(50),
    TEACHER_ID INT,
    FOREIGN KEY (TEACHER_ID) REFERENCES TEACHERS(TEACHER_ID)
);

CREATE TABLE ENROLLMENTS (
    ENROLLMENT_ID INT PRIMARY KEY AUTO_INCREMENT,
    STUDENT_ID INT,
    COURSE_ID INT,
    FOREIGN KEY (STUDENT_ID) REFERENCES STUDENTS(STUDENT_ID),
    FOREIGN KEY (COURSE_ID) REFERENCES COURSES(COURSE_ID)
);

CREATE TABLE ATTENDANCE (
    ATTENDANCE_ID INT PRIMARY KEY AUTO_INCREMENT,
    STUDENT_ID INT,
    DATE DATE,
    STATUS VARCHAR(10),
    FOREIGN KEY (STUDENT_ID) REFERENCES STUDENTS(STUDENT_ID)
);

CREATE TABLE GRADES (
    GRADE_ID INT PRIMARY KEY AUTO_INCREMENT,
    STUDENT_ID INT,
    COURSE_ID INT,
    EXAM_SCORE DECIMAL(5, 2),
    ASSIGNMENT_SCORE DECIMAL(5, 2),
    FINAL_GRADE DECIMAL(5, 2),
    FOREIGN KEY (STUDENT_ID) REFERENCES STUDENTS(STUDENT_ID),
    FOREIGN KEY (COURSE_ID) REFERENCES COURSES(COURSE_ID)
);

CREATE TABLE PAYMENTS (
    PAYMENT_ID INT PRIMARY KEY AUTO_INCREMENT,
    STUDENT_ID INT,
    AMOUNT DECIMAL(10, 2),
    DATE DATE,
    PAYMENT_STATUS VARCHAR(10),
    FOREIGN KEY (STUDENT_ID) REFERENCES STUDENTS(STUDENT_ID)
);