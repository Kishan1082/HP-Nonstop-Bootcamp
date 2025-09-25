       IDENTIFICATION DIVISION.
       PROGRAM-ID. RelativeRandomDemo.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT StudentFile ASSIGN TO "student.rel"
               ORGANIZATION IS RELATIVE
               ACCESS MODE IS RANDOM
               RELATIVE KEY IS StudentRecNum
               FILE STATUS IS FileStatus.

       DATA DIVISION.
       FILE SECTION.
       FD StudentFile.
       01 StudentRecord.
          05 StudentID   PIC 9(4).
          05 StudentName PIC X(20).

       WORKING-STORAGE SECTION.
       01 StudentRecNum PIC 9(4).
       01 FileStatus    PIC XX.

       PROCEDURE DIVISION.
       Main-Para.
           *> Open file in I-O mode
           OPEN I-O StudentFile
           IF FileStatus NOT = "00"
              OPEN OUTPUT StudentFile
              CLOSE StudentFile
              OPEN I-O StudentFile
           END-IF

           *> Write records to specific relative positions
           MOVE 1 TO StudentRecNum
           MOVE 201 TO StudentID
           MOVE "DAVID" TO StudentName
           WRITE StudentRecord INVALID KEY DISPLAY "WRITE ERROR"

           MOVE 2 TO StudentRecNum
           MOVE 202 TO StudentID
           MOVE "EMMA" TO StudentName
           WRITE StudentRecord INVALID KEY DISPLAY "WRITE ERROR"

           MOVE 3 TO StudentRecNum
           MOVE 203 TO StudentID
           MOVE "FRANK" TO StudentName
           WRITE StudentRecord INVALID KEY DISPLAY "WRITE ERROR"

           *> Random read
           MOVE 2 TO StudentRecNum
           READ StudentFile
              INVALID KEY DISPLAY "NO RECORD AT " StudentRecNum
              NOT INVALID KEY DISPLAY "FOUND RECORD: " StudentID " " StudentName
           END-READ

           CLOSE StudentFile
           STOP RUN.
