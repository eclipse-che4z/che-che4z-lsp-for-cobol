      * Copyright (c) 2020 Broadcom.
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
       PROGRAM-ID.  SECTST.
       PROCEDURE DIVISION.
           DISPLAY 'OUT'.
           GO TO PARAG1.
       SECT1 SECTION.
       PARAG1.
           DISPLAY 'PARAG1'.
           PERFORM PARAG2 OF SECT2.
       SECT2 SECTION.
       PARAG2.
           DISPLAY 'PARAG2'.