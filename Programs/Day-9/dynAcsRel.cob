    >>SOURCE FORMAT FREE
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DynamicRelDemo.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT StudentFile ASSIGN TO "studentRel.dyn"
               ORGANIZATION IS RELATIVE
               ACCESS MODE IS DYNAMIC
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
       01 WS-EOF        PIC X VALUE "N".

       PROCEDURE DIVISION.
       Main-Para.

           OPEN I-O StudentFile
           IF FileStatus NOT = "00"
               OPEN OUTPUT StudentFile
               CLOSE StudentFile
               OPEN I-O StudentFile
           END-IF

           DISPLAY "Writing dynamic relative records..."

           MOVE SPACES TO StudentRecord
           MOVE 1 TO StudentRecNum
           MOVE 601 TO StudentID
           MOVE "DAVID" TO StudentName
           WRITE StudentRecord INVALID KEY DISPLAY "WRITE ERROR"

           MOVE SPACES TO StudentRecord
           MOVE 2 TO StudentRecNum
           MOVE 602 TO StudentID
           MOVE "EMMA" TO StudentName
           WRITE StudentRecord INVALID KEY DISPLAY "WRITE ERROR"

           *> Random read by relative key
           MOVE 2 TO StudentRecNum
           READ StudentFile
              INVALID KEY DISPLAY "NO RECORD AT " StudentRecNum
              NOT INVALID KEY DISPLAY "FOUND DYNAMIC REL: " StudentID " NAME: " FUNCTION TRIM(StudentName)
           END-READ

           *> Sequential read from start
           DISPLAY "Sequential read from start:"
           MOVE 1 TO StudentRecNum
           PERFORM UNTIL WS-EOF = "Y"
               READ StudentFile NEXT RECORD
                   AT END MOVE "Y" TO WS-EOF
                   NOT AT END DISPLAY "ID: " StudentID " NAME: " FUNCTION TRIM(StudentName)
               END-READ
           END-PERFORM

           CLOSE StudentFile
           STOP RUN.
           