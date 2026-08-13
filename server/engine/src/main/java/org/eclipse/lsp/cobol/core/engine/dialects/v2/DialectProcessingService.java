/*
 * Copyright (c) 2025 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.core.engine.dialects.v2;

import com.google.common.base.Strings;
import com.google.common.collect.ImmutableList;
import com.google.inject.Provider;
import java.util.*;
import java.util.stream.Collectors;
import javax.inject.Inject;
import javax.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.CleanerPreprocessor;
import org.eclipse.lsp.cobol.common.copybook.CopybookName;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorCode;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.mapping.ExtendedText;
import org.eclipse.lsp.cobol.common.mapping.Token;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.lsp.jrpc.*;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

/** Dialect Api Client * */
@Slf4j
@Singleton
public class DialectProcessingService {
  private final Provider<CobolLanguageClient> cliendProvider;

  @Inject
  public DialectProcessingService(Provider<CobolLanguageClient> clientProvider) {
    this.cliendProvider = clientProvider;
  }

  /**
   * Process Document with a dialect
   *
   * @param preprocessor is a cleaning preprocessor
   * @param dialectName is a dialect name
   * @param context is a processing context
   * @param errorList is an error list to store errors during processing and errors coming from a
   *     dialect
   * @return a list of dialect nodes
   */
  public List<Node> processDialect(
      CleanerPreprocessor preprocessor,
      String dialectName,
      DialectProcessingContext context,
      List<SyntaxError> errorList) {
    DialectClientApi dialectClientApi = cliendProvider.get();

    try {
      DialectProcessingResult result =
          dialectClientApi
              .processDialect(
                  dialectName,
                  context.getExtendedDocument().getUri(),
                  context.getExtendedDocument().toString())
              .get();
      addErrors(errorList, context.getExtendedDocument(), null, result.getDiagnostics());

      return processDocument(
          preprocessor,
          context.getExtendedDocument(),
          result.getReplacements(),
          result.getReplacementMaps(),
          result.getInsertions(),
          result.getInsertionMaps(),
          result.getCopybooks(),
          errorList,
          dialectName,
          null,
          context.getProgramDocumentUri());
    } catch (Exception e) {
      LOG.warn("Dialect {} was stopped due to internal error {}", dialectName, e.getMessage());
      errorList.add(DialectErrorHelper.processingError(context, dialectName));
    }
    return ImmutableList.of();
  }

  private List<Node> processDocument(
      CleanerPreprocessor preprocessor,
      ExtendedDocument document,
      DocumentReplacement[] replacements,
      DocumentReplacementMap[] replacementMaps,
      DocumentInsertion[] insertions,
      DocumentInsertionMap[] insertionMaps,
      DialectCopybookInfo[] copybookInfos,
      List<SyntaxError> errorList,
      String dialectName,
      String parentCopybookId,
      String programUri) {

    // Apply insertion first for simplification
    for (DocumentInsertion insertion : insertions) {
      ExtendedText extendedText = new ExtendedText(insertion.getText(), insertion.getSource());
      document.insertCopybook(insertion.getLine(), extendedText);
    }

    ArrayList<Node> nodes =
        applyReplacements(document, replacements, replacementMaps, insertionMaps, parentCopybookId);

    for (DialectCopybookInfo copybookInfo : copybookInfos) {
      ExtendedText extendedText =
          preprocessor
              .cleanUpCode(copybookInfo.getUri(), copybookInfo.getText())
              .unwrap(errorList::addAll);
      ExtendedDocument copybook = new ExtendedDocument(extendedText, copybookInfo.getUri());
      CopybookName copybookName = new CopybookName(copybookInfo.getCopybookName(), dialectName);
      String copybookId = copybookName.toCopybookId(programUri).toString();

      addErrors(errorList, copybook, copybookId, copybookInfo.getDiagnostics());

      Location statementLocation =
          document.mapLocation(copybookInfo.getStatementLocation().getRange());
      CopyNode copyNode =
          new CopyNode(
              Locality.builder()
                  .uri(statementLocation.getUri())
                  .copybookId(parentCopybookId)
                  .range(statementLocation.getRange())
                  .build(),
              document.mapLocation(copybookInfo.getNameLocation().getRange()),
              copybookInfo.getCopybookName(),
              dialectName,
              copybookInfo.getUri());

      nodes.add(copyNode);

      nodes.addAll(
          processDocument(
              preprocessor,
              copybook,
              copybookInfo.getReplacements(),
              copybookInfo.getReplacementMaps(),
              copybookInfo.getInsertions(),
              copybookInfo.getInsertionMaps(),
              copybookInfo.getCopybooks(),
              errorList,
              dialectName,
              copybookId,
              programUri));

      document.insertCopybook(
          copybookInfo.getStatementLocation().getRange(), copybook.getCurrentText());
    }
    return nodes;
  }

  private static void addErrors(
      List<SyntaxError> errorList,
      ExtendedDocument document,
      String copybookId,
      Diagnostic[] diagnostics) {
    for (Diagnostic diagnostic : diagnostics) {
      Location location = document.mapLocation(diagnostic.getRange());
      errorList.add(
          DialectErrorHelper.dialectDiagnostic(
              Locality.builder()
                  .copybookId(copybookId)
                  .uri(location.getUri())
                  .range(location.getRange())
                  .build(),
              diagnostic.getMessage(),
              getErrorCode(diagnostic.getCode()),
              diagnostic.getRelatedInformation(),
              diagnostic.getSeverity()));
    }
  }

  private static ErrorCode getErrorCode(Either<String, Integer> errorCode) {
    return Optional.ofNullable(errorCode)
        .map(Either::getLeft)
        .map(s -> (ErrorCode) () -> s)
        .orElse(null);
  }

  private static ArrayList<Node> applyReplacements(
      ExtendedDocument document,
      DocumentReplacement[] replacements,
      DocumentReplacementMap[] replacementMaps,
      DocumentInsertionMap[] insertionMaps,
      String copybookId) {
    for (DocumentReplacement replacement : replacements) {
      document.replace(replacement.getRange(), replacement.getText());
    }

    ArrayList<Node> result = new ArrayList<>();
    for (DocumentReplacementMap replacementMap : replacementMaps) {
      Map<String, Token> mappedTokens =
          document.replace(
              replacementMap.getRange(),
              replacementMap.getStatementRange(),
              buildStatementMap(replacementMap.getTokenItems()),
              normalizeReplacementMap(replacementMap.getReplacementMap()));

      addMappedNodes(
          replacementMap.getTokenItems(), mappedTokens, document.getUri(), copybookId, result);
    }

    for (DocumentInsertionMap insertionMap : insertionMaps) {
      Map<String, Token> mappedTokens =
          document.insert(
              insertionMap.getLine(),
              insertionMap.getStatementRange(),
              buildStatementMap(insertionMap.getTokenItems()),
              normalizeReplacementMap(insertionMap.getReplacementMap()));

      addMappedNodes(
          insertionMap.getTokenItems(), mappedTokens, document.getUri(), copybookId, result);
    }
    return result;
  }

  private static Map<String, Token> buildStatementMap(ReplacementTokens[] tokenItems) {
    Map<String, Token> statementMap = new HashMap<>();
    for (ReplacementTokens tokens : tokenItems) {
      Arrays.stream(tokens.getTokens())
          .forEach(
              token ->
                  statementMap.put(
                      token.getName(), new Token(token.getValue(), token.getLocation())));
    }
    return statementMap;
  }

  private static void addMappedNodes(
      ReplacementTokens[] tokenItems,
      Map<String, Token> mappedTokens,
      String uri,
      String copybookId,
      List<Node> result) {
    for (ReplacementTokens tokens : tokenItems) {
      List<Token> mappedTokenList =
          Arrays.stream(tokens.getTokens())
              .map(t -> mappedTokens.get(t.getName()))
              .collect(Collectors.toList());
      NodeHelper.createNodesIfNeeded(tokens.getType(), mappedTokenList, uri, copybookId)
          .ifPresent(result::addAll);
    }
  }

  private static String normalizeReplacementMap(String replacementMap) {
    return Strings.isNullOrEmpty(replacementMap) ? " " : replacementMap;
  }
}
