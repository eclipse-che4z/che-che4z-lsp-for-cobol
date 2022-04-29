      * Copyright (c) 2021 Broadcom.
      * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
      *
      * This program and the accompanying materials are made
      * available under the terms of the Eclipse Public License 2.0
      * which is available at https://www.eclipse.org/legal/epl-2.0/
      *
      * SPDX-License-Identifier: EPL-2.0
      *
      * Contributors:
      * Broadcom, Inc. - initial API and implementation
       01 {$*DFHEIBLK}.
             02  {$*EIBTIME}  COMP-3 PIC S9(7).
             02  {$*EIBDATE}  COMP-3 PIC S9(7).
             02  {$*EIBTRNID} PIC X(4).
             02  {$*EIBTASKN} COMP-3 PIC S9(7).
             02  {$*EIBTRMID} PIC X(4).
             02  {$*DFHEIGDI} COMP PIC S9(4).
             02  {$*EIBCPOSN} COMP PIC S9(4).
             02  {$*EIBCALEN} COMP PIC S9(4).
             02  {$*EIBAID}   PIC X(1).
             02  {$*EIBFN}    PIC X(2).
             02  {$*EIBRCODE} PIC X(6).
             02  {$*EIBDS}    PIC X(8).
             02  {$*EIBREQID} PIC X(8).
             02  {$*EIBRSRCE} PIC X(8).
             02  {$*EIBSYNC}  PIC X(1).
             02  {$*EIBFREE}  PIC X(1).
             02  {$*EIBRECV}  PIC X(1).
             02  {$*EIBFIL01} PIC X(1).
             02  {$*EIBATT}   PIC X(1).
             02  {$*EIBEOC}   PIC X(1).
             02  {$*EIBFMH}   PIC X(1).
             02  {$*EIBCOMPL} PIC X(1).
             02  {$*EIBSIG}   PIC X(1).
             02  {$*EIBCONF}  PIC X(1).
             02  {$*EIBERR}   PIC X(1).
             02  {$*EIBERRCD} PIC X(4).
             02  {$*EIBSYNRB} PIC X(1).
             02  {$*EIBNODAT} PIC X(1).
             02  {$*EIBRESP}  COMP PIC S9(8).
             02  {$*EIBRESP2} COMP PIC S9(8).
             02  {$*EIBRLDBK} PIC X(1).