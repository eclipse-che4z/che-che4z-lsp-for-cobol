/*
 * Copyright (c) 2024 Broadcom.
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
 */
package org.eclipse.lsp.cobol.rules.procedure.statements;

import org.eclipse.lsp.cobol.parser.hw.ParsingContext;
import org.eclipse.lsp.cobol.rules.CobolLanguage;
import org.eclipse.lsp.cobol.rules.LanguageRule;

/** Imperative Statements */
public class ImperativeStatementRule implements LanguageRule {
  @Override
  public void parse(ParsingContext ctx, CobolLanguage language) {
    throw new UnsupportedOperationException("Not implemented yet");
  }

  @Override
  public boolean tryMatch(ParsingContext ctx, CobolLanguage language) {
      return ctx.match(
              // Arithmetic
              "ADD",
              "COMPUTE",
              "DIVIDE",
              "MULTIPLY",
              "SUBTRACT",
              // Data movement
              "ACCEPT", // Input-output too
              "INITIALIZE",
              "INSPECT",
              "SET",
              "MOVE",
              "STRING",
              "UNSTRING",
              // Ending
              "GOBACK",
              // Input-output
              "CLOSE",
              "DELETE",
              "DISPLAY",
              "OPEN",
              "READ",
              "REWRITE",
              "START",
              "STOP",
              "WRITE",
              // Ordering
              "ALLOCATE",
              "SORT", //  Format 1 SORT?
              "FREE",
              "MERGE",
              "RELEASE",
              "RETURN",
              // Procedure-branching
              "ALTER",
              "CONTINUE",
              "EXIT", // Format 1 EXIT?
              "PERFORM",
              // Program or method linkage
              "CALL",
              "CANCEL",
              "INVOKE",
              // Table-handling
              // Format 2 SORT (table SORT)
              "SET")
              || ctx.matchSeq("XML", "GENERATE")
              || ctx.matchSeq("XML", "PARSE")
              || ctx.matchSeq("STOP", "RUN")
              || ctx.matchSeq("EXIT", "PROGRAM")
              || ctx.matchSeq("EXIT", "METHOD")
              || ctx.matchSeq("GO", "TO");
  }
}
