        IDENTIFICATION DIVISION.
        PROGRAM-ID. HELLO.

        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 WS-NUM1 PIC 9(2) VALUE 20.
        01 WS-NUM2 PIC 9(2) VALUE 25.
        01 WS-NUM3 PIC 9(2) VALUE 20.

        PROCEDURE DIVISION.
        A000-FIRST-PARA.
        
        IF WS-NUM1 IS LESS THAN WS-NUM2 AND WS-NUM1=WS-NUM3 THEN
            DISPLAY 'Both condition OK'
        ELSE
            DISPLAY 'Error'
        END-IF.
        
        STOP RUN.
