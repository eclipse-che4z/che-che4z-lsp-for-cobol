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
package org.eclipse.lsp.cobol.core.engine.dialects.v2;

import com.google.common.collect.ImmutableList;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.mapping.Token;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.CodeBlockUsageNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variable.QualifiedReferenceNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableDefinitionNameNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableUsageNode;
import org.eclipse.lsp.cobol.common.model.tree.variables.DialectVariableNode;
import org.eclipse.lsp.cobol.lsp.jrpc.ReplacementToken;
import org.eclipse.lsp.cobol.lsp.jrpc.ReplacementTokens;
import org.eclipse.lsp4j.Range;

/** Utility class that creates nodes based on token group type */
@UtilityClass
class NodeHelper {
  private static final String VARIABLE = "VARIABLE";
  private static final String PROCEDURE = "PROCEDURE";
  private static final String DIALECT_VARIABLE_DEFINITION = "DIALECT_VARIABLE_DEFINITION";

  public Optional<List<Node>> createNodesIfNeeded(
      ReplacementTokens tokenItem,
      List<Token> mappedTokenList,
      String documentUri,
      String copybookId,
      Map<Locality, DialectVariableNode> definitions) {
    if (mappedTokenList.isEmpty()) {
      return Optional.empty();
    }

    String type = tokenItem.getType();
    if (DIALECT_VARIABLE_DEFINITION.equals(type)) {
      return createVariableDefinitionNodes(
          tokenItem.getTokens(), mappedTokenList, documentUri, copybookId, definitions);
    }
    if (VARIABLE.equals(type)) {
      return Optional.of(createVariableNode(mappedTokenList, documentUri, copybookId));
    }
    if (PROCEDURE.equals(type)) {
      if (mappedTokenList.size() > 2) {
        return Optional.empty();
      }
      return Optional.of(createProcedureNode(mappedTokenList, documentUri, copybookId));
    }
    return Optional.empty();
  }

  private Optional<List<Node>> createVariableDefinitionNodes(
      ReplacementToken[] sourceTokens,
      List<Token> mappedTokens,
      String documentUri,
      String copybookId,
      Map<Locality, DialectVariableNode> definitions) {
    DialectVariableNode child = null;
    for (int index = 0; index < mappedTokens.size(); index++) {
      Token mappedToken = mappedTokens.get(index);
      ReplacementToken sourceToken = sourceTokens[index];

      Locality locality =
          Locality.builder()
              .uri(documentUri)
              .copybookId(copybookId)
              .range(mappedToken.getOriginalLocation().getRange())
              .build();
      DialectVariableNode definition = definitions.get(locality);
      if (definition == null) {
        String displayText =
            sourceToken.getDisplayText() == null
                ? mappedToken.getValue()
                : sourceToken.getDisplayText();
        definition =
            new DialectVariableNode(
                locality, mappedToken.getValue(), displayText, sourceToken.getLevel());
        definition.addChild(new VariableDefinitionNameNode(locality, mappedToken.getValue()));
        definitions.put(locality, definition);
      }

      if (child != null && child.getParent() != definition) {
        definition.addChild(child);
      }
      child = definition;
    }

    return Optional.of(ImmutableList.of(child));
  }

  private List<Node> createVariableNode(
      List<Token> mappedTokenList, String documentUri, String copybookId) {
    Node parentNode =
        new QualifiedReferenceNode(
            Locality.builder()
                .uri(documentUri)
                .copybookId(copybookId)
                .range(calculateRange(mappedTokenList))
                .build());

    for (Token token : mappedTokenList) {
      parentNode.addChild(
          new VariableUsageNode(
              token.getValue(),
              Locality.builder()
                  .uri(documentUri)
                  .copybookId(copybookId)
                  .range(token.getOriginalLocation().getRange())
                  .build()));
    }
    return ImmutableList.of(parentNode);
  }

  private List<Node> createProcedureNode(
      List<Token> mappedTokenList, String documentUri, String copybookId) {
    String procedureName = mappedTokenList.get(0).getValue();
    String ofSection = null;
    List<Node> result = new ArrayList<>();

    if (mappedTokenList.size() > 1) {
      ofSection = mappedTokenList.get(mappedTokenList.size() - 1).getValue();
    }

    result.add(
        new CodeBlockUsageNode(
            Locality.builder()
                .uri(documentUri)
                .copybookId(copybookId)
                .range(mappedTokenList.get(0).getOriginalLocation().getRange())
                .build(),
            procedureName,
            ofSection));
    return result;
  }

  private Range calculateRange(List<Token> tokens) {
    if (tokens.isEmpty()) {
      return null;
    }
    return new Range(
        tokens.get(0).getOriginalLocation().getRange().getStart(),
        tokens.get(tokens.size() - 1).getOriginalLocation().getRange().getEnd());
  }
}
