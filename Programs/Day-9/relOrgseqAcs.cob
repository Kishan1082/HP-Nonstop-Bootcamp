       IDENTIFICATION DIVISION.
       PROGRAM-ID. RelativeFileDemo.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT StudentFile ASSIGN TO "student.rel"
               ORGANIZATION IS RELATIVE
               ACCESS MODE IS SEQUENTIAL
               RELATIVE KEY IS StudentRecNum
               FILE STATUS IS FileStatus.

       DATA DIVISION.
       FILE SECTION.
       FD StudentFile.
       01 StudentRecord.
          05 StudentID   PIC 9(4).
          05 StudentName PIC X(20).

       WORKING-STORAGE SECTION.
       01 StudentRecNum  PIC 9(4).
       01 FileStatus     PIC XX.
       01 WS-EOF         PIC X VALUE "N".

       PROCEDURE DIVISION.
       Main-Para.
           OPEN I-O StudentFile
           IF FileStatus NOT = "00"
              OPEN OUTPUT StudentFile
              CLOSE StudentFile
              OPEN I-O StudentFile
           END-IF

           MOVE 1 TO StudentRecNum
           MOVE 3001 TO StudentID
           MOVE "GEORGE" TO StudentName
           WRITE StudentRecord

           MOVE 2 TO StudentRecNum
           MOVE 3002 TO StudentID
           MOVE "HANNAH" TO StudentName
           WRITE StudentRecord

           MOVE 3 TO StudentRecNum
           MOVE 3003 TO StudentID
           MOVE "IAN" TO StudentName
           WRITE StudentRecord

           CLOSE StudentFile

           OPEN INPUT StudentFile
           PERFORM UNTIL WS-EOF = "Y"
               READ StudentFile NEXT RECORD
                   AT END MOVE "Y" TO WS-EOF
                   NOT AT END DISPLAY "ID: " StudentID " NAME: " StudentName
               END-READ
           END-PERFORM
           CLOSE StudentFile
           STOP RUN.
