       IDENTIFICATION DIVISION.
       PROGRAM-ID. RelativeFileDemo.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT StudentFile ASSIGN TO "student.rel"
               ORGANIZATION IS RELATIVE
               RELATIVE KEY IS StudentRecNum
               FILE STATUS IS FileStatus.

       DATA DIVISION.
       FILE SECTION.
       FD StudentFile.
       01 StudentRecord.
          05 StudentID      PIC 9(4).
          05 StudentName    PIC X(20).

       WORKING-STORAGE SECTION.
       01 StudentRecNum    PIC 9(4).
       01 FileStatus       PIC XX.

       PROCEDURE DIVISION.
       Main-Para.
           OPEN I-O StudentFile
           IF FileStatus NOT = "00"
              OPEN OUTPUT StudentFile
              CLOSE StudentFile
              OPEN I-O StudentFile
           END-IF

           DISPLAY "Writing records to relative file..."

           MOVE 1 TO StudentRecNum
           MOVE 1001 TO StudentID
           MOVE "ALICE" TO StudentName
           WRITE StudentRecord
              INVALID KEY DISPLAY "WRITE ERROR 1, STATUS=" FileStatus.

           MOVE 2 TO StudentRecNum
           MOVE 1002 TO StudentID
           MOVE "BOB" TO StudentName
           WRITE StudentRecord
              INVALID KEY DISPLAY "WRITE ERROR 2, STATUS=" FileStatus.

           MOVE 3 TO StudentRecNum
           MOVE 1003 TO StudentID
           MOVE "CHARLIE" TO StudentName
           WRITE StudentRecord
              INVALID KEY DISPLAY "WRITE ERROR 3, STATUS=" FileStatus.

           DISPLAY "Reading records from relative file..."
           PERFORM VARYING StudentRecNum FROM 1 BY 1 UNTIL StudentRecNum > 3
               READ StudentFile
                   INVALID KEY DISPLAY "NO RECORD AT: " StudentRecNum
                   NOT INVALID KEY
                       DISPLAY "ID: " StudentID " NAME: " StudentName
               END-READ
           END-PERFORM

           CLOSE StudentFile
           STOP RUN.
