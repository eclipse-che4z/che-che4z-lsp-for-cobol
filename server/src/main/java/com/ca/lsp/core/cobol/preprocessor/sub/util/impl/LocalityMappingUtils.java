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

package com.ca.lsp.core.cobol.preprocessor.sub.util.impl;

import com.ca.lsp.core.cobol.model.Locality;
import com.ca.lsp.core.cobol.model.DocumentMapping;
import lombok.experimental.UtilityClass;
import org.antlr.v4.runtime.Token;

import javax.annotation.Nonnull;
import java.util.*;
import java.util.function.Consumer;

import static com.ca.lsp.core.cobol.parser.CobolLexer.COPYENTRY;
import static com.ca.lsp.core.cobol.parser.CobolLexer.COPYEXIT;
import static com.ca.lsp.core.cobol.preprocessor.ProcessingConstants.*;
import static java.util.Optional.ofNullable;

/**
 * This class maps positions of extended document to the original ones.
 *
 * <p>Preprocessor may internally change the content of the processing document, so the resulting
 * positions of syntax and semantic analysis won't match the user expectations. In order to avoid
 * it, the tokens provided by {@link com.ca.lsp.core.cobol.parser.CobolLexer} should be compared
 * with ones provided by {@link com.ca.lsp.core.cobol.parser.CobolPreprocessorLexer}. The comparison
 * applied by string equity.
 */
@UtilityClass
public class LocalityMappingUtils {

  private static final int URI_PREFIX_LENGTH = CPY_ENTER_TAG.length() + CPY_URI_OPEN.length();
  private static final int URI_SUFFIX_LENGTH = CPY_URI_CLOSE.length();

  /**
   * Map the tokens of the extended document to original ones using document mapping, collected by
   * {@link com.ca.lsp.core.cobol.parser.CobolPreprocessorListener}.
   *
   * @param tokens - tokens of extended documents, provided by {@link
   *     com.ca.lsp.core.cobol.parser.CobolLexer}
   * @param documentPositions - initial document and copybooks positions
   * @param documentUri - URI of the current document
   * @return map of tokens and original positions.
   */
  public Map<Token, Locality> createPositionMapping(
      List<Token> tokens, Map<String, DocumentMapping> documentPositions, String documentUri) {
    Map<Token, Locality> result = new HashMap<>();
    Deque<DocumentHierarchyLevel> documentHierarchyStack = new ArrayDeque<>();
    enterDocument(documentUri, documentPositions, documentHierarchyStack);
    tokens.forEach(mapToken(documentPositions, result, documentHierarchyStack));
    return result;
  }

  private Consumer<Token> mapToken(
      Map<String, DocumentMapping> documentPositions,
      Map<Token, Locality> result,
      Deque<DocumentHierarchyLevel> documentHierarchyStack) {
    return token -> {
      if (token.getType() == COPYENTRY) {
        enterDocument(
            extractCopybookName(token.getText()), documentPositions, documentHierarchyStack);
      } else if (token.getType() == COPYEXIT) {
        exitDocument(documentHierarchyStack);
      } else {
        mapTokenToPosition(token, result, documentHierarchyStack);
      }
    };
  }

  private void mapTokenToPosition(
      Token token,
      Map<Token, Locality> mappingAccumulator,
      Deque<DocumentHierarchyLevel> documentHierarchyStack) {
    Locality locality = currentDocument(documentHierarchyStack).getCurrent();
    if (locality == null) return;
    if (tokenMatches(token.getText(), locality.getToken())) {
      mappingAccumulator.put(token, locality);
      currentDocument(documentHierarchyStack).forward();
    } else {
      applyLookAhead(token, mappingAccumulator, documentHierarchyStack);
    }
  }

  /**
   * Try to find the next matching position. Take the tail of the current document positions and
   * apply the matcher for all of them one by one, then scroll the current document to the found
   * position. Doesn't guarantee that the position will be found.
   *
   * <p>WARNING: infinite lookahead may produce unexpected behavior in exception cases. In case of
   * strange bugs with positions, start debugging here.
   *
   * @param token - token to find a position
   * @param mappingAccumulator - map to add the found position
   * @param documentHierarchyStack - stack of processing documents
   */
  private void applyLookAhead(
      Token token,
      Map<Token, Locality> mappingAccumulator,
      Deque<DocumentHierarchyLevel> documentHierarchyStack) {
    List<Locality> positionsInFront = currentDocument(documentHierarchyStack).lookahead();
    for (int pos = 0; pos < positionsInFront.size(); pos++) {
      Locality forwardedLocality = positionsInFront.get(pos);
      if (tokenMatches(token.getText(), forwardedLocality.getToken())) {
        mappingAccumulator.put(token, forwardedLocality);
        currentDocument(documentHierarchyStack).forceForward(pos + 1);
        break;
      }
    }
  }

  /**
   * Change the current document to consume positions of the nested one.
   *
   * @param documentId - URI of the current document or copybook id
   * @param documentPositions - position mappings
   * @param documentHierarchyStack - stack of processing documents
   */
  private void enterDocument(
      String documentId,
      Map<String, DocumentMapping> documentPositions,
      Deque<DocumentHierarchyLevel> documentHierarchyStack) {
    documentHierarchyStack.push(new DocumentHierarchyLevel(documentPositions.get(documentId)));
  }

  /**
   * Move to the previous document in the stack to consume its positions
   *
   * @param documentHierarchyStack - stack of processing documents
   */
  private void exitDocument(Deque<DocumentHierarchyLevel> documentHierarchyStack) {
    documentHierarchyStack.pop();
    currentDocument(documentHierarchyStack).forward();
  }

  /**
   * Get the current document avoiding NPE
   *
   * @param documentHierarchyStack - stack of processing documents
   * @return the current document hierarchy level element
   */
  @Nonnull
  private DocumentHierarchyLevel currentDocument(
      Deque<DocumentHierarchyLevel> documentHierarchyStack) {
    return ofNullable(documentHierarchyStack.peek())
        .orElseThrow(() -> new IllegalStateException("Document structure corrupted"));
  }

  /**
   * Extract the copybook id from the copybook entry token removing its suffix and prefix.
   *
   * @param text - text of copybook entry token
   * @return copybook id
   */
  private String extractCopybookName(String text) {
    return text.substring(URI_PREFIX_LENGTH, text.length() - URI_SUFFIX_LENGTH);
  }

  /**
   * Check the token matches the position. Tokens may match even with line breaks or if the position
   * points to the end of file due to different lexer rules applied by the parser and the
   * preprocessor.
   *
   * @param token - text of the token
   * @param position - text of the position
   * @return true if token and position match
   */
  private boolean tokenMatches(String token, String position) {
    String positionText = position.trim();
    String trimmedToken = token.trim();
    return trimmedToken.equals(positionText)
        || trimmedToken.equals(positionText.replace("<EOF>", ""));
  }
}
