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

lexer grammar CICSTranslatorLexer;
channels{COMMENTS}
import TechnicalLexer;
//FLAG(I or W or E or S)
//LINECOUNT(n)
//SPACE(1 or 2 or 3 )
APOST : A P O S T;
CBLCARD : C B L C A R D;
CICS : C I C S;
COBOL2 : C O B O L '2';
COBOL3 : C O B O L '3';
CPSM : C P S M;
DBCS : D B C S;
DEBUG : D E B U G;
DLI : D L I;
EDF : E D F;
EXCI : E X C I;
FEPI : F E P I;
FLAG : F L A G LPARENCHAR (I | W | E | S) RPARENCHAR;
LENGTH : L E N G T H;
LINECOUNT : L I N E C O U N T LPARENCHAR DIGIT RPARENCHAR;
LINKAGE : L I N K A G E;
NATLANG : N A T L A N G;
NOCBLCARD : N O C B L C A R D;
NOCPSM : N O C P S M;
NODEBUG : N O D E B U G;
NOEDF : N O E D F;
NOFEPI : N O F E P I;
NOLENGTH : N O L E N G T H;
NOLINKAGE : N O L I N K A G E;
NONUM : N O N U M;
NOOPTIONS : N O O P T I O N S;
NOSEQ : N O S E Q;
NOSPIE : N O S P I E;
NOVBREF : N O V B R E F;
NUM : N U M;
OPTIONS : O P T I O N S;
QUOTE : Q U O T E;
SEQ : S E Q;
SP : S P;
SPACE : S P A C E LPARENCHAR ('1' | '2' | '3') RPARENCHAR;
SPIE : S P I E;
SYSEIB : S Y S E I B;
VBREF : V B R E F;
XOPTS: X O P T S;