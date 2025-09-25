        IDENTIFICATION DIVISION.
        PROGRAM-ID. HELLO.

        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 WS-TABLE.
            05 WS-A OCCURS 3 TIMES INDEXED BY I.
                10 WS-B PIC A(2).
                10 WS-C OCCURS 2 TIMES INDEXED BY J.
                    15 WS-D PIC X(3).

        PROCEDURE DIVISION.
        MOVE '12ABCDEF34GHIJKL56MNOPQR' TO WS-TABLE.
        SET I J TO 1.
        DISPLAY WS-C(I,J).
        SET I J UP BY 1.
        DISPLAY WS-C(I,J).
        
        STOP RUN.
        