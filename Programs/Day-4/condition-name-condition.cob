        IDENTIFICATION DIVISION.
        PROGRAM-ID. HELLO.

        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 WS-NUM PIC 9(3).
        88 PASS VALUES ARE 041 THRU 100.
        88 FAIL VALUES ARE 000 THRU 40.

        PROCEDURE DIVISION.
        A000-FIRST-PARA.
        MOVE 65 TO WS-NUM.
        
        IF PASS 
            DISPLAY 'Passed with ' WS-NUM ' marks'.
            
        IF FAIL 
            DISPLAY 'FAILED with ' WS-NUM 'marks'.
            
        STOP RUN.
        