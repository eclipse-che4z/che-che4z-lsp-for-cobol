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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.util;

import lombok.NonNull;
import lombok.experimental.UtilityClass;
import org.antlr.v4.runtime.Token;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.core.CobolLexer;
import org.eclipse.lsp.cobol.core.CobolPreprocessorLexer;
import org.eclipse.lsp.cobol.core.CobolPreprocessorListener;
import org.eclipse.lsp.cobol.core.model.DocumentMapping;
import org.eclipse.lsp.cobol.core.model.EmbeddedCode;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.preprocessor.ProcessingConstants;

import java.util.*;

import static java.util.Optional.ofNullable;
import static org.eclipse.lsp.cobol.core.CobolLexer.COPYENTRY;
import static org.eclipse.lsp.cobol.core.CobolLexer.COPYEXIT;

/**
 * This class maps positions of extended document to the original ones.
 *
 * <p>Preprocessor may internally change the content of the processing document, so the resulting
 * positions of syntax and semantic analysis won't match the user expectations. In order to avoid
 * it, the tokens provided by {@link CobolLexer} should be compared with ones provided by {@link
 * CobolPreprocessorLexer}. The comparison applied by string equity.
 *
 * <p>Don't change this file unless you are sure what you are doing. Check the grammar first.
 */
@UtilityClass
public class LocalityMappingUtils {

  private static final int URI_PREFIX_LENGTH =
      ProcessingConstants.CPY_ENTER_TAG.length();
  private static final int URI_SUFFIX_LENGTH = ProcessingConstants.CPY_URI_CLOSE.length();

  /**
   * Map the tokens of the extended document to original ones using document mapping, collected by
   * {@link CobolPreprocessorListener}.
   *
   * @param tokens tokens of extended documents, provided by {@link CobolLexer}
   * @param documentPositions initial document and copybooks positions
   * @param documentUri URI of the current document
   * @param embeddedCodeParts map of embedded code part contexts
   * @return map of tokens and original positions.
   */
  public Map<Token, Locality> createPositionMapping(
      List<Token> tokens,
      Map<String, DocumentMapping> documentPositions,
      String documentUri,
      Map<Token, EmbeddedCode> embeddedCodeParts) {
    Map<Token, Locality> result = new HashMap<>();
    Deque<DocumentHierarchyLevel> documentHierarchyStack = new ArrayDeque<>();
    enterDocument(documentUri, documentPositions, documentHierarchyStack);
    mapTokens(tokens, embeddedCodeParts, documentPositions, documentHierarchyStack, result);
    return result;
  }

  /**
   * Map the tokens recursively for embedded languages
   *
   * @param tokens tokens of extended documents, provided by {@link CobolLexer}
   * @param documentPositions initial document and copybooks positions
   * @param embeddedCodeParts map of embedded code part contexts
   * @param documentHierarchyStack stack of processing documents
   * @param tokenAccumulator a map that stores all the currently mapped tokens
   */
  private void mapTokens(
      List<Token> tokens,
      Map<Token, EmbeddedCode> embeddedCodeParts,
      Map<String, DocumentMapping> documentPositions,
      Deque<DocumentHierarchyLevel> documentHierarchyStack,
      Map<Token, Locality> tokenAccumulator) {

    for (int i = 0; i < tokens.size(); i++) {
      Token token = tokens.get(i);
      if (embeddedCodeParts.containsKey(token)) {
        EmbeddedCode embeddedCode = embeddedCodeParts.get(token);
        List<Token> nestedTokens = embeddedCode.getTokens();
        mapTokens(
            nestedTokens,
            embeddedCodeParts,
            documentPositions,
            documentHierarchyStack,
            tokenAccumulator);
        // skip the tokens provided by CobolLexer for embedded languages because they are not going
        // to be used
        i += embeddedCode.getShift();
      } else {
        mapToken(token, documentPositions, tokenAccumulator, documentHierarchyStack);
      }
    }
  }

  private void mapToken(
      Token token,
      Map<String, DocumentMapping> documentPositions,
      Map<Token, Locality> result,
      Deque<DocumentHierarchyLevel> documentHierarchyStack) {
    if (token.getType() == COPYENTRY && token.getTokenSource() instanceof CobolLexer) {
      enterDocument(
          extractCopybookName(token.getText()), documentPositions, documentHierarchyStack);
    } else if (token.getType() == COPYEXIT && token.getTokenSource() instanceof CobolLexer) {
      exitDocument(documentHierarchyStack);
    } else {
      mapTokenToPosition(token, result, documentHierarchyStack);
    }
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
   * @param token token to find a position
   * @param mappingAccumulator map to add the found position
   * @param documentHierarchyStack stack of processing documents
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
   * @param documentId URI of the current document or copybook id
   * @param documentPositions position mappings
   * @param documentHierarchyStack stack of processing documents
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
   * @param documentHierarchyStack stack of processing documents
   */
  private void exitDocument(Deque<DocumentHierarchyLevel> documentHierarchyStack) {
    documentHierarchyStack.pop();
    currentDocument(documentHierarchyStack).forward();
  }

  /**
   * Get the current document avoiding NPE
   *
   * @param documentHierarchyStack stack of processing documents
   * @return the current document hierarchy level element
   */
  @NonNull
  private DocumentHierarchyLevel currentDocument(
      Deque<DocumentHierarchyLevel> documentHierarchyStack) {
    return ofNullable(documentHierarchyStack.peek())
        .orElseThrow(() -> new IllegalStateException("Document structure corrupted"));
  }

  /**
   * Extract the copybook id from the copybook entry token removing its suffix and prefix.
   *
   * @param text text of copybook entry token
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
   * @param token text of the token
   * @param position text of the position
   * @return true if token and position match
   */
  private boolean tokenMatches(String token, String position) {
    String positionText = position.trim();
    String trimmedToken = token.trim();
    return trimmedToken.equals(positionText)
        || trimmedToken.equals(positionText.replace("<EOF>", ""));
  }

  /**
   * Find the nearest locality for a provided token. Use this method when a token is not found the
   * the Token to Locality mapping.
   *
   * <p>For e.g. A token at line position 0, char start index 3, char end index 6 is passed( value -
   * TES). But the same token is not present in the mapping. Then this method tries to find the
   * nearest relevant token. And matches to token TEST, which is at position 0, and char start index
   * at 3 and char end index is 7
   *
   * @param referenceToken tokens of type {@link org.antlr.v4.runtime.CommonToken} provided by
   *     {@link CobolLexer}
   * @param mapping A Map of Token to Locality for a document in analysis.
   * @return Locality for a passed token.
   */
  public Optional<Locality> getNearestLocality(
      Token referenceToken, @NonNull Map<Token, Locality> mapping) {
    if (Objects.isNull(referenceToken)) return Optional.empty();
    String normalizeTokenText = StringUtils.normalizeSpace(referenceToken.getText());
    return mapping.entrySet().stream()
        .filter(
            entry ->
                StringUtils.normalizeSpace(entry.getKey().getText()).contains(normalizeTokenText)
                    && entry.getKey().getCharPositionInLine()
                        == referenceToken.getCharPositionInLine()
                    && entry.getKey().getLine() == referenceToken.getLine()
                    && entry.getKey().getStartIndex() <= referenceToken.getStartIndex()
                    && entry.getKey().getStopIndex() >= referenceToken.getStopIndex())
        .map(Map.Entry::getValue)
        .findFirst();
  }
}
