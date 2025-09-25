       IDENTIFICATION DIVISION.
       PROGRAM-ID. SEARCHALL.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-TABLE.
          05 WS-RECORD OCCURS 6 TIMES
             ASCENDING KEY IS WS-NUM
             INDEXED BY I.
             10 WS-NUM  PIC 9(2).
             10 WS-NAME PIC A(3).

       PROCEDURE DIVISION.
           *> Load table in ascending order by WS-NUM
           MOVE 11 TO WS-NUM(1)   MOVE "PQR" TO WS-NAME(1)
           MOVE 12 TO WS-NUM(2)   MOVE "ABC" TO WS-NAME(2)
           MOVE 34 TO WS-NUM(3)   MOVE "GHI" TO WS-NAME(3)
           MOVE 56 TO WS-NUM(4)   MOVE "DEF" TO WS-NAME(4)
           MOVE 78 TO WS-NUM(5)   MOVE "JKL" TO WS-NAME(5)
           MOVE 93 TO WS-NUM(6)   MOVE "MNO" TO WS-NAME(6).

           SEARCH ALL WS-RECORD
              AT END DISPLAY "RECORD NOT FOUND"
              WHEN WS-NUM(I) = 93
                   DISPLAY "RECORD FOUND"
                   DISPLAY WS-NUM(I)
                   DISPLAY WS-NAME(I)
           END-SEARCH.

           STOP RUN.
