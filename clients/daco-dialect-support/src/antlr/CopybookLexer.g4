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
 *   Broadcom, Inc. - initial API and implementation
 */

lexer grammar CopybookLexer;

channels{COMMENTS}
import TechnicalLexer;

COPY                 : C O P Y ;
MAID                 : M A I D ;

DACO_COPYBOOK_IDENTIFIER
  : [A-Z0-9]+ ('-' [A-Z0-9]*)?
  ;

IDENTIFIER : [a-zA-Z0-9][-_a-zA-Z0-9]*;
