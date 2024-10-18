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
package org.eclipse.lsp.cobol.core.engine.processors;

import lombok.AllArgsConstructor;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.tree.FunctionDeclaration;
import org.eclipse.lsp.cobol.common.model.tree.FunctionReference;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;

import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

/** Adds repository information to the program nodes */
@AllArgsConstructor
public class ProgramRepositoryEnricher implements Processor<FunctionDeclaration> {
  private final SymbolAccumulatorService symbolAccumulatorService;

  @Override
  public void accept(FunctionDeclaration functionDeclaration, ProcessingContext processingContext) {
    addFunctionDeclarationsToProgramRepository(functionDeclaration, processingContext);
  }

  private void addFunctionDeclarationsToProgramRepository(
      FunctionDeclaration functionDeclaration, ProcessingContext processingContext) {
    functionDeclaration
        .getProgram()
        .ifPresent(
            program -> {
              Map<String, Pair<String, Boolean>> repository = program.getRepository();

              if (functionDeclaration.isDeclareAllIntrinsicFunctions()) {
                symbolAccumulatorService
                    .getAllImplicitFunctionNames()
                    .forEach(name -> repository.put(name, Pair.of(name, true)));
              }

              getFunctionReferences(functionDeclaration)
                  .forEach(
                      reference ->
                          addOrValidateFunction(
                              repository, reference, functionDeclaration, processingContext));
            });
  }

  private void addOrValidateFunction(
      Map<String, Pair<String, Boolean>> repository,
      FunctionReference reference,
      FunctionDeclaration functionDeclaration,
      ProcessingContext processingContext) {
    boolean isIntrinsic = functionDeclaration.isIntrinsic();
    repository.compute(
        reference.getName().toUpperCase(Locale.ROOT),
        (key, existingValue) -> {
          if (existingValue != null && existingValue.getRight() != isIntrinsic) {
            addError(
                processingContext,
                reference,
                "Name '%s' was previously defined in the REPOSITORY paragraph.", reference.getName());
          }
          return existingValue != null ? existingValue : Pair.of(key, isIntrinsic);
        });
  }

  private List<FunctionReference> getFunctionReferences(FunctionDeclaration functionDeclaration) {
    return functionDeclaration.getChildren().stream()
        .filter(FunctionReference.class::isInstance)
        .map(FunctionReference.class::cast)
        .collect(Collectors.toList());
  }

  private void addError(
      ProcessingContext processingContext, FunctionReference node, String message, Object... args) {
    processingContext
        .getErrors()
        .add(
            SyntaxError.syntaxError()
                .errorSource(ErrorSource.PARSING)
                .messageTemplate(MessageTemplate.of(message, args))
                .severity(ErrorSeverity.ERROR)
                .location(node.getLocality().toOriginalLocation())
                .build());
  }
}
