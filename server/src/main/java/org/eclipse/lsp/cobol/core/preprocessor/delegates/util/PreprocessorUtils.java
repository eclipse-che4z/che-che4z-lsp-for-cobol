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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.util;

import lombok.NonNull;
import lombok.experimental.UtilityClass;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;
import org.eclipse.lsp.cobol.core.model.CopybookUsage;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.GrammarPreprocessorListenerImpl;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.function.Function;

import static java.util.Optional.ofNullable;

/** Utility class for localities */
@UtilityClass
public class PreprocessorUtils {
  /**
   * Build a locality from the given context, document uri and the current copybook.
   *
   * @param context context to retrieve the position range
   * @param documentUri uri of the current document
   * @param copybook CopybookUsage from the top of the stack to retrieve the copybook id
   * @return locality pointing to the context in the current document
   */
  @NonNull
  public Locality buildLocality(ParserRuleContext context, String documentUri, CopybookUsage copybook) {
    return Locality.builder()
        .uri(documentUri)
        .copybookId(retrieveCopybookId(copybook))
        .range(new Range(getStartPosition(context.getStart()), getStopPosition(context.getStop())))
        .recognizer(GrammarPreprocessorListenerImpl.class)
        .build();
  }

  /**
   * Create a functor to turn a token into a locality using the current document URI and the current
   * copybook.
   *
   * @param documentUri uri of the current document
   * @param copybook CopybookUsage from the top of the stack to retrieve the copybook id
   * @return a functor Token -> Locality
   */
  @NonNull
  public Function<Token, Locality> toLocality(String documentUri, CopybookUsage copybook) {
    return token ->
        Locality.builder()
            .uri(documentUri)
            .copybookId(retrieveCopybookId(copybook))
            .range(new Range(getStartPosition(token), getStopPosition(token)))
            .token(token.getText())
            .recognizer(GrammarPreprocessorListenerImpl.class)
            .build();
  }

  private Position getStartPosition(Token token) {
    return new Position(token.getLine() - 1, token.getCharPositionInLine());
  }

  private Position getStopPosition(Token token) {
    return new Position(
        token.getLine() - 1,
        token.getCharPositionInLine() + token.getStopIndex() - token.getStartIndex() + 1);
  }

  private String retrieveCopybookId(CopybookUsage copybook) {
    return ofNullable(copybook).map(CopybookUsage::getCopybookId).orElse(null);
  }
}
