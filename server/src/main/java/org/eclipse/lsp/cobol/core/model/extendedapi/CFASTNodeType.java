/*
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
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.core.model.extendedapi;

import lombok.experimental.UtilityClass;

/**
 * Control Flow Nodes type constant collection.
 */
@UtilityClass
public final class CFASTNodeType {
  static final String PROGRAM = "program";
  static final String PARAGRAPH = "paragraph";
  static final String GOTO = "goto";
  static final String PERFORM = "perform";
  static final String SECTION = "section";
  static final String STOP = "stop";
  static final String IF = "if";
  static final String ELSE = "else";
  static final String ENDIF = "endif";
  static final String EVALUATE = "evaluate";
  static final String WHEN = "when";
  static final String END_EVALUATE = "endevaluate";
  static final String INLINE_PERFORM = "inlineperform";
  static final String END_INLINE_PERFORM = "endinlineperform";
}
