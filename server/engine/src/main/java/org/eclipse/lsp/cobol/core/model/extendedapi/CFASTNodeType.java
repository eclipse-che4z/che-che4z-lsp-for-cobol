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

import lombok.AllArgsConstructor;
import lombok.Getter;

/** Control Flow Nodes type constant collection. */
@AllArgsConstructor
public enum CFASTNodeType {
  PROGRAM("program"),
  PARAGRAPH("paragraph"),
  GOTO("goto"),
  PERFORM("perform"),
  SECTION("section"),
  STOP("stop"),
  EXIT("exit"),
  GOBACK("goback"),
  IF("if"),
  ELSE("else"),
  ENDIF("endif"),
  EVALUATE("evaluate"),
  WHEN("when"),
  WHEN_OTHER("whenother"),
  END_EVALUATE("endevaluate"),
  INLINE_PERFORM("inlineperform"),
  END_INLINE_PERFORM("endinlineperform");
  @Getter final String value;
}
