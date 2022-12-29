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
package org.eclipse.lsp.cobol.dialects.daco.processors.implicit;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.Streams;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import lombok.RequiredArgsConstructor;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.ProcedureSectionNode;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.dialects.daco.DaCoDialect.DACO_PREDEFINED_SECTIONS;

/**
 * Adds necessary variables that corresponds to the DaCo implicit code
 */
@RequiredArgsConstructor
public class DaCoImplicitCodeProcessor implements Processor<ProgramNode> {

  @Override
  public void accept(ProgramNode programNode, ProcessingContext processingContext) {
    List<VariableNode> variables = new LinkedList<>(WorkingSectionStaticGenerator.generate());
    variables.addAll(LinkageSectionStaticGenerator.generate());
    variables.addAll(WorkingSectionDynamicGenerator.generate(programNode));

    List<VariableNode> children = variables.stream().flatMap(Node::getDepthFirstStream)
        .filter(n -> n instanceof VariableNode)
        .map(VariableNode.class::cast)
        .collect(toList());
    variables.addAll(children);

    variables.forEach(node -> processingContext.getVariableAccumulator().addVariableDefinition(programNode, node));

    SectionsGenerator.generate(getPredefinedSections(processingContext), getExistingSections(programNode))
        .forEach(node -> processingContext.getVariableAccumulator().registerCodeBlock(programNode, node));
  }

  private List<String> getPredefinedSections(ProcessingContext processingContext) {
    Map<String, JsonElement> config = processingContext.getDialectsConfig();
    JsonElement labels = config.get(DACO_PREDEFINED_SECTIONS);

    if (labels != null && labels.isJsonArray()) {
      return Streams.stream((JsonArray) labels).map(JsonElement::getAsString).collect(toList());
    }
    return ImmutableList.of();
  }

  private Set<String> getExistingSections(ProgramNode programNode) {
    return programNode.getDepthFirstStream()
        .filter(n -> n instanceof ProcedureSectionNode)
        .map(ProcedureSectionNode.class::cast)
        .map(ProcedureSectionNode::getName)
        .collect(Collectors.toSet());
  }
}
