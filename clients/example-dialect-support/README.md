# COBOL Dialect Support Example
    
COBOL Dialect Support Example is an sample add-on for the [COBOL Language Support](https://marketplace.visualstudio.com/items?itemName=broadcomMFD.cobol-language-support) extension. This add-on enables language server protocol features for a dummy dialects which supports following syntaxes.

- Shift statement: EXAMPLE SHIFT <identifier> TO <identifier>.
- Bitwise shift statement: EXAMPLE BITWISE SHIFT <identifier> (RIGHT|LEFT) <number>.
- Inject statement: EXAMPLE INJECT <coybook>
- Untie statement: EXAMPLE UNTIE <identifier>
- Unset statement: EXAMPLE UNSET <conditional-identifier>
- Level 100 statement: EXAMPLE 100 <iden>
    Level 100 introduces variables in following format
		01 <iden>.
			05 <iden>_1ST PIC X(9).
			05 <iden>_2ND PIC V(2).
			88 <iden>-OFF VALUE 'N'.

- Rpc message parse statement:  EXAMPLE RPC-MSG PARSE <identifier1> INTO <identifier2> 
                                (WITH DETAILS? XID <identifier3>)? 
                                (WITH DETAILS? MSG_TYPE <identifier4>)?
                                (WITH DETAILS? CALL <identifier5>)? 
                                (WITH DETAILS? REPLY <identifier6>)?

    	identifier1 must not be a subordinate of identifier2. 
    	identifier 3/4/5/6 must be a subordinate of identifier2.

## Prerequisites

- COBOL Language Support extension
- Java version 8 or higher with the PATH variable correctly configured. For more information, see the [Java documentation](https://www.java.com/en/download/help/path.html).

## Getting Started

To enable COBOL Dialect Support Example, follow the instructions in the [COBOL Language Support](https://marketplace.visualstudio.com/items?itemName=broadcomMFD.cobol-language-support) documentation. Use the string "example" to enable this dialect in your workspace extension settings or in a processor group.
    
## LSP Features
    
COBOL Dialect Support Example enables the following LSP features:
- Autocomplete for custom dialect keywords
- Syntax and semantic check for custom dialect keywords and variables
- Syntax highlighting and coloring for a custom dialect keywords and variables
- Example custom dialect code snippets

## Sample Code
```
       IDENTIFICATION DIVISION.
       PROGRAM-ID. AS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 STRUCTNAME.
           03 VARNAME  PIC X(20).
           88 FLAG1-ON              VALUE 'Y'.

      *  custom inject statements
      *  This statements injects a copybook.
      *  syntax: EXAMPLE INJECT <copybook Name>
      *  Following statement would work only when copybook 
      *  by name ABC is present.
       EXAMPLE INJECT ABC.

      *    Level 100 statement: 100 <iden>
      *    Level 100 introduces variables in following format
      *    01 <iden>.
      *        05 <iden>_1ST PIC X(9).
      *        05 <iden>_2ND PIC V(2).
      *        88 <iden>-OFF VALUE 'N'.

       EXAMPLE 100 XYZ

      
       PROCEDURE DIVISION.

      *    Shift statement: SHIFT <identifier> TO <identifier>.
       EXAMPLE SHIFT STRUCTNAME TO VARNAME.

      *    Bitwise shift statement: 
      *    BITWISE SHIFT <identifier> (RIGHT|LEFT)<number>.
       EXAMPLE BITWISE SHIFT STRUCTNAME RIGHT 9.

      *    Untie statement: UNTIE <identifier>
       EXAMPLE UNTIE VARNAME.

      *   Unset statement: UNSET <conditional-identifier>
       EXAMPLE UNSET FLAG1-ON.

      *   custom Rpc message parse statement:  
      *    RPC-MSG PARSE <identifier1> INTO
      *    <identifier2>
      *    (WITH DETAILS? XID <identifier3>)?
      *    (WITH DETAILS? MSG_TYPE <identifier4>)?
      *    (WITH DETAILS? CALL <identifier5>)?
      *    (WITH DETAILS? REPLY <identifier6>)?
       EXAMPLE RPC-MSG PARSE VARNAME INTO XYZ
           WITH details xid XYZ-1ST
           WITH DETAILS msg_type XYZ-1ST
           WITH DETAILS CALL XYZ-2ND
           WITH DETAILS REPLY XYZ-2ND.
           move XYZ-1ST TO XYZ-OFF.

      *  Following statement would work only when copybook 
      *  by name ABC is present.
           move ABC_ID to XYZ.

```