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

import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.FunctionDeclaration;
import org.eclipse.lsp.cobol.common.model.tree.FunctionReference;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/** Processor for FUnctionDeclaration */
public class FunctionDeclarationProcessor implements Processor<FunctionDeclaration> {
  private final SymbolAccumulatorService symbolAccumulatorService;

  private static final String WHEN_COMPILED = "WHEN-COMPILED";
  private static final String ALL = "ALL";

  public FunctionDeclarationProcessor(SymbolAccumulatorService symbolAccumulatorService) {
    this.symbolAccumulatorService = symbolAccumulatorService;
  }

  @Override
  public void accept(FunctionDeclaration functionDeclaration, ProcessingContext processingContext) {
    updateFunctionInfo(functionDeclaration);
    if (functionDeclaration.isIntrinsic()) {
      checkSemanticsForIntrinsicFunctions(functionDeclaration, processingContext);
    } else if (functionDeclaration.getChildren().size() > 1) {
      checkSemanticsForUserDefinedFunctions(functionDeclaration, processingContext);
    }
  }

  private void updateFunctionInfo(FunctionDeclaration functionDeclaration) {
    Optional<Node> nearestParentByType = functionDeclaration.getNearestParentByType(NodeType.PROGRAM);
    if (nearestParentByType.isPresent()) {
      ProgramNode parent = (ProgramNode) nearestParentByType.get();
      getFunctionReferences(functionDeclaration)
          .forEach(
              reference -> {
                SymbolAccumulatorService.FunctionInfo functionInfo =
                    symbolAccumulatorService.getFunctionReference(
                        reference.getName().toUpperCase());
                if (functionInfo != null) functionInfo.getDeclaredProgramNode().add(parent);
              });
    }
  }

  private void checkSemanticsForIntrinsicFunctions(
      FunctionDeclaration functionDeclaration, ProcessingContext processingContext) {
    List<FunctionReference> functionReferences = getFunctionReferences(functionDeclaration);
    functionDeclaration.getNearestParentByType(NodeType.PROGRAM).map(ProgramNode.class::cast).ifPresent(programNode -> {
      checkSemanticsForAllImplicitFunctionDeclaration(functionReferences, processingContext, programNode);
    });
    checkIfWhenCompiledIntrinsicFunctionDeclared(functionReferences, processingContext);
  }

  private void checkSemanticsForUserDefinedFunctions(
      FunctionDeclaration functionDeclaration, ProcessingContext processingContext) {
    getFunctionReferences(functionDeclaration).stream()
        .skip(1)
        .forEach(
            funcReference ->
                addError(
                    processingContext,
                    funcReference,
                    "The \"FUNCTION\" phrase of the \"REPOSITORY\" paragraph contained more than one user-defined function definition"));
  }

  private void checkSemanticsForAllImplicitFunctionDeclaration(
          List<FunctionReference> functionReferences, ProcessingContext processingContext, ProgramNode programNode) {
    boolean hasAllFunction =
        functionReferences.stream().anyMatch(ref -> ref.getName().equalsIgnoreCase(ALL));

    if (hasAllFunction && functionReferences.size() > 1) {
      functionReferences.forEach(
          funcReference ->
              addError(
                  processingContext, funcReference, "\"%s\" was invalid", funcReference.getName()));
      return;
    }

    if (hasAllFunction) {
      symbolAccumulatorService.declareAllIntrinsicFUnctions(programNode);
    }

  }

  private void checkIfWhenCompiledIntrinsicFunctionDeclared(
      List<FunctionReference> functionReferences, ProcessingContext processingContext) {
    functionReferences.stream()
        .filter(ref -> ref.getName().equalsIgnoreCase(WHEN_COMPILED))
        .forEach(
            funcReference ->
                addError(
                    processingContext,
                    funcReference,
                    "WHEN-COMPILED can not be specified in the FUNCTION clause of the REPOSITORY paragraph"));
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
