      * Copyright (c) 2024 Broadcom.
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
       PROGRAM-ID. TDXMLTST.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 XML-STRING                PIC X(1000) VALUE SPACES.
       01 EZ-PTR                    PIC S9(4) COMP VALUE 1.
       PROCEDURE DIVISION.
          MAINLINE.
             DISPLAY 'XML-DOCUMENT=' XML-STRING(EZ-PTR)
             XML PARSE XML-STRING(EZ-PTR) RETURNING NATIONAL
                                PROCESSING PROCEDURE XML-HANDLER
               ON EXCEPTION
                 GO TO ABEND
               NOT ON EXCEPTION
                 DISPLAY 'XML DOCUMENT SUCCESSFULLY PARSED'
              END-XML.
       XML-HANDLER.
           DISPLAY 'XML-EVENT=' XML-EVENT.
       ABEND.
           DISPLAY 'XML-EVENT=' XML-EVENT.
