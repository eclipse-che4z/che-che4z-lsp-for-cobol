       IDENTIFICATION DIVISION.
       PROGRAM-ID TEST16.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Msg.
           02 Msg-Severity pic 9 value 1.
           02 Msg-Date pic 9999/99/99 value "2012/04/12".
           02 Msg-Text pic X(50) value "Sell everything!".
       01 Doc pic X(500).

       PROCEDURE DIVISION.
           XML Generate Doc from Msg
               With attributes
               Type of Msg-Severity is attribute
                Msg-Date     is attribute
                Msg-Text     is element
           End-XML.