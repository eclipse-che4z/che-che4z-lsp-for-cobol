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
import org.eclipse.lsp.cobol.common.model.tree.FunctionDeclaration;
import org.eclipse.lsp.cobol.common.model.tree.FunctionReference;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/** Add definition of intrinsic functions as well as the program nodes where its declared */
@AllArgsConstructor
public class ImplicitFunctionsDefinitionEnricher implements Processor<FunctionDeclaration> {
  private final SymbolAccumulatorService symbolAccumulatorService;

  @Override
  public void accept(FunctionDeclaration functionDeclaration, ProcessingContext processingContext) {
    List<FunctionReference> functionReferences = getFunctionReferences(functionDeclaration);
    updateFunctionInfo(functionDeclaration, functionReferences);
    boolean hasAllFunction =
        functionReferences.stream().anyMatch(ref -> ref.getName().equalsIgnoreCase("ALL"));
    if (functionDeclaration.isIntrinsic() && hasAllFunction) {
      functionDeclaration
          .getProgram()
          .ifPresent(symbolAccumulatorService::declareAllIntrinsicFunctions);
    }
  }

  private void updateFunctionInfo(
      FunctionDeclaration functionDeclaration, List<FunctionReference> functionReferences) {
    Optional<ProgramNode> nearestParentByType = functionDeclaration.getProgram();
    if (nearestParentByType.isPresent()) {
      ProgramNode parent = nearestParentByType.get();
      functionReferences.forEach(
          reference -> {
            SymbolAccumulatorService.FunctionInfo functionInfo =
                symbolAccumulatorService.getFunctionReference(reference.getName());
            if (functionInfo != null) functionInfo.getDeclaredProgramNode().add(parent);
          });
    }
  }

  private List<FunctionReference> getFunctionReferences(FunctionDeclaration functionDeclaration) {
    return functionDeclaration.getChildren().stream()
        .filter(FunctionReference.class::isInstance)
        .map(FunctionReference.class::cast)
        .collect(Collectors.toList());
  }
}
