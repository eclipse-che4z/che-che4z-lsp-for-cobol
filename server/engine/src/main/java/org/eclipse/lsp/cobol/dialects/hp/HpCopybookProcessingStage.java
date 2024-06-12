/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.dialects.hp;

import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.ERROR;

import com.google.common.collect.ImmutableList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import lombok.RequiredArgsConstructor;
import org.eclipse.lsp.cobol.common.copybook.CopybookModel;
import org.eclipse.lsp.cobol.common.copybook.CopybookName;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorCodes;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.mapping.ExtendedText;
import org.eclipse.lsp.cobol.common.mapping.MappedCharacter;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.pipeline.Stage;
import org.eclipse.lsp.cobol.common.pipeline.StageResult;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp4j.Location;

/**
 * Resolving and inserting copybooks into the extended source stage
 */
@RequiredArgsConstructor
public class HpCopybookProcessingStage implements Stage<AnalysisContext, DialectOutcome, Void> {

  private final MessageService messageService;
  private final CopybookService copybookService;

  @Override
  public StageResult<DialectOutcome> run(AnalysisContext context, StageResult<Void> prevStageResult) {
    List<SyntaxError> errors = new LinkedList<>();
    List<CopybookDescriptor> cbs = CopybookParser.parseAndCleanup(context.getExtendedDocument());
    cbs.forEach(
        cb -> {
          List<CopyNode> copybookNodes =
              insertHpCopybook(context.getDocumentUri(), context.getExtendedDocument(), cb, errors);
          context.getDialectNodes().addAll(copybookNodes);
        });

    DialectOutcome outcome =
        new DialectOutcome(
            Optional.ofNullable(context.getDialectNodes()).orElse(Collections.emptyList()),
            DialectProcessingContext.builder()
                .languageId(CobolLanguageId.HP_COBOL.getId())
                .config(context.getConfig())
                .programDocumentUri(context.getExtendedDocument().getUri())
                .extendedDocument(context.getExtendedDocument())
                .build());
    return new StageResult<>(outcome);
  }

  @Override
  public String getName() {
    return "Copybook processing";
  }

  private List<CopyNode> insertHpCopybook(String programUri, ExtendedDocument extendedDocument, CopybookDescriptor descriptor, List<SyntaxError> errors) {
    CopybookName copybookName = new CopybookName(descriptor.getName());
    CopybookModel model = copybookService.resolve(copybookName.toCopybookId(extendedDocument.getUri()),
            copybookName, programUri,
            extendedDocument.getUri(), null)
        .unwrap(errors::addAll);

    Location nameLocation = new Location(extendedDocument.getUri(), descriptor.getNameRange());
    if (model.getUri() == null) {
      errors.add(SyntaxError.syntaxError()
          .errorSource(ErrorSource.DIALECT)
          .suggestion(
              messageService.getMessage(
                  "GrammarPreprocessorListener.errorSuggestion",
                  copybookName.getQualifiedName()))
          .severity(ERROR)
          .errorCode(ErrorCodes.MISSING_COPYBOOK)
          .location(new OriginalLocation(nameLocation, null))
          .build());
      return ImmutableList.of();
    }

    String text = model.getContent();
    ExtendedText copybook = new ExtendedText(text, model.getUri());
    Set<Character> unsupported = new HashSet<>();
    unsupported.add('?');
    copybook.perform(
        (line) -> {
          for (MappedCharacter character : line.getCharacters()) {
            if (unsupported.contains(character.getCharacter())) {
              character.setCharacter(' ');
            }
          }
        }
    );

    extendedDocument.insertCopybook(descriptor.getStatementRange(), copybook);

    Locality statementLocality = Locality.builder()
        .copybookId(copybookName.toCopybookId(programUri).toString())
        .range(descriptor.getStatementRange())
        .uri(extendedDocument.getUri())
        .build();

    CopyNode copyNode = new CopyNode(statementLocality, nameLocation, descriptor.getName(), model.getUri());
    return ImmutableList.of(copyNode);
  }

}
