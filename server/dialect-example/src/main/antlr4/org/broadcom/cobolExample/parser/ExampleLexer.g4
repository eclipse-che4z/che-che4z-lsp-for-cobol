/*
 * Copyright (c) 2023 Broadcom.
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

lexer grammar ExampleLexer;

channels{COMMENTS}
import TechnicalLexer;

BITWISE: B I T W I S E;
CALL: C A L L;
DETAILS: D E T A I L S;
EXAMPLE: E X A M P L E;
IN: I N;
INJECT: I N J E C T;
INTO: I N T O;
LEFT: L E F T;
MESSAGE: M E S S A G E;
MSG: M S G;
MSG_TYPE: MSG UNDERSCORECHAR TYPE;
OF: O F;
PARSE: P A R S E;
REPLY: R E P L Y;
RIGHT: R I G H T;
RPC: R P C;
RPC_MSG: RPC MINUSCHAR MSG;
SHIFT: S H I F T;
TO: T O;
TYPE: T Y P E;
UNSET: U N S E T;
UNTIE: U N T I E;
WITH: W I T H;
XID: X I D;
DOT_FS : '.' EOF?;
