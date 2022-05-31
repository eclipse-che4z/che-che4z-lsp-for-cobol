/*
 * Copyright (c) 2022 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
export const COMPILE_JCL_HEADER: string =
`//*
//*  COBOL LIBRARIES
//*
//*
//******************************************************************
//*  COMP - COMPILE THE COBOL PROGRAM
//******************************************************************
//*
//COMP     EXEC PGM=IGYCRCTL,REGION=0M
//*  PARM=('LIST,APOST,NOSEQ,LIST,MAP,XREF,SOURCE,LP(64)')
//*  PARM=('LIST,APOST,NOSEQ,LIST,MAP,XREF,SOURCE,DATA(24)')`;

export const COMPILE_JCL_MIDDLE: string =
`//SYSUT1   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))
//SYSUT2   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))
//SYSUT3   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))
//SYSUT4   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))
//SYSUT5   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))
//SYSUT6   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))
//SYSUT7   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))
//SYSUT8   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))
//SYSUT9   DD  UNIT=SYSDA,SPACE=(TRK,(10,10))
//SYSUT10  DD  UNIT=SYSDA,SPACE=(TRK,(10,10))
//SYSUT11  DD  UNIT=SYSDA,SPACE=(TRK,(10,10))
//SYSUT12  DD  UNIT=SYSDA,SPACE=(TRK,(10,10))
//SYSUT13  DD  UNIT=SYSDA,SPACE=(TRK,(10,10))
//SYSUT14  DD  UNIT=SYSDA,SPACE=(TRK,(10,10))
//SYSUT15  DD  UNIT=SYSDA,SPACE=(TRK,(10,10))
//SYSMDECK DD  UNIT=SYSDA,SPACE=(TRK,(10,10))
//SYSPRINT DD  SYSOUT=*
//SYSLIN   DD  DSN=&&LOADSET,DISP=(MOD,PASS),
//             UNIT=SYSDA,SPACE=(400,(2000,200))`;

export const COMPILE_JCL_TAIL: string =
`//SYSUDUMP DD  SYSOUT=*
//SYSPUNCH DD  DUMMY
//SYSIN    DD  * `;
