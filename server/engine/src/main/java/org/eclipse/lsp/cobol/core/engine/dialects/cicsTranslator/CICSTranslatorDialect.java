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
 *    Broadcom, Inc. - initial API and implementation
 *
 */

package org.eclipse.lsp.cobol.core.engine.dialects.cicsTranslator;

import com.google.common.collect.ImmutableMultimap;
import lombok.RequiredArgsConstructor;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.eclipse.lsp.cobol.core.CICSTranslatorLexer;
import org.eclipse.lsp.cobol.core.CICSTranslatorParser;
import org.eclipse.lsp.cobol.core.engine.dialects.CobolDialect;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectParserListener;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.strategy.CobolErrorStrategy;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Process the text according to the CICS Translator rules */
@RequiredArgsConstructor
public class CICSTranslatorDialect implements CobolDialect {
  private final MessageService messageService;

  /**
   * Returns dialect name
   * @return dialect name
   */
  @Override
  public String getName() {
    return "CICSTranslator";
  }

  /**
   * @param context is a DialectProcessingContext class with all needed data for dialect processing
   * @return DialectOutcome enclosed in {@link ResultWithErrors}
   */
  @Override
  public ResultWithErrors<DialectOutcome> processText(DialectProcessingContext context) {
    CICSTranslatorLexer lexer = new CICSTranslatorLexer(CharStreams.fromString(context.getText()));
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    CICSTranslatorParser parser = new CICSTranslatorParser(tokens);
    DialectParserListener listener = new DialectParserListener(context.getProgramDocumentUri());
    lexer.removeErrorListeners();
    lexer.addErrorListener(listener);
    parser.removeErrorListeners();
    parser.addErrorListener(listener);
    parser.setErrorHandler(new CobolErrorStrategy(messageService));

    CICSTranslatorVisitor cicsTranslatorVisitor = new CICSTranslatorVisitor(context.getText());
    cicsTranslatorVisitor.visitStartRule(parser.startRule());

    List<SyntaxError> errors = new ArrayList<>(listener.getErrors());
    return new ResultWithErrors<>(new DialectOutcome(cicsTranslatorVisitor.getResultedText(), Collections.emptyList(), ImmutableMultimap.of()), errors);
  }
}
