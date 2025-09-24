       IDENTIFICATION DIVISION.
       PROGRAM-ID. COPYBOOK.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

           COPY "ABC".

       PROCEDURE DIVISION.

           DISPLAY "===== COPYBOOK Example =====".
           DISPLAY "WS-NUM1 : " WS-NUM1.
           DISPLAY "WS-NUM2 : " WS-NUM2.
           DISPLAY "WS-CHAR1: " WS-CHAR1.
           DISPLAY "WS-CHAR2: " WS-CHAR2.

           STOP RUN.
