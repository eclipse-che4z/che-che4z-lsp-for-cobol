PROCESS CODEPAGE(1140)
PROCESS XMLPARSE(XMLSS)
       Identification division.
       Program-id. ValidCk.

       Environment division.
        Configuration section.
           Special-names.
            xml-schema schema is 'ddschema'.

       Data division.
       Working-storage section.
       01  xml-decode.
           02 rtn comp   Pic 9(2).
           02 rsn comp-5 Pic 9(4).
       01  hv pic x(16) value '0123456789ABCDEF'.
       01  T           Pic 999 COMP.
       01  xml-document-1.
           02 pic x(52) value
               '<!--Valid: the "itemName" element can be omitted-->'.
           02 pic x(31) value '<stockItem itemNumber="123-AB">'.
           02 pic x(36) value '  <quantityOnHand>1</quantityOnHand>'.
           02 pic x(12) value '</stockItem>'.
       01  xml-document-2.
           02 pic x(44)
            value '<!--Invalid: missing attribute itemNumber-->'.
           02 pic x(11) value '<stockItem>'.
           02 pic x(30) value '  <itemName>No name</itemName>'.
           02 pic x(36) value '  <quantityOnHand>1</quantityOnHand>'.
           02 pic x(12) value '</stockItem>'.
       01  xml-document-3.
           02 pic x(47)
            value '<!--Invalid: unexpected attribute warehouse-->'.
           02 pic x(46) value
               '<stockItem itemNumber="074-UN" warehouse="NJ">'.
           02 pic x(37) value '  <quantityOnHand>10</quantityOnHand>'.
           02 pic x(32) value '  <itemName>Not here!</itemName>'.
           02 pic x(12) value '</stockItem>'.
       01  xml-document-4.
           02 pic x(46)
            value '<!--Invalid: illegal attribute value 123-Ab-->'.
           02 pic x(31) value '<stockItem itemNumber="123-Ab">'.
           02 pic x(33) value '  <itemName>Paintbrush</itemName>'.
           02 pic x(37) value '  <quantityOnHand>10</quantityOnHand>'.
           02 pic x(12) value '</stockItem>'.
       01  xml-document-5.
           02 pic x(46)
            value '<!--Invalid: missing element quantityOnHand-->'.
           02 pic x(31) value '<stockItem itemNumber="074-UN">'.
           02 pic x(32) value '  <itemName>Not here!</itemName>'.
           02 pic x(12) value '</stockItem>'.
       01  xml-document-6.
           02 pic x(42)
            value '<!--Invalid: unexpected element comment-->'.
           02 pic x(31) value '<stockItem itemNumber="123-AB">'.
           02 pic x(33) value '  <itemName>Paintbrush</itemName>'.
           02 pic x(36) value '  <quantityOnHand>1</quantityOnHand>'.
           02 pic x(35) value '  <comment>Nylon bristles</comment>'.
           02 pic x(12) value '</stockItem>'.
       01  xml-document-7.
           02 pic x(46) value
               '<!--Invalid: out-of-range element value 100-->'.
           02 pic x(31) value '<stockItem itemNumber="123-AB">'.
           02 pic x(33) value '  <itemName>Paintbrush</itemName>'.
           02 pic x(38) value '  <quantityOnHand>100</quantityOnHand>'.
           02 pic x(12) value '</stockItem>'.

       Procedure division.
        m.
           xml parse xml-document-1 
               WITH ENCODING 1140 RETURNING NATIONAL
               validating with file schema
               processing procedure p
           xml parse xml-document-2 validating with file schema
               processing procedure p
           xml parse xml-document-3 validating with file schema
               processing procedure p
           xml parse xml-document-4 validating with file schema
               processing procedure p
           xml parse xml-document-5 validating with file schema
               processing procedure p
           xml parse xml-document-6 validating with file schema
               processing procedure p
           xml parse xml-document-7 validating with file schema
               processing procedure p
           goback
           .
        p.
           evaluate xml-event
            when 'COMMENT'
               display ' '
               display xml-text
            when 'END-OF-DOCUMENT'
               display ' Document successfully parsed.'
            when 'EXCEPTION'
               move xml-code to xml-decode
               Divide rsn by 16 giving tally remainder T
               display ' RC=' rtn ', reason=x'''
                    hv(function mod(rsn / 4096 16) + 1:1)
                    hv(function mod(rsn / 256 16) + 1:1)
                    hv(function mod(rsn / 16 16) + 1:1)
                    hv(T + 1:1) ''''
           end-evaluate
           .
       End program ValidCk.