/*
 * Copyright (c) 2020 Broadcom.
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

package com.ca.lsp.core.cobol.engine;

import com.broadcom.lsp.domain.common.model.Position;
import com.ca.lsp.core.cobol.model.DocumentMapping;
import lombok.experimental.UtilityClass;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Token;

import java.util.*;

import static com.ca.lsp.core.cobol.parser.CobolLexer.*;

@UtilityClass
class Mapping {

  static Map<Token, Position> createPositionMapping(
      CommonTokenStream tokenStream,
      Map<String, DocumentMapping> documentPositions,
      String documentUri) {
    Map<Token, Position> result = new HashMap<>();
    Deque<DocumentHierarchyLevel> documentHierarchyStack = new ArrayDeque<>();
    documentHierarchyStack.push(new DocumentHierarchyLevel(documentPositions.get(documentUri)));
    documentHierarchyStack.peek().initialForward();
    List<Token> tokens = tokenStream.getTokens();
    outer:
    for (int i = 0; i < tokens.size(); i++) {
      Token token = tokens.get(i);
      String text = token.getText();
      if (token.getType() == COPYENTRY) {
        documentHierarchyStack.push(
            new DocumentHierarchyLevel(documentPositions.get(extractCopybookName(text))));
        continue;
      }
      if (token.getType() == COPYEXIT) {
        documentHierarchyStack.pop();
        documentHierarchyStack.peek().forward();
        i++;
        continue;
      }

      Position position = documentHierarchyStack.peek().getCurrent();

      String posText = position.getToken();
      if (tokenMatches(text, posText)) {
        result.put(token, position);
        documentHierarchyStack.peek().forward();
      } else {

        List<Position> positionsInFront = documentHierarchyStack.peek().lookahead();
        for (int pos = 0; pos < positionsInFront.size(); pos++) {
          Position forwardedPosition = positionsInFront.get(pos);
          if (tokenMatches(text, forwardedPosition.getToken())) {
            result.put(token, forwardedPosition);
            documentHierarchyStack.peek().forceForward(pos + 1);
            continue outer;
          }
        }
      }
    }
    return result;
  }

  private static String extractCopybookName(String text) {
    return text.substring(15, text.length() - 6);
  }

  private static boolean tokenMatches(String text, String position) {
    String positionText = position.trim();
    String trimmedToken = text.trim();
    return trimmedToken.equals(positionText)
        || trimmedToken.equals(positionText.replace("<EOF>", ""));
  }
}
