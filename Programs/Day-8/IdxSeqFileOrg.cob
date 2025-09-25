       >>SOURCE FORMAT FREE
       IDENTIFICATION DIVISION.
       PROGRAM-ID. IDXFILE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMP-FILE ASSIGN TO "employees.dat"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS DYNAMIC
               RECORD KEY IS EMP-ID
               ALTERNATE RECORD KEY IS EMP-NAME
                   WITH DUPLICATES.

       DATA DIVISION.
       FILE SECTION.
       FD EMP-FILE.
       01 EMP-REC.
           05 EMP-ID     PIC 9(3).
           05 EMP-NAME   PIC X(20).

       WORKING-STORAGE SECTION.
       01 WS-EOF      PIC X VALUE "N".

       PROCEDURE DIVISION.
       MAIN-PARA.
           *> Step 1: Write some records
           OPEN OUTPUT EMP-FILE
           MOVE 101 TO EMP-ID
           MOVE "ALICE" TO EMP-NAME
           WRITE EMP-REC

           MOVE 102 TO EMP-ID
           MOVE "BOB" TO EMP-NAME
           WRITE EMP-REC

           MOVE 103 TO EMP-ID
           MOVE "CHARLIE" TO EMP-NAME
           WRITE EMP-REC
           CLOSE EMP-FILE

           *> Step 2: Read sequentially
           OPEN INPUT EMP-FILE
           PERFORM UNTIL WS-EOF = "Y"
              READ EMP-FILE NEXT RECORD
                 AT END MOVE "Y" TO WS-EOF
                 NOT AT END
                    DISPLAY "READ: " EMP-ID " " EMP-NAME
              END-READ
           END-PERFORM
           CLOSE EMP-FILE

           *> Step 3: Random access by primary key
           OPEN I-O EMP-FILE
           MOVE 102 TO EMP-ID
           READ EMP-FILE
              INVALID KEY DISPLAY "Record not found"
              NOT INVALID KEY
                 DISPLAY "FOUND BY ID: " EMP-ID " " EMP-NAME
           END-READ

           *> Step 4: Random access by alternate key
           MOVE "CHARLIE" TO EMP-NAME
           READ EMP-FILE
              KEY IS EMP-NAME
              INVALID KEY DISPLAY "Record not found"
              NOT INVALID KEY
                 DISPLAY "FOUND BY NAME: " EMP-ID " " EMP-NAME
           END-READ

           CLOSE EMP-FILE

           STOP RUN.
