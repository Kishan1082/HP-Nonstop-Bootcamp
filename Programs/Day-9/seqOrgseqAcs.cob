       IDENTIFICATION DIVISION.
       PROGRAM-ID. SeqFileDemo.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT StudentFile ASSIGN TO "student.seq"
               ORGANIZATION IS SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS FileStatus.

       DATA DIVISION.
       FILE SECTION.
       FD StudentFile.
       01 StudentRecord.
          05 StudentID   PIC 9(4).
          05 StudentName PIC X(20).

       WORKING-STORAGE SECTION.
       01 FileStatus     PIC XX.
       01 WS-EOF         PIC X VALUE "N".

       PROCEDURE DIVISION.
       Main-Para.
           OPEN OUTPUT StudentFile
           MOVE 1001 TO StudentID
           MOVE "ALICE" TO StudentName
           WRITE StudentRecord
           MOVE 1002 TO StudentID
           MOVE "BOB" TO StudentName
           WRITE StudentRecord
           MOVE 1003 TO StudentID
           MOVE "CHARLIE" TO StudentName
           WRITE StudentRecord
           CLOSE StudentFile

           OPEN INPUT StudentFile
           PERFORM UNTIL WS-EOF = "Y"
               READ StudentFile
                   AT END MOVE "Y" TO WS-EOF
                   NOT AT END DISPLAY "ID: " StudentID " NAME: " StudentName
               END-READ
           END-PERFORM
           CLOSE StudentFile
           STOP RUN.
           
