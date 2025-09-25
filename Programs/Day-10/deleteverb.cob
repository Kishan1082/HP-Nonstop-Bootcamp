       IDENTIFICATION DIVISION.
       PROGRAM-ID. DeleteDemo.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENT ASSIGN TO "student.idx"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS RANDOM
               RECORD KEY IS STUDENT-ID
               FILE STATUS IS FS.

       DATA DIVISION.
       FILE SECTION.
       FD STUDENT.
       01 STUDENT-REC.
           05 STUDENT-ID      PIC 9(4).
           05 STUDENT-NAME    PIC A(12).
           05 STUDENT-CLASS   PIC X(3).

       WORKING-STORAGE SECTION.
       01 FS PIC XX.

       PROCEDURE DIVISION.
       Main-Para.

           OPEN I-O STUDENT
           IF FS NOT = "00"
               OPEN OUTPUT STUDENT
               CLOSE STUDENT
               OPEN I-O STUDENT
           END-IF

           MOVE 1000 TO STUDENT-ID

           *> DELETE using file name, not record name
           DELETE STUDENT
               INVALID KEY DISPLAY "Invalid Key"

           CLOSE STUDENT
           STOP RUN.
