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
package org.eclipse.lsp.cobol.parser.hw;

import lombok.extern.slf4j.Slf4j;

import org.eclipse.lsp.cobol.cst.*;
import org.eclipse.lsp.cobol.parser.hw.lexer.CobolLexer;
import org.eclipse.lsp.cobol.rules.CobolLanguage;
import org.eclipse.lsp.cobol.rules.SourceUnitRule;

/**
 * Cobol parser
 */
@Slf4j
public class CobolParser {
  private final ParsingContext ctx;
  private final CobolLanguage rules = new CobolLanguage();

  public CobolParser(CobolLexer lexer, ParserSettings settings) {
    ctx = new ParsingContext(lexer, settings);
  }

  /**
   * Create the CST
   *
   * @return Concrete Syntax Tree
   */
  public ParseResult parse() {
    try {
      rules.parseRule(SourceUnitRule.class, ctx);
    } catch (ParseError error) {
      // TODO: unhandled error
      log.error(error.getMessage(), error);
    }
    return new ParseResult((SourceUnit) ctx.pop(), ctx.getDiagnostics());
  }
}
