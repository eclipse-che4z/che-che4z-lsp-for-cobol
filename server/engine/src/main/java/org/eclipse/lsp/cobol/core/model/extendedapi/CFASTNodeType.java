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
  ALTER("alter"),
  PROGRAM("program"),
  PARAGRAPH("paragraph"),
  GOTO("goto"),
  PERFORM("perform"),
  SECTION("section"),
  SORT("sort"),
  INPUT("input"),
  OUTPUT("output"),
  ON_EXCEPTION("onexception"),
  ON_NOT_EXCEPTION("onnotexception"),
  END_ON("endon"),
  END_SORT("endsort"),
  MERGE("merge"),
  END_MERGE("endmerge"),
  STOP("stop"),
  EXEC_CICS("execcics"),
  EXEC_CICS_HANDLE("execcicshandle"),
  EXEC_SQL("execsql"),
  EXEC_SQL_WHENEVER("execwhenever"),
  END_EXEC("endexec"),
  EXIT("exit"),
  EXIT_SECTION("exitsection"),
  EXIT_PARAGRAPH("exitparagraph"),
  GOBACK("goback"),
  IF("if"),
  ELSE("else"),
  ENDIF("endif"),
  EVALUATE("evaluate"),
  WHEN("when"),
  WHEN_OTHER("whenother"),
  END_EVALUATE("endevaluate"),
  INLINE_PERFORM("inlineperform"),
  END_INLINE_PERFORM("endinlineperform"),
  AT_END("atEnd"),
  AT_END_EXIT("atEndExit"),
  XML_PARSE("xmlparse"),
  END_XML("endxml"),
  USE("use"),
  USE_FOR_DEBUGGING("usefordebugging");

  @Getter final String value;
}
