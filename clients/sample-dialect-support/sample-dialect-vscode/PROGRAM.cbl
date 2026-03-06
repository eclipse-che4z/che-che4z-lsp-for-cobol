      * Copyright (c) 2025 Broadcom.
      * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
      *
      * This program and the accompanying materials are made
      * available under the terms of the Eclipse Public License 2.0
      * which is available at https://www.eclipse.org/legal/epl-2.0/
      *
      * SPDX-License-Identifier: EPL-2.0
      *
      * Contributors:
      *    Broadcom, Inc. - initial API and implementation
      *
       IDENTIFICATION DIVISION.
       PROGRAM-ID.    PROG.
 
       DATA DIVISION.
       WORKING-STORAGE SECTION.
         AA SAMP0.
           BB FIELD0 PIC X(9).
         
         01 G1.
           05 V1 PIC X(9).
      
         COPY SAMPLE COPYS1 ABC.
         COPY SAMPLE COPYS1 CBA.
     
       PROCEDURE DIVISION.
           PROC V1 OF G1 BY V2 OF G2 DO S1 WITH P1 AND P2 FROM S2, S3.
           ALT STATE P1 OF S1.
           COPY SAMPLE COPYS3 AAA. 

           MAKEDIAG.

       MAINLINE-PARAGRAPH.
           MOVE "1" TO FIELD0 OF SAMP0.
           MOVE "1" TO FIELD_11_ABC.
           MOVE "1" TO FIELD_11_CBA.
           MOVE "1" TO FIELD_21_VVV OF SAMP1_ABC.
           MOVE "1" TO FIELD_21_VVV OF SAMP1_CBA.
           GOBACK.

       S2 SECTION.
       P1.
           DISPLAY "IN P1 OF S2".
           EXIT.            

       S1  SECTION.
       P1.
           DISPLAY "IN P1 OF S1".
           EXIT.
