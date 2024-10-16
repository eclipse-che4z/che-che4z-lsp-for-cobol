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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.util;

import lombok.NonNull;
import lombok.experimental.UtilityClass;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.Uri;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import javax.annotation.Nullable;

/** Utilities for Locality building and retrieving */
@UtilityClass
public class LocalityUtils {

  /**
   * Build a locality from the given context, document uri and the current copybook.
   *
   * @param context context to retrieve the position range
   * @param documentUri uri of the current document
   * @param copybookId the id of the current copybook
   * @return locality pointing to the context in the current document
   */
  @NonNull
  public Locality buildLocality(
          ParserRuleContext context, Uri documentUri, @Nullable String copybookId) {
    return Locality.builder()
        .uri(documentUri)
        .copybookId(copybookId)
        .range(retrieveRange(context.getStart(), context.getStop()))
        .recognizer(LocalityUtils.class)
        .build();
  }

  private Range retrieveRange(Token start, Token stop) {
    return new Range(getStartPosition(start), getStopPosition(stop));
  }

  private Position getStartPosition(Token token) {
    return new Position(token.getLine() - 1, token.getCharPositionInLine());
  }

  private Position getStopPosition(Token token) {
    return new Position(
        token.getLine() - 1,
        token.getCharPositionInLine() + token.getStopIndex() - token.getStartIndex() + 1);
  }


}
