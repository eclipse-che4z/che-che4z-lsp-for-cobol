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
 *    Broadcom, Inc. - initial API and implementation
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
import org.eclipse.lsp.cobol.common.mapping.TextMapReplacer;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.lsp.jrpc.*;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Range;
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
      DialectCopybookInfo[] copybookInfos,
      List<SyntaxError> errorList,
      String dialectName,
      String parentCopybookId,
      String programUri) {

    ArrayList<Node> nodes =
        applyReplacements(document, replacements, replacementMaps, parentCopybookId);

    for (DialectCopybookInfo copybookInfo : copybookInfos) {
      ExtendedText extendedText =
          preprocessor
              .cleanUpCode(copybookInfo.getUri(), copybookInfo.getText())
              .unwrap(errorList::addAll);
      ExtendedDocument copybook = new ExtendedDocument(extendedText, copybookInfo.getUri());
      CopybookName copybookName = new CopybookName(copybookInfo.getCopybookName(), dialectName);
      String copybookId = copybookName.toCopybookId(programUri).toString();

      addErrors(errorList, copybook, copybookId, copybookInfo.getDiagnostics());

      CopyNode copyNode =
          new CopyNode(
              Locality.builder()
                  .uri(copybookInfo.getStatementLocation().getUri())
                  .copybookId(parentCopybookId)
                  .range(copybookInfo.getStatementLocation().getRange())
                  .build(),
              copybookInfo.getNameLocation(),
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
          DialectErrorHelper.dialectError(
              Locality.builder()
                  .copybookId(copybookId)
                  .uri(location.getUri())
                  .range(location.getRange())
                  .build(),
              diagnostic.getMessage(),
              getErrorCode(diagnostic.getCode()),
              diagnostic.getRelatedInformation()));
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
      String copybookId) {
    for (DocumentReplacement replacement : replacements) {
      document.replace(replacement.getRange(), replacement.getText());
    }

    ArrayList<Node> result = new ArrayList<>();
    for (DocumentReplacementMap replacementMap : replacementMaps) {
      Map<String, Range> statementMap = new HashMap<>();
      for (ReplacementTokens tokens : replacementMap.getTokenItems()) {
        Arrays.stream(tokens.getTokens())
            .forEach(token -> statementMap.put(token.getName(), token.getRange()));
      }
      Map<String, TextMapReplacer.Token> mappedTokens =
          document.replace(
              replacementMap.getRange(),
              replacementMap.getStatementRange(),
              statementMap,
              normalizeReplacementMap(replacementMap.getReplacementMap()));

      for (ReplacementTokens tokens : replacementMap.getTokenItems()) {

        List<TextMapReplacer.Token> mappedTokenList =
            Arrays.stream(tokens.getTokens())
                .map(t -> mappedTokens.get(t.getName()))
                .collect(Collectors.toList());
        NodeHelper.createNodesIfNeeded(
                tokens.getType(), mappedTokenList, document.getUri(), copybookId)
            .ifPresent(result::addAll);
      }
    }
    return result;
  }

  private static String normalizeReplacementMap(String replacementMap) {
    return Strings.isNullOrEmpty(replacementMap) ? " " : replacementMap;
  }
}
