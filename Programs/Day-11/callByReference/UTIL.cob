       IDENTIFICATION DIVISION.
       PROGRAM-ID. UTIL.

       DATA DIVISION.
       LINKAGE SECTION.
       01 LS-STUDENT-ID   PIC 9(4).
       01 LS-STUDENT-NAME PIC A(15).

       PROCEDURE DIVISION USING LS-STUDENT-ID LS-STUDENT-NAME.
           DISPLAY 'In Called Program (UTIL)'
           DISPLAY 'Incoming Id   : ' LS-STUDENT-ID
           DISPLAY 'Incoming Name : ' LS-STUDENT-NAME

           MOVE 1111 TO LS-STUDENT-ID
           MOVE 'John' TO LS-STUDENT-NAME

           DISPLAY 'Modified Id   : ' LS-STUDENT-ID
           DISPLAY 'Modified Name : ' LS-STUDENT-NAME

           EXIT PROGRAM.
