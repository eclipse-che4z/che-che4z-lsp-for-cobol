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
package org.eclipse.lsp.cobol.core.engine.errors;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;

import java.util.*;
import java.util.function.Predicate;
import java.util.stream.Stream;

import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;

/**
 * Process errors for copybooks statements
 */
@Singleton
public class ErrorFinalizerService {

  private final MessageService messageService;

  @Inject
  public ErrorFinalizerService(MessageService messageService) {
    this.messageService = messageService;
  }

  /**
   * Localize syntax error
   * @param syntaxError - syntax error
   * @return localized syntax error
   */
  public SyntaxError localizeErrorMessage(SyntaxError syntaxError) {
    return ofNullable(syntaxError.getMessageTemplate())
        .map(messageService::localizeTemplate)
        .map(message -> syntaxError.toBuilder().messageTemplate(null).suggestion(message).build())
        .orElse(syntaxError);
  }

  /**
   * Process errors to check if needed to create errors for copybook statements
   * @param ctx - an analysis context
   * @param copybooksRepository - copybook repository
   */
  public void processLateErrors(AnalysisContext ctx, CopybooksRepository copybooksRepository) {
    ctx.getAccumulatedErrors().addAll(collectErrorsForCopybooks(ctx.getAccumulatedErrors(), copybooksRepository));
    List<SyntaxError> distinct = ctx.getAccumulatedErrors().stream().distinct().collect(toList());
    ctx.getAccumulatedErrors().clear();
    ctx.getAccumulatedErrors().addAll(distinct);
  }

  private List<SyntaxError> collectErrorsForCopybooks(
      List<SyntaxError> errors, CopybooksRepository copybooksRepository) {
    Set<SyntaxError> processedErrors = new HashSet<>();
    errors.stream()
        .filter(shouldRaise(processedErrors))
        .forEach(err -> raiseError(err,  copybooksRepository, processedErrors));
    return new LinkedList<>(processedErrors);
  }

  private void raiseError(SyntaxError error,
                          CopybooksRepository copybooksRepository, Set<SyntaxError> processedErrors) {
    Stream.of(error)
        .filter(shouldRaise(processedErrors))
        .forEach(
            err -> {
              for (Locality locality : copybooksRepository.getDefinitionStatements().get(err.getLocation().getCopybookId())) {
                raiseErrorForCopybook(locality, processedErrors, copybooksRepository);
              }
            });
  }

  private void raiseErrorForCopybook(Locality copybookStatementLocality,
                                     Set<SyntaxError> processedErrors,
                                     CopybooksRepository copybooksRepository) {
    SyntaxError newError = SyntaxError.syntaxError()
        .location(copybookStatementLocality.toOriginalLocation())
        .errorSource(ErrorSource.COPYBOOK)
        .severity(ErrorSeverity.ERROR)
        .suggestion(
            messageService.getMessage("postprocessing.copybookHasErrors"))
        .build();
    if (processedErrors.contains(newError)) {
      return;
    }
    processedErrors.add(newError);
    for (Locality locality : copybooksRepository.getDefinitionStatements().get(newError.getLocation().getCopybookId())) {
      raiseErrorForCopybook(locality, processedErrors, copybooksRepository);
    }
  }

  private Predicate<SyntaxError> shouldRaise(Set<SyntaxError> processedErrors) {
    return err -> (err.getLocation() != null && err.getLocation().getCopybookId() != null
        && !processedErrors.contains(err));
  }

}
