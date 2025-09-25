       IDENTIFICATION DIVISION.
       PROGRAM-ID. Hello.

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

           *> Set the key to read
           MOVE 1000 TO STUDENT-ID

           READ STUDENT
               KEY IS STUDENT-ID
               INVALID KEY DISPLAY "KEY NOT EXISTING"
           END-READ

           *> Update the record
           MOVE "Tim Dumais" TO STUDENT-NAME
           MOVE "10A" TO STUDENT-CLASS
           REWRITE STUDENT-REC

           CLOSE STUDENT
           STOP RUN.
