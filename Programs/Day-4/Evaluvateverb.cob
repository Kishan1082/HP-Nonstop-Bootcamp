        IDENTIFICATION DIVISION.
        PROGRAM-ID. HELLO.

        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 WS-A PIC 9 VALUE 0.
        
        PROCEDURE DIVISION.
        MOVE 3 TO WS-A.
        
        EVALUATE TRUE
            WHEN WS-A > 2
                DISPLAY 'WS-A GREATER THAN 2'

            WHEN WS-A < 0
                DISPLAY 'WS-A LESS THAN 0'

            WHEN OTHER
                DISPLAY 'INVALID VALUE OF WS-A'
        END-EVALUATE.
        
        STOP RUN.
        