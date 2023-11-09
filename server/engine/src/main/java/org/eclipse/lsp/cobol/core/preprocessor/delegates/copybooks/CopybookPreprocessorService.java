/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.*;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.utils.ImplicitCodeUtils;
import org.eclipse.lsp.cobol.common.utils.StringUtils;
import org.eclipse.lsp.cobol.core.CobolPreprocessor;
import org.eclipse.lsp.cobol.core.model.CopybookUsage;
import org.eclipse.lsp.cobol.core.preprocessor.CopybookHierarchy;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.GrammarPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.PreprocessorContext;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement.ReplacementContext;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement.ReplacementHelper;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement.ReplacingService;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.LocalityUtils;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp.cobol.core.visitor.VisitorHelper;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/**
 * Provides managing copybook mapping functionality
 */
@Slf4j
@RequiredArgsConstructor
class CopybookPreprocessorService {
  private final String programDocumentUri;
  private final GrammarPreprocessor grammarPreprocessor;
  private final ExtendedDocument currentDocument;

  private final CopybookService copybookService;
  private final CopybookProcessingMode copybookConfig;

  @Getter
  private final CopybooksRepository copybooks;
  @Getter
  private final List<SyntaxError> errors = new ArrayList<>();

  private final CopybookHierarchy hierarchy;
  private final ReplacingService replacingService;
  private final CopybookErrorService copybookErrorService;

  private static final String HYPHEN = "-";
  private static final String UNDERSCORE = "_";

  CopybookPreprocessorService(String programDocumentUri,
                                     GrammarPreprocessor grammarPreprocessor,
                                     ExtendedDocument currentDocument,
                                     CopybookService copybookService,
                                     CopybookProcessingMode copybookConfig,
                                     CopybooksRepository copybooks,
                                     CopybookHierarchy hierarchy,
                                     MessageService messageService,
                                     ReplacingService replacingService) {
    this.programDocumentUri = programDocumentUri;
    this.grammarPreprocessor = grammarPreprocessor;
    this.currentDocument = currentDocument;
    this.copybookService = copybookService;
    this.copybookConfig = copybookConfig;
    this.copybooks = copybooks;
    this.hierarchy = hierarchy;
    this.replacingService = replacingService;
    this.copybookErrorService = new CopybookErrorService(messageService);
  }

  void addCopybook(ParserRuleContext ctx, CobolPreprocessor.CopySourceContext copySource,
                          int maxCopybookLen, List<ReplacementContext> replacementContext) {
    CopybookName name = getCopybookName(copySource);
    String copybookName = name.getQualifiedName();
    String copybookId = name.toCopybookId(programDocumentUri).toString();

    Range range = VisitorHelper.constructRange(ctx);
    Locality nameLocality = mapLocality(retrieveLocality(copySource));
    Locality statementLocality = mapLocality(retrieveLocality(ctx));

    CopybookModel copybook = read(name, currentDocument.getUri());
    copybooks.addUsage(copybookName, null, nameLocality.toLocation());

    validateCopybookName(name, nameLocality, maxCopybookLen);

    if (copybook != null) {
      if (hierarchy.hasRecursion(name)) {
        List<SyntaxError> hierarchyErrors = hierarchy.mapCopybooks(cu -> copybookErrorService.addRecursionError(name.getQualifiedName(), cu.getLocality()));
        hierarchyErrors.add(copybookErrorService.addRecursionError(name.getQualifiedName(), statementLocality));
        errors.addAll(hierarchyErrors);
        currentDocument.clear(VisitorHelper.constructRange(ctx));
        copybooks.define(copybookName, null, currentDocument.getUri(), copybook.getUri());
        return;
      }
      copybooks.addStatement(copybookName, null, statementLocality);

      prepareReplacements(ctx);
      ExtendedDocument copybookDocument = processCopybookWithReplacement(replacementContext, copybook, nameLocality);

      if (firstInstruction(currentDocument, range.getStart())) {
        currentDocument.insertCopybook(range, copybookDocument.getCurrentText());
      } else {
        currentDocument.insertCopybookWithPadding(range, copybookDocument.getCurrentText());
      }
      copybooks.define(copybookName, null, currentDocument.getUri(), copybook.getUri());
    } else {
      currentDocument.clear(VisitorHelper.constructRange(ctx));
      errors.add(copybookErrorService.addMissingCopybook(name.getQualifiedName(), nameLocality));
    }
  }

  private void prepareReplacements(ParserRuleContext ctx) {
    ReplacementHelper.createClause(ctx.children).forEach(c -> {
      Pair<String, String> replacing;
      if (c.getKey().contains("==")) {
        replacing = replacingService.retrievePseudoTextReplacingPattern(c.getKey(), mapLocality(c.getValue()))
            .unwrap(errors::addAll);
      } else {
        replacing = replacingService.retrieveTokenReplacingPattern(c.getKey());
      }
      hierarchy.addCopyReplacing(replacing);
    });
  }

  private ExtendedDocument processCopybookWithReplacement(List<ReplacementContext> replacementContext, CopybookModel copybook,
                                                        Locality nameLocality) {
    hierarchy.push(new CopybookUsage(copybook.getCopybookName(), CopybooksRepository.toId(copybook.getCopybookName().getQualifiedName(), null, nameLocality.getUri()), nameLocality));
    if (replacementContext != null) {
      replacementContext.forEach(h -> hierarchy.addTextReplacing(h.getReplacement(), h.getLocality().getUri(), h.getLocality().getRange()));
    }

    ExtendedDocument copybookDocument = new ExtendedDocument(copybook.getContent(), copybook.getUri());
    hierarchy.prepareCopybookReplacement(copybook.getUri());

    if (hierarchy.containsRecursiveReplacement()) {
      errors.add(copybookErrorService.addRecursiveReplacementError(copybook.getCopybookName(), nameLocality));
    }

    hierarchy.replaceCopybook(copybookDocument, replacingService::applyReplacing, errors);

    PreprocessorContext copybookContext = new PreprocessorContext(programDocumentUri, copybookDocument, copybookConfig, hierarchy, copybooks);
    List<SyntaxError> copybookErrors = new LinkedList<>();
    grammarPreprocessor.preprocess(copybookContext).unwrap(copybookErrors::addAll);

    errors.addAll(copybookErrors);
    List<SyntaxError> distinct = errors.stream().distinct().collect(Collectors.toList());
    errors.clear();
    errors.addAll(distinct);

    hierarchy.pop();
    copybookDocument.commitTransformations();
    return copybookDocument;
  }

  private Locality mapLocality(Locality locality) {
    Location location = currentDocument.mapLocation(locality.getRange());
    return Locality.builder()
        .uri(location.getUri())
        .range(location.getRange())
        .copybookId(locality.getCopybookId())
        .build();
  }

  private Locality mapLocality(Range range) {
    Location location = currentDocument.mapLocation(range);
    return Locality.builder()
        .uri(location.getUri())
        .range(location.getRange())
        .build();
  }

  void reportInvalidArgument(CobolPreprocessor.ControlCblContext ctx) {
    errors.add(copybookErrorService.addInvalidArgument(retrieveLocality(ctx), ctx.getText()));
  }

  private void validateCopybookName(CopybookName name, Locality locality, int maxLen) {
    if (name.getQualifiedName().length() > maxLen && !ImplicitCodeUtils.isImplicit(locality.getUri())) {
      errors.add(copybookErrorService.addCopybookNameError(name, locality, maxLen));
    }
    // The first or last character must not be a hyphen.
    if (name.getQualifiedName().startsWith(HYPHEN) || name.getQualifiedName().endsWith(HYPHEN)) {
      errors.add(copybookErrorService.addHyphenError(name, locality));
    }

    // copybook Name can't contain _
    if (name.getQualifiedName().contains(UNDERSCORE))
      errors.add(copybookErrorService.addUnderscoreError(name, locality));
  }

  private boolean firstInstruction(ExtendedDocument extendedDocument, Position start) {
    if (start.getCharacter() < 7) {
      return true;
    }
    String text = extendedDocument.toString();
    String[] lines = text.split("\\r?\\n");
    if (lines.length <= start.getLine()) {
      return true;
    }
    String line = lines[start.getLine()];
    if (line.length() < 7) {
      return true;
    }
    line = line.substring(7, Math.min(start.getCharacter(), line.length()));
    return line.trim().isEmpty();
  }

  private CopybookName getCopybookName(CobolPreprocessor.CopySourceContext ctx) {
    return new CopybookName(StringUtils.trimQuotes(ctx.getText()));
  }

  private CopybookModel read(CopybookName copybookName, String documentUri) {
    ResultWithErrors<CopybookModel> resolvedCopybook = copybookService.resolve(
            copybookName.toCopybookId(programDocumentUri),
            copybookName,
            programDocumentUri,
            documentUri,
            true);
    CopybookModel copybookModel = resolvedCopybook.getResult();
    if (copybookModel.getContent() == null) {
      return null;
    }
    errors.addAll(resolvedCopybook.getErrors());
    return copybookModel;
  }

  Locality retrieveLocality(ParserRuleContext ctx) {
    return LocalityUtils.buildLocality(ctx, currentDocument.getUri(), hierarchy.getCurrentCopybookId());
  }

  void replaceWithSpaces(ParserRuleContext ctx) {
    Range range = VisitorHelper.constructRange(ctx);
    currentDocument.replace(range, org.apache.commons.lang3.StringUtils.rightPad(" ", range.getEnd().getCharacter() - range.getStart().getCharacter()));
  }
}
