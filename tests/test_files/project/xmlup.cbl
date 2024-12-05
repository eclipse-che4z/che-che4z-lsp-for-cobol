       Identification division.
         Program-id. XMLup.
       Data division.
        Working-storage section.
         1 d.
          2 pic x(40) value '<pfx0:root xmlns:pfx1="http://whatever">'.
          2 pic x(19) value '<pfx1:localElName1>'.
          2 pic x(20) value '<pfx2:localElName2/>'.
          2 pic x(40) value '<pfx3:localElName3 pfx4:localAtName4="">'.
          2 pic x(02) value 'c1'.
          2 pic x(41) value '<pfx5:localElName5 pfx6:localAtName6=""/>'.
          2 pic x(24) value 'c2</pfx3:localElName3>c3'.
          2 pic x(32) value '</pfx1:localElName1></pfx0:root>'.
       Procedure division.
        main.
           display 'XML document:  ' d
           display ' '
           xml parse d processing procedure h
           goback.
        h.
           if xml-event = 'EXCEPTION'
             display ' '
           end-if
           display xml-event xml-code '|' xml-text '|'
               xml-namespace-prefix '|'
               xml-namespace '|'
           if xml-event = 'EXCEPTION' and xml-code = 264192 or 264193
             move 0 to xml-code
           end-if
           .
       End program XMLup.