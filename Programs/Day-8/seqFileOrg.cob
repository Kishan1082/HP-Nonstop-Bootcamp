        IDENTIFICATION DIVISION.
        PROGRAM-ID. SEQFILE.

        ENVIRONMENT DIVISION.
        INPUT-OUTPUT SECTION.
        FILE-CONTROL.
            SELECT STUDENT-FILE ASSIGN TO "students.dat"
                ORGANIZATION IS SEQUENTIAL.

        DATA DIVISION.
        FILE SECTION.
        FD  STUDENT-FILE
            LABEL RECORDS ARE STANDARD.
        01  STUDENT-RECORD.
            05 STUDENT-ID    PIC 9(3).
            05 STUDENT-NAME  PIC X(20).

        WORKING-STORAGE SECTION.
        01  WS-EOF          PIC X VALUE "N".

        PROCEDURE DIVISION.
        MAIN-PARA.
            *> Step 1: Write records
            OPEN OUTPUT STUDENT-FILE
            MOVE 101 TO STUDENT-ID
            MOVE "ALICE" TO STUDENT-NAME
            WRITE STUDENT-RECORD

            MOVE 102 TO STUDENT-ID
            MOVE "BOB" TO STUDENT-NAME
            WRITE STUDENT-RECORD

            MOVE 103 TO STUDENT-ID
            MOVE "CHARLIE" TO STUDENT-NAME
            WRITE STUDENT-RECORD
            CLOSE STUDENT-FILE

            *> Step 2: Read records
            OPEN INPUT STUDENT-FILE
            PERFORM UNTIL WS-EOF = "Y"
                READ STUDENT-FILE
                    AT END MOVE "Y" TO WS-EOF
                    NOT AT END
                        DISPLAY "ID: " STUDENT-ID "  NAME: " STUDENT-NAME
                END-READ
            END-PERFORM
            CLOSE STUDENT-FILE

            STOP RUN.
