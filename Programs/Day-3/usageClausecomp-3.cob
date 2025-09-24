       IDENTIFICATION DIVISION.
       PROGRAM-ID. COMP-EXAMPLE.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       *> COMP-1 : Single-precision floating point (4 bytes)
       01 WS-COMP1  USAGE COMP-1 VALUE 12345.67.

       *> COMP-2 : Double-precision floating point (8 bytes)
       01 WS-COMP2  USAGE COMP-2 VALUE 123456789.1234.

       *> COMP-3 : Packed decimal
       01 WS-COMP3-2  PIC 9(4) USAGE COMP-3 VALUE 1234.
       01 WS-COMP3-3  PIC 9(5) USAGE COMP-3 VALUE 54321.
       01 WS-COMP3-4  PIC 9(7) USAGE COMP-3 VALUE 7654321.

       PROCEDURE DIVISION.

           DISPLAY "===== COMP-1 / COMP-2 / COMP-3 Example =====".

           DISPLAY "COMP-1 (4 bytes)   : " WS-COMP1.
           DISPLAY "COMP-2 (8 bytes)   : " WS-COMP2.

           DISPLAY "COMP-3 2 bytes     : " WS-COMP3-2.
           DISPLAY "COMP-3 3 bytes     : " WS-COMP3-3.
           DISPLAY "COMP-3 4 bytes     : " WS-COMP3-4.

           STOP RUN.
