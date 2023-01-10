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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.analysis;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.CopybookConfig;
import org.eclipse.lsp.cobol.common.copybook.CopybookModel;
import org.eclipse.lsp.cobol.common.copybook.CopybookName;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.DocumentMap;
import org.eclipse.lsp.cobol.common.mapping.TextTransformations;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.core.model.*;
import org.eclipse.lsp.cobol.core.preprocessor.CopybookHierarchy;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.PreprocessorStack;
import org.eclipse.lsp.cobol.common.utils.ImplicitCodeUtils;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.providers.CopybookContentProvider;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.LocalityUtils;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import static java.util.UUID.randomUUID;
import static org.apache.commons.lang3.StringUtils.isEmpty;
import static org.eclipse.lsp.cobol.common.error.ErrorCode.MISSING_COPYBOOK;
import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.ERROR;
import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.INFO;
import static org.eclipse.lsp.cobol.core.preprocessor.ProcessingConstants.*;

/**
 * This class is a framework for the copybook analysis. The actual implementations may change the
 * behavior overriding the methods.
 */
@Slf4j
public abstract class AbstractInjectCodeAnalysis implements InjectCodeAnalysis {
  protected static final int MAX_COPYBOOK_NAME_LENGTH_DEFAULT = Integer.MAX_VALUE;
  private static final String HYPHEN = "-";
  private static final String UNDERSCORE = "_";
  private static final String SYNTAX_ERROR_CHECK_COPYBOOK_NAME =
      "Syntax error by checkCopybookName: {}";

  private final TextPreprocessor preprocessor;
  private final GrammarPreprocessor grammarPreprocessor;
  private final MessageService messageService;
  private final int maxCopybookNameLength;

  AbstractInjectCodeAnalysis(
      TextPreprocessor preprocessor,
      GrammarPreprocessor grammarPreprocessor,
      MessageService messageService,
      int maxCopybookNameLength) {
    this.preprocessor = preprocessor;
    this.grammarPreprocessor = grammarPreprocessor;
    this.messageService = messageService;
    this.maxCopybookNameLength = maxCopybookNameLength;
  }

  @Override
  public void injectCode(CopybookContentProvider copybookContentProvider,
                         CopybookName injectedSourceName,
                         ParserRuleContext context,
                         ParserRuleContext copySource,
                         CopybookConfig config,
                         String documentUri,
                         CopybookHierarchy hierarchy,
                         PreprocessorStack stack,
                         CopybooksRepository copybooksRepository,
                         Map<String, DocumentMapping> nestedMappings,
                         DocumentMap documentMap,
                         List<SyntaxError> errors) {
    Locality nameLocality = LocalityUtils.buildLocality(copySource, documentUri, hierarchy.getCurrentCopybookId());
    Locality contextLocality = LocalityUtils.buildLocality(context, documentUri, hierarchy.getCurrentCopybookId());
    CopybookMetaData copybookMetaData = CopybookMetaData.builder()
            .copybookName(injectedSourceName)
            .context(context)
            .documentUri(documentUri)
            .copybookId(randomUUID().toString())
            .config(config)
            .nameLocality(nameLocality)
            .contextLocality(contextLocality)
            .build();
    CopybookMetaData metaData = validateMetaData(copybookMetaData).unwrap(errors::addAll);

    OldExtendedDocument copybookDocument = buildExtendedDocumentForCopybook(documentMap,
            copybookContentProvider, metaData, hierarchy)
                    .unwrap(errors::addAll);
    writeText(metaData, copybookDocument, stack);

    storeCopyStatementSemantics(metaData, copybookDocument, copybooksRepository);
    collectNestedSemanticData(metaData, copybookDocument, nestedMappings);
  }

  private ResultWithErrors<CopybookMetaData> validateMetaData(CopybookMetaData metaData) {
    List<SyntaxError> errors = new ArrayList<>();
    final String copybookName = metaData.getCopybookName().getDisplayName();
    final Locality locality = metaData.getNameLocality();
    if (copybookName.length() > maxCopybookNameLength && !ImplicitCodeUtils.isImplicit(locality.getUri())) {
      errors.add(
          addCopybookError(
              copybookName,
              maxCopybookNameLength,
              locality,
              INFO,
              "GrammarPreprocessorListener.copyBkOverMaxChars",
              SYNTAX_ERROR_CHECK_COPYBOOK_NAME));
    }
    // The first or last character must not be a hyphen.
    if (copybookName.startsWith(HYPHEN) || copybookName.endsWith(HYPHEN)) {
      errors.add(
          addCopybookError(
              metaData.getCopybookName(),
              locality,
              ERROR,
              "GrammarPreprocessorListener.copyBkStartsOrEndsWithHyphen",
              SYNTAX_ERROR_CHECK_COPYBOOK_NAME));
    }

    // copybook Name can't contain _
    if (copybookName.contains(UNDERSCORE))
      errors.add(
          addCopybookError(
              metaData.getCopybookName(),
              locality,
              ERROR,
              "GrammarPreprocessorListener.copyBkContainsUnderScore",
              SYNTAX_ERROR_CHECK_COPYBOOK_NAME));

    return new ResultWithErrors<>(metaData, errors);
  }

  private void writeText(CopybookMetaData metaData, OldExtendedDocument copybookDocument, PreprocessorStack stack) {
    String text = CPY_ENTER_TAG + metaData.getCopybookId() + CPY_URI_CLOSE + copybookDocument.getText() + CPY_EXIT_TAG;
    beforeWriting(stack);
    stack.write(text);
    afterWriting(metaData.getContext(), stack);
  }

  protected void storeCopyStatementSemantics(
      CopybookMetaData metaData, OldExtendedDocument copybookDocument, CopybooksRepository copybooksRepository) {
    addCopybookUsage(metaData, copybooksRepository);
    addCopybookDefinition(metaData, copybookDocument.getUri(), copybooksRepository);
    collectCopybookStatement(metaData, copybooksRepository);
    addNestedCopybook(copybookDocument, copybooksRepository);
  }

  private ResultWithErrors<OldExtendedDocument>
      buildExtendedDocumentForCopybook(DocumentMap documentMap, CopybookContentProvider copybookContentProvider,
                                       CopybookMetaData metaData, CopybookHierarchy hierarchy) {
    List<SyntaxError> errors = new ArrayList<>();
    CopybookModel model = getCopyBookContent(copybookContentProvider, metaData, hierarchy).unwrap(errors::addAll);
    TextTransformations tt = preprocessor.cleanUpCode(model.getUri(), model.getContent())
            .unwrap(errors::addAll);
    DocumentMap copybookMap = new DocumentMap(tt);
    handleReplacing(metaData, hierarchy, copybookMap, errors);
    return processCopybook(metaData, hierarchy, model.getUri(), copybookMap).accumulateErrors(errors);
  }

  private void collectNestedSemanticData(CopybookMetaData metaData,
                                         OldExtendedDocument copybookDocument,
                                         Map<String, DocumentMapping> nestedMapping) {
  nestedMapping.putAll(copybookDocument.getDocumentMapping());
  nestedMapping.putIfAbsent(metaData.getCopybookId(),
          Optional.ofNullable(nestedMapping.get(copybookDocument.getUri()))
                  .orElseGet(() -> new DocumentMapping(ImmutableList.of(), ImmutableMap.of())));
  }

  protected ResultWithErrors<OldExtendedDocument> processCopybook(
          CopybookMetaData metaData, CopybookHierarchy hierarchy, String uri, DocumentMap copybookMap) {
    hierarchy.push(metaData.toCopybookUsage());
    final ResultWithErrors<OldExtendedDocument> result =
            grammarPreprocessor.buildExtendedDocument(copybookMap, metaData.getConfig(), hierarchy);
    hierarchy.pop();
    return result;
  }

  protected ResultWithErrors<CopybookModel> getCopyBookContent(
      CopybookContentProvider copybookContentProvider,
      CopybookMetaData copybookMetaData, CopybookHierarchy hierarchy) {
    if (copybookMetaData.getCopybookName().getDisplayName().isEmpty())
      return emptyModel(copybookMetaData.getCopybookName(), ImmutableList.of());

    if (hierarchy.hasRecursion(copybookMetaData.getCopybookName()))
      return emptyModel(
          copybookMetaData.getCopybookName(), hierarchy.mapCopybooks(this::reportRecursiveCopybook));

    String programDocumentUri = hierarchy.getRootDocumentUri().orElse(copybookMetaData.getDocumentUri());

    CopybookModel copybookModel = copybookContentProvider
        .read(copybookMetaData.getConfig(), copybookMetaData.getCopybookName(), programDocumentUri, copybookMetaData.getDocumentUri())
        .orElse(null);

    if (copybookModel != null) {
      return new ResultWithErrors<>(copybookModel, ImmutableList.of());
    }

    return emptyModel(
            copybookMetaData.getCopybookName(), ImmutableList.of(reportMissingCopybooks(copybookMetaData)));
  }

  protected void beforeWriting(PreprocessorStack stack) {
    stack.pop();
  }

  protected void afterWriting(ParserRuleContext context, PreprocessorStack stack) {
    stack.accumulateTokenShift(context);
  }

  private void collectCopybookStatement(CopybookMetaData metaData, CopybooksRepository copybooks) {
    copybooks.addStatement(metaData.getCopybookId(),
            metaData.getCopybookName().getDialectType(),
            metaData.getContextLocality());
  }

  protected void addCopybookUsage(CopybookMetaData metaData, CopybooksRepository copybooks) {
    copybooks.addUsage(
      metaData.getCopybookName().getQualifiedName(),
      metaData.getCopybookName().getDialectType(),
      metaData.getNameLocality().toLocation());
  }

  protected void addCopybookDefinition(CopybookMetaData metaData, String uri,
                                                                CopybooksRepository copybooks) {
    if (!(metaData.getCopybookName() == null
            || isEmpty(metaData.getCopybookName().getQualifiedName())
            || isEmpty(uri)
            || ImplicitCodeUtils.isImplicit(uri))) {
      copybooks.define(
              metaData.getCopybookName().getQualifiedName(),
              metaData.getCopybookName().getDialectType(),
              new Location(uri, new Range(new Position(), new Position())));
    }
  }

  protected void addNestedCopybook(OldExtendedDocument copybookDocument, CopybooksRepository copybooks) {
    copybooks.merge(copybookDocument.getCopybooks());
  }

  @SuppressWarnings("unused")
  protected void handleReplacing(
          CopybookMetaData metaData, CopybookHierarchy hierarchy, DocumentMap copybookMap, List<SyntaxError> errors) {
    // no-op
  }

  private SyntaxError reportMissingCopybooks(CopybookMetaData metaData) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .errorSource(ErrorSource.COPYBOOK)
            .location(metaData.getNameLocality().toOriginalLocation())
            .suggestion(
                messageService.getMessage(
                    "GrammarPreprocessorListener.errorSuggestion",
                    metaData.getCopybookName().getQualifiedName()))
            .severity(ERROR)
            .errorCode(MISSING_COPYBOOK)
            .build();
    LOG.debug("Syntax error by reportMissingCopybooks: {}", error.toString());
    return error;
  }

  protected ResultWithErrors<CopybookModel> emptyModel(
      CopybookName copybookName, List<SyntaxError> errors) {
    return new ResultWithErrors<>(new CopybookModel(copybookName.toCopybookId(""), copybookName,
            "", ""), errors);
  }

  protected SyntaxError addCopybookError(
      CopybookName copybookName,
      Locality locality,
      ErrorSeverity info,
      String messageID,
      String logMessage) {
    SyntaxError error =
        SyntaxError.syntaxError().errorSource(ErrorSource.COPYBOOK)
            .severity(info)
            .suggestion(messageService.getMessage(messageID, copybookName.getDisplayName()))
            .location(locality.toOriginalLocation())
            .build();
    LOG.debug(logMessage, error.toString());
    return error;
  }

  protected SyntaxError addCopybookError(
      String copybookName,
      int maxNameLength,
      Locality locality,
      ErrorSeverity info,
      String messageID,
      String logMessage) {
    SyntaxError error =
        SyntaxError.syntaxError().errorSource(ErrorSource.COPYBOOK)
            .severity(info)
            .suggestion(messageService.getMessage(messageID, maxNameLength, copybookName))
            .location(locality.toOriginalLocation())
            .build();
    LOG.debug(logMessage, error.toString());
    return error;
  }

  private SyntaxError reportRecursiveCopybook(CopybookUsage usage) {
    return addCopybookError(
        usage.getName(),
        usage.getLocality(),
        ERROR,
        "GrammarPreprocessorListener.recursionDetected",
        "Syntax error by reportRecursiveCopybook: {}");
  }
}
