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
      
         COPY SAMPLE COPYS1 ABC.
         COPY SAMPLE COPYS1 CBA.
     
       PROCEDURE DIVISION.
 
         MAINLINE-PARAGRAPH.   
           MOVE "1" TO FIELD0 OF SAMP0.
           MOVE "1" TO FIELD_11_ABC.
           MOVE "1" TO FIELD_11_CBA.
           MOVE "1" TO FIELD_21_VVV OF SAMP1_ABC.
           MOVE "1" TO FIELD_21_VVV OF SAMP1_CBA.
           GOBACK.
