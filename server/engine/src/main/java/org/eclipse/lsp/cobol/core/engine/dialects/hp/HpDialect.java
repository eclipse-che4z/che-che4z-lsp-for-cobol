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
package org.eclipse.lsp.cobol.core.engine.dialects.hp;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.CopybookModel;
import org.eclipse.lsp.cobol.common.copybook.CopybookName;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorCodes;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedText;
import org.eclipse.lsp.cobol.common.mapping.MappedCharacter;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp4j.Location;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.ERROR;

/**
 * HP Dialect support
 */
public class HpDialect implements CobolDialect {

  private final CopybookService copybookService;
  private final MessageService messageService;

  public HpDialect(CopybookService copybookService, MessageService messageService) {
    this.copybookService = copybookService;
    this.messageService = messageService;
  }

  @Override
  public String getName() {
    return "HP";
  }

  @Override
  public List<SyntaxError> extend(DialectProcessingContext context) {
    List<SyntaxError> errors = new LinkedList<>();

    List<CopybookDescriptor> cbs = CopybookParser.parseAndCleanup(context.getExtendedDocument());
    cbs.forEach(cb -> {
      String currentUri = context.getExtendedDocument().getUri();
      insertHpCopybook(context, cb, errors);
    });
    return errors;
  }

  @Override
  public ResultWithErrors<DialectOutcome> processText(DialectProcessingContext context) {
    return new ResultWithErrors<>(new DialectOutcome(context.getDialectNodes(), context), ImmutableList.of());
  }

  private void insertHpCopybook(DialectProcessingContext context, CopybookDescriptor descriptor, List<SyntaxError> errors) {
    CopybookName copybookName = new CopybookName(descriptor.getName());
    CopybookModel model = copybookService.resolve(copybookName.toCopybookId(context.getProgramDocumentUri()),
            copybookName, context.getProgramDocumentUri(),
            context.getExtendedDocument().getUri(), false, "hp-cobol")
        .unwrap(errors::addAll);

    Location nameLocation = new Location(context.getExtendedDocument().getUri(), descriptor.getNameRange());
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
      return;
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

    context.getExtendedDocument().insertCopybook(descriptor.getStatementRange(), copybook);

    Locality statementLocality = Locality.builder()
        .copybookId(copybookName.toCopybookId(context.getProgramDocumentUri()).toString())
        .range(descriptor.getStatementRange())
        .uri(context.getExtendedDocument().getUri())
        .build();

    CopyNode copyNode = new CopyNode(statementLocality, nameLocation, descriptor.getName(), model.getUri());
    context.getDialectNodes().add(copyNode);
  }
}
