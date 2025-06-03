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

import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.ERROR;

import com.google.inject.Provider;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.function.Consumer;
import javax.inject.Inject;
import javax.inject.Singleton;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.Value;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.copybook.CopybookModel;
import org.eclipse.lsp.cobol.common.copybook.CopybookName;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorCodes;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.lsp.jrpc.*;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp.cobol.common.model.tree.Node;

/** Dialect Api Client * */
@Slf4j
@Singleton
public class DialectProcessingManager {
  private final Provider<CobolLanguageClient> cliendProvider;
  private final CopybookService copybookService;
  private final MessageService messageService;
  private final Map<String, DialectProcessingContextData> dialectProcesses =
      new ConcurrentHashMap<>();

  @Value
  private static class DocumentInfo {
    String name;
    ExtendedDocument document;
  }

  @RequiredArgsConstructor
  @Getter
  private static class DialectProcessingContextData {
    private final CountDownLatch processingMonitor = new CountDownLatch(1);
    private final Map<String, DocumentInfo> documents = new HashMap<>();
    private final DialectProcessingContext context;
    private final List<SyntaxError> errorList;
    private final List<Node> nodes = new ArrayList<>();
  }

  @Inject
  public DialectProcessingManager(
      Provider<CobolLanguageClient> clientProvider,
      CopybookService copybookService,
      MessageService messageService) {
    this.cliendProvider = clientProvider;
    this.copybookService = copybookService;
    this.messageService = messageService;
  }

  /**
   * Process Document with a dialect
   *
   * @param name is a dialect name
   * @param context is a processing context
   * @param errorList is an error list to store errors during processing and errors coming from a
   *     dialect
   * @return a list of dialect nodes
   */
  @SneakyThrows
  public List<Node> processDialect(
      String name, DialectProcessingContext context, List<SyntaxError> errorList) {
    DialectClientApi dialectClientApi = cliendProvider.get();

    DialectProcessingContextData contextData = new DialectProcessingContextData(context, errorList);
    dialectProcesses.put(createKey(name, context.getProgramDocumentUri()), contextData);
    contextData.getDocuments().put(context.getProgramDocumentUri(), new DocumentInfo("", context.getExtendedDocument()));

    dialectClientApi.processDialect(
        name, context.getExtendedDocument().getUri(), context.getExtendedDocument().toString());
    contextData.getProcessingMonitor().await();
    dialectProcesses.remove(createKey(name, context.getProgramDocumentUri()));

    return contextData.getNodes();
  }

  /**
   * Process the copybook
   *
   * @param dialectName is a dialect name
   * @param programUri is a program uri
   * @param copybookName is a copybook name
   * @param statementLocation is a copybook statement location
   * @return copybook content and uri object
   */
  public CopybookResult resolveCopybook(
      String dialectName, String programUri, String copybookName, Location statementLocation) {
    DialectProcessingContextData contextData =
        dialectProcesses.get(createKey(dialectName, programUri));
    if (contextData == null) {
      LOG.warn("Dialect {} was not found, resolve copybook operation ignored", dialectName);
      return new CopybookResult(null, null, null);
    }
    CopybookName name = new CopybookName(copybookName, dialectName);
    String programDocumentUri = contextData.getContext().getProgramDocumentUri();
    CopybookModel copybookModel =
        copybookService
            .resolve(
                name.toCopybookId(programDocumentUri),
                name,
                programDocumentUri,
                contextData.getContext().getExtendedDocument().getUri(),
                contextData.getContext().getPreprocessor())
            .unwrap(errors -> contextData.getErrorList().addAll(errors));

    if (copybookModel.getContent() == null) {
      Locality locality =
          Locality.builder()
              .range(statementLocation.getRange())
              .uri(statementLocation.getUri())
              .build();
      contextData.getErrorList().add(missingCopybooks(locality, copybookName));
      return new CopybookResult(null, null, null);
    }
    ExtendedDocument copybook = new ExtendedDocument(copybookModel.getContent(), copybookModel.getUri());

    contextData.getDocuments().put(copybookModel.getUri(), new DocumentInfo(copybookName, copybook));
    return new CopybookResult(copybookName, copybookModel.getUri(), copybookModel.getContent());
  }

  /**
   * Change the document fragment with given location to the provided text
   *
   * @param dialectName is a dialect name
   * @param programUri is a program uri
   * @param statementLocation is copybook statement location
   * @param nameLocation is copybook name location
   * @param copybookUri is a copybook uri
   * @param replacements is a document replacements array that must be applied before copybook
   *     insertion
   */
  public void insertCopybook(
      String dialectName,
      String programUri,
      Location statementLocation,
      Location nameLocation,
      String copybookUri,
      DocumentReplacement[] replacements) {
    execute(
        dialectName,
        programUri,
        contextData -> {
          // Prepare copybook for insertion
          DocumentInfo copybookInfo = contextData.getDocuments().get(copybookUri);
          Locality statementLocality = Locality.builder()
              .uri(statementLocation.getUri())
              .range(statementLocation.getRange())
              .build();

          if (copybookInfo != null) {
            for (DocumentReplacement replacement : replacements) {
              try {
                copybookInfo.getDocument().replace(
                    replacement.getRange(),
                    replacement.getText());
              } catch (Exception e) {
                LOG.warn("Error processing document {} with replacement {}, insert copybook operation ignored", copybookUri, replacement);
                Locality locality = Locality.builder()
                    .uri(copybookUri)
                    .range(replacement.getRange())
                    .copybookId(copybookInfo.getName())
                    .build();
                contextData.getErrorList().add(processingError(locality, dialectName, e.getMessage()));
              }
            }

            DocumentInfo targetDocument =
                contextData.getDocuments().get(statementLocation.getUri());
            if (targetDocument != null) {
              targetDocument.getDocument().insertCopybook(statementLocation.getRange(), copybookInfo.getDocument().getCurrentText());
              contextData.getNodes().add(new CopyNode(statementLocality, nameLocation, copybookInfo.getName(), copybookUri));
            } else {
              String message = String.format("Target document %s for insertion of the dialect copybook %s was not found",
                  dialectName,
                  copybookUri);
              contextData.getErrorList().add(processingError(statementLocality, dialectName, message));
            }
          } else {
            String message = String.format("Dialect %s copybook %s was not found, operation ignored",
                dialectName,
                copybookUri);
            LOG.warn(message);
            contextData.getErrorList().add(processingError(statementLocality, dialectName, message));
          }
        });
  }

  /**
   * Finish dialect processing
   *
   * @param dialectName is a dialect name
   * @param programUri is a program uri
   * @param replacements is an array of replacement objects
   */
  public void finish(String dialectName, String programUri, DocumentReplacement[] replacements) {
    execute(
        dialectName,
        programUri,
        contextData -> {
          for (DocumentReplacement replacement : replacements) {
            contextData
                .getContext()
                .getExtendedDocument()
                .replace(replacement.getRange(), replacement.getText());
          }
          contextData.getProcessingMonitor().countDown();
        });
  }

  private String createKey(String dialectName, String programUri) {
    return String.format("%s:%s", dialectName, programUri);
  }

  private void execute(
      String dialectName, String programUri, Consumer<DialectProcessingContextData> consumer) {
    DialectProcessingContextData contextData =
        dialectProcesses.get(createKey(dialectName, programUri));
    if (contextData != null) {
      try {
        consumer.accept(contextData);
      } catch (Exception e) {
        LOG.warn(
            "Dialect {} for the program {} fails with error {}",
            dialectName,
            programUri,
            e.getMessage());
      }
    } else {
      LOG.warn(
          "Dialect {} for the program {} was not found, operation ignored",
          dialectName,
          programUri);
    }
  }

  private SyntaxError missingCopybooks(Locality locality, String copybookName) {
    return SyntaxError.syntaxError()
        .errorSource(ErrorSource.DIALECT)
        .location(locality.toOriginalLocation())
        .suggestion(
            messageService.getMessage("GrammarPreprocessorListener.errorSuggestion", copybookName))
        .severity(ERROR)
        .errorCode(ErrorCodes.MISSING_COPYBOOK)
        .build();
  }

  private SyntaxError processingError(Locality locality, String dialect, String message) {
    return SyntaxError.syntaxError()
        .errorSource(ErrorSource.DIALECT)
        .location(locality.toOriginalLocation())
        .suggestion(
            messageService.getMessage("GrammarPreprocessorListener.errorProcessingDialect", dialect, message))
        .severity(ERROR)
        .errorCode(ErrorCodes.MISSING_COPYBOOK)
        .build();
  }

}
