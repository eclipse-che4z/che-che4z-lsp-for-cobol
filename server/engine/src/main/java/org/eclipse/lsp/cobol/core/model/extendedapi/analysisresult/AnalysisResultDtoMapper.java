/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.core.model.extendedapi.analysisresult;

import static java.util.stream.Collectors.toList;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolsRepository;

/** Maps {@link AnalysisResult} to {@link AnalysisResultDto} */
@UtilityClass
public class AnalysisResultDtoMapper {

  /**
   * Map an analysis result to its serialization-safe projection
   *
   * @param result the analysis result
   * @return the dto
   */
  public AnalysisResultDto map(AnalysisResult result) {
    SymbolsRepository repo = new SymbolsRepository();
    Optional.ofNullable(result.getSymbolTableMap()).ifPresent(repo::updateSymbols);
    List<ProgramDto> programs =
        Optional.ofNullable(result.getRootNode())
            .map(
                root ->
                    root.getDepthFirstStream()
                        .filter(node -> node.getNodeType() == NodeType.PROGRAM)
                        .map(ProgramNode.class::cast)
                        .map(program -> mapProgram(program, repo))
                        .collect(toList()))
            .orElse(Collections.emptyList());
    return new AnalysisResultDto(
        Optional.ofNullable(result.getDiagnostics()).orElse(Collections.emptyMap()), programs);
  }

  private ProgramDto mapProgram(ProgramNode program, SymbolsRepository repo) {
    List<VariableDto> variables =
        repo.getVariables(program).values().stream()
            .flatMap(Node::getDepthFirstStream)
            .filter(VariableNode.class::isInstance)
            .map(VariableNode.class::cast)
            .distinct()
            .map(
                node ->
                    new VariableDto(
                        node.getName(),
                        node.getLocality().toLocation(),
                        node.getUsages().collect(toList())))
            .collect(toList());
    List<ProcedureDto> procedures =
        repo.getProceduresMap(program).entrySet().stream()
            .map(
                entry ->
                    new ProcedureDto(
                        entry.getKey().isParagraph()
                            ? entry.getKey().getParagraphName()
                            : entry.getKey().getSectionName(),
                        entry.getValue().getDefinitions(),
                        entry.getValue().getUsage()))
            .collect(toList());
    List<CopyDto> copybooks =
        program
            .getDepthFirstStream()
            .filter(node -> node.getNodeType() == NodeType.COPY)
            .map(CopyNode.class::cast)
            .map(
                node ->
                    new CopyDto(node.getName(), node.getUri(), node.getLocality().getRange()))
            .collect(toList());
    return new ProgramDto(program.getProgramName(), variables, procedures, copybooks);
  }
}
