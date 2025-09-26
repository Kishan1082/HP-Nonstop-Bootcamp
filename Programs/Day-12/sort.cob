       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT-FILE  ASSIGN TO 'input.dat'.
           SELECT OUTPUT-FILE ASSIGN TO 'output.dat'.
           SELECT WORK-FILE   ASSIGN TO 'work.tmp'.

       DATA DIVISION.
       FILE SECTION.
       FD INPUT-FILE.
           01 INPUT-STUDENT.
               05 STUDENT-ID-I   PIC 9(5).
               05 STUDENT-NAME-I PIC A(25).

       FD OUTPUT-FILE.
           01 OUTPUT-STUDENT.
               05 STUDENT-ID-O   PIC 9(5).
               05 STUDENT-NAME-O PIC A(25).

       SD WORK-FILE.
           01 WORK-STUDENT.
               05 STUDENT-ID-W   PIC 9(5).
               05 STUDENT-NAME-W PIC A(25).

       PROCEDURE DIVISION.
           SORT WORK-FILE
               ON ASCENDING KEY STUDENT-ID-W
               USING INPUT-FILE
               GIVING OUTPUT-FILE

           DISPLAY 'Sort Successful'
           STOP RUN.
