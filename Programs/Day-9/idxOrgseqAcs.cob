       IDENTIFICATION DIVISION.
       PROGRAM-ID. IndexedFileDemo.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT StudentFile ASSIGN TO "student.idx"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS SEQUENTIAL
               RECORD KEY IS StudentID
               ALTERNATE RECORD KEY IS StudentName
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
           OPEN I-O StudentFile
           IF FileStatus NOT = "00"
              OPEN OUTPUT StudentFile
              CLOSE StudentFile
              OPEN I-O StudentFile
           END-IF

           MOVE 2001 TO StudentID
           MOVE "DAVID" TO StudentName
           WRITE StudentRecord

           MOVE 2002 TO StudentID
           MOVE "EMMA" TO StudentName
           WRITE StudentRecord

           MOVE 2003 TO StudentID
           MOVE "FRANK" TO StudentName
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
