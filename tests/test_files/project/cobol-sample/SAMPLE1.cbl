      * Copyright (c) 2026 Broadcom.
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
            
       PROCEDURE DIVISION.
           COPY SAMPLE COPY1 XXX.
           PROC V1 OF G1 BY V2 OF G2 DO S1 WITH P1 AND P2 FROM S2, S3.

         MAINLINE-PARAGRAPH.   
           MOVE "1" TO FIELD0 OF SAMP0.
           GOBACK.

         S2 SECTION.
         P2.
           CONTINUE.

         S3 SECTION.
           CONTINUE.