       IDENTIFICATION DIVISION.
       PROGRAM-ID. NUMBER-EXAMPLE.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       *> Signed number: 5 digits integer, 3 digits decimal
       01 WS-SIGNED-NUM PIC S9(5)V9(3) USAGE DISPLAY VALUE -12345.678.

       *> Unsigned number: 5 digits integer
       01 WS-UNSIGNED-NUM PIC 9(5) USAGE DISPLAY VALUE 54321.

       PROCEDURE DIVISION.
           DISPLAY "Signed Number (S9(5)V9(3)) : " WS-SIGNED-NUM.
           DISPLAY "Unsigned Number (9(5))    : " WS-UNSIGNED-NUM.
           
           *> Example arithmetic: add 1.111 to signed number
           ADD 1111 TO WS-SIGNED-NUM.
           DISPLAY "After adding 1.111:        " WS-SIGNED-NUM.

           STOP RUN.
