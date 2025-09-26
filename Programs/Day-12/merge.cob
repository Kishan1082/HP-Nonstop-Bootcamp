       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT1     ASSIGN TO 'in1.dat'.
           SELECT INPUT2     ASSIGN TO 'in2.dat'.
           SELECT OUTPUT-FILE ASSIGN TO 'out.dat'.
           SELECT WORK-FILE   ASSIGN TO 'wrk.tmp'.

       DATA DIVISION.
       FILE SECTION.
       FD INPUT1.
           01 INPUT1-STUDENT.
               05 STUDENT-ID-I1   PIC 9(5).
               05 STUDENT-NAME-I1 PIC A(25).

       FD INPUT2.
           01 INPUT2-STUDENT.
               05 STUDENT-ID-I2   PIC 9(5).
               05 STUDENT-NAME-I2 PIC A(25).

       FD OUTPUT-FILE.
           01 OUTPUT-STUDENT.
               05 STUDENT-ID-O   PIC 9(5).
               05 STUDENT-NAME-O PIC A(25).

       SD WORK-FILE.
           01 WORK-STUDENT.
               05 STUDENT-ID-W   PIC 9(5).
               05 STUDENT-NAME-W PIC A(25).

       PROCEDURE DIVISION.
           MERGE WORK-FILE
               ON ASCENDING KEY STUDENT-ID-W
               USING INPUT1 INPUT2
               GIVING OUTPUT-FILE

           DISPLAY 'Merge Successful'
           STOP RUN.
