       IDENTIFICATION DIVISION.
       PROGRAM-ID. IndexedRandomDemo.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT StudentFile ASSIGN TO "student.idx"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS RANDOM
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
       01 FileStatus    PIC XX.

       PROCEDURE DIVISION.
       Main-Para.

           *> Open file in I-O mode, create if it doesn't exist
           OPEN I-O StudentFile
           IF FileStatus NOT = "00"
               OPEN OUTPUT StudentFile
               CLOSE StudentFile
               OPEN I-O StudentFile
           END-IF

           DISPLAY "Writing records randomly..."

           *> Initialize and write first record
           MOVE SPACES TO StudentRecord
           MOVE 1010 TO StudentID
           MOVE "ALICE" TO StudentName
           WRITE StudentRecord INVALID KEY DISPLAY "WRITE ERROR 1, STATUS=" FileStatus

           *> Initialize and write second record
           MOVE SPACES TO StudentRecord
           MOVE 1020 TO StudentID
           MOVE "BOB" TO StudentName
           WRITE StudentRecord INVALID KEY DISPLAY "WRITE ERROR 2, STATUS=" FileStatus

           *> Initialize and write third record
           MOVE SPACES TO StudentRecord
           MOVE 1030 TO StudentID
           MOVE "CHARLIE" TO StudentName
           WRITE StudentRecord INVALID KEY DISPLAY "WRITE ERROR 3, STATUS=" FileStatus

           DISPLAY "Random read by primary key..."

           *> Random read by primary key
           MOVE 1020 TO StudentID
           READ StudentFile
               INVALID KEY DISPLAY "RECORD NOT FOUND"
               NOT INVALID KEY DISPLAY "FOUND BY ID: " StudentID " NAME: " FUNCTION TRIM(StudentName)
           END-READ

           DISPLAY "Random read by alternate key..."

           *> Random read by alternate key
           MOVE "CHARLIE" TO StudentName
           READ StudentFile KEY IS StudentName
               INVALID KEY DISPLAY "RECORD NOT FOUND"
               NOT INVALID KEY DISPLAY "FOUND BY NAME: " StudentID " NAME: " FUNCTION TRIM(StudentName)
           END-READ

           *> Close the file explicitly
           CLOSE StudentFile

           STOP RUN.
