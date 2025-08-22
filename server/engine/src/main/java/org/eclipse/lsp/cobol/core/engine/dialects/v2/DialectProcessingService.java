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

import com.google.common.collect.ImmutableList;
import com.google.inject.Provider;
import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import javax.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.CleanerPreprocessor;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.mapping.ExtendedText;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.lsp.jrpc.*;

/** Dialect Api Client * */
@Slf4j
@Singleton
public class DialectProcessingService {
  private final Provider<CobolLanguageClient> cliendProvider;
  private final MessageService messageService;

  @Inject
  public DialectProcessingService(
      Provider<CobolLanguageClient> clientProvider, MessageService messageService) {
    this.cliendProvider = clientProvider;
    this.messageService = messageService;
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
      return processDocument(
          preprocessor,
          context.getExtendedDocument(),
          result.getReplacements(),
          result.getCopybooks(),
          errorList,
          dialectName,
          null);
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
      DialectCopybookInfo[] copybookInfos,
      List<SyntaxError> errorList,
      String dialectName,
      String copybookId) {
    for (DocumentReplacement replacement : replacements) {
      try {
        document.replace(replacement.getRange(), replacement.getText());
      } catch (Exception e) {
        errorList.add(
            DialectErrorHelper.processingError(
                messageService,
                Locality.builder()
                    .copybookId(copybookId)
                    .uri(document.getUri())
                    .range(replacement.getRange())
                    .build(),
                dialectName,
                e.getMessage()));
      }
    }

    List<Node> nodes = new ArrayList<>();
    for (DialectCopybookInfo copybookInfo : copybookInfos) {
      ExtendedText extendedText =
          preprocessor
              .cleanUpCode(copybookInfo.getUri(), copybookInfo.getText())
              .unwrap(errorList::addAll);
      ExtendedDocument copybook = new ExtendedDocument(extendedText, copybookInfo.getUri());

      CopyNode copyNode =
          new CopyNode(
              Locality.builder()
                  .uri(copybookInfo.getStatementLocation().getUri())
                  .copybookId(copybookId)
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
              copybookInfo.getCopybooks(),
              errorList,
              dialectName,
              copybookInfo.getCopybookName()));

      document.insertCopybook(
          copybookInfo.getStatementLocation().getRange(), copybook.getCurrentText());
    }
    return nodes;
  }
}
