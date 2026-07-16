/*
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
 *   Broadcom - initial API and implementation
 */

lexer grammar ProgramLexer;

channels{COMMENTS}
import TechnicalLexer;

WORKING_STORAGE : W O R K I N G MINUSCHAR S T O R A G E;
SECTION : S E C T I O N;
LINKAGE : L I N K A G E;
PROCEDURE : P R O C E D U R E;
DIVISION : D I V I S I O N;
DATA_DIVISION: D A T A [ \t\r\n]+ D I V I S I O N;

COPY                 : C O P Y ;
MAID                 : M A I D ;
PIC                  : P I C;

LEVEL_NUMBER : ([1-9])|([0][1-9])|([1234][0-9]);
LEVEL_NUMBER_66 : '66';
LEVEL_NUMBER_77 : '77';
LEVEL_NUMBER_88 : '88';

DACO_COPYBOOK_IDENTIFIER
  : [A-Z0-9]+ ('-' [A-Z0-9]*)?
  ;


