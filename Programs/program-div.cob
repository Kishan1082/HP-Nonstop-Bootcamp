       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMDIV.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NAME PIC A(30).
       01 WS-ID   PIC 9(5) VALUE 10005.

       PROCEDURE DIVISION.
       A000-FIRST-PARA.
           DISPLAY 'Bio'.
           MOVE 'Alex' TO WS-NAME.
           DISPLAY "My name is : " WS-NAME.
           DISPLAY "My ID is : " WS-ID.
           STOP RUN.
