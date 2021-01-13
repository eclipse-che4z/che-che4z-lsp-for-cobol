/*
 * Copyright (c) 2020 Broadcom.
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
package com.broadcom.lsp.cobol.core.visitor;

import com.broadcom.lsp.cobol.core.CobolParser;
import com.broadcom.lsp.cobol.core.messages.MessageService;
import com.broadcom.lsp.cobol.core.model.ErrorSeverity;
import com.broadcom.lsp.cobol.core.model.Locality;
import com.broadcom.lsp.cobol.core.model.SyntaxError;
import com.broadcom.lsp.cobol.core.model.variables.Variable;
import lombok.RequiredArgsConstructor;
import lombok.Value;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.Token;

import java.util.*;

import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
import static java.util.stream.Collectors.toMap;

/**
 * This class process the variable usage contexts. It accumulate usages when they appear in the text. Later it checks
 * variable definition and updates its usages.
 */
@Slf4j
@RequiredArgsConstructor
class VariableUsageDelegate {
  private List<VariableUsage> variableUsages = new ArrayList<>();
  private final Map<Token, Locality> positionMapping;
  private final MessageService messageService;

  /**
   * Accumulate variable appearance for analise its definition later.
   *
   * @param dataName the variable name
   * @param locality the variable text position
   * @param ctx the ANTLR variable context
   */
  void handleDataName(String dataName, Locality locality, CobolParser.QualifiedDataNameFormat1Context ctx) {
    List<CobolParser.QualifiedInDataContext> hierarchy = ctx.qualifiedInData();
    String qualifier = createQualifier(dataName, hierarchy);
    Map<String, Token> parentVariables = collectParentVariables(hierarchy);
    variableUsages.add(new VariableUsage(dataName, qualifier, locality, parentVariables));
  }

  /**
   * Accumulate variable appearance for analise its definition later.
   *
   * @param dataName the variable name
   * @param locality the variable text position
   */
  void handleTableCall(String dataName, Locality locality) {
    variableUsages.add(new VariableUsage(dataName, ".* " + dataName, locality, Map.of()));
  }

  /**
   * Find correct definition for collected usages. Update variable usage or produce an error.
   *
   * @param definedVariables the collection of COBOL variables
   * @return the list of usage errors
   */
  List<SyntaxError> updateUsageAndGenerateErrors(Collection<Variable> definedVariables) {
    List<SyntaxError> errors = new ArrayList<>();
    for (VariableUsage variableUsage: variableUsages) {
      List<Variable> foundVariables = findVariable(definedVariables, variableUsage.searchQualifier);
      if (foundVariables.size() == 1) {
        Variable variable = foundVariables.get(0);
        variable.addUsage(variableUsage.locality);
        addParentVariablesUsage(variableUsage.parentVariables, variable);
      } else {
        errors.add(createInvalidDefinition(variableUsage.name, variableUsage.locality));
      }
    }
    return errors;
  }

  private List<Variable> findVariable(Collection<Variable> definedVariables, String qualifier) {
    return definedVariables.stream()
        .filter(it -> it.getQualifier().matches(qualifier))
        .collect(toList());
  }

  private String createQualifier(String dataName, List<CobolParser.QualifiedInDataContext> hierarchy) {
    String hierarchicalQualifier =
        hierarchy.stream()
            .map(this::getDataName2Context)
            .map(RuleContext::getText)
            .map(String::toUpperCase)
            .reduce((s1, s2) -> s2 + " .* " + s1)
            .orElse("");

    return hierarchicalQualifier.isEmpty()
        ? ".* " + dataName
        : ".* " + hierarchicalQualifier + " .* " + dataName;
  }

  private Map<String, Token> collectParentVariables(List<CobolParser.QualifiedInDataContext> hierarchy) {
    Map<String, Token> parentVariables =
        hierarchy.stream()
            .map(CobolParser.QualifiedInDataContext::inData)
            .filter(Objects::nonNull)
            .map(CobolParser.InDataContext::dataName2)
            .collect(toMap(it -> it.getText().toUpperCase(), ParserRuleContext::getStart));

    parentVariables.putAll(
        hierarchy.stream()
            .map(CobolParser.QualifiedInDataContext::inTable)
            .filter(Objects::nonNull)
            .map(CobolParser.InTableContext::tableCall)
            .collect(toMap(it -> it.getText().toUpperCase(), ParserRuleContext::getStart)));
    return parentVariables;
  }

  private void addParentVariablesUsage(Map<String, Token> parentVariables, Variable variable) {
    Variable parent = variable.getParent();
    while (parent != null) {
      ofNullable(parentVariables.get(parent.getName()))
          .map(positionMapping::get)
          .ifPresent(parent::addUsage);
      parent = parent.getParent();
    }
  }

  private CobolParser.DataName2Context getDataName2Context(CobolParser.QualifiedInDataContext node) {
    return ofNullable(node.inData())
        .map(CobolParser.InDataContext::dataName2)
        .orElseGet(
            () ->
                ofNullable(node.inTable())
                    .map(CobolParser.InTableContext::tableCall)
                    .map(CobolParser.TableCallContext::dataName2)
                    .orElse(null));
  }

  private SyntaxError createInvalidDefinition(String dataName, Locality locality) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .suggestion(messageService.getMessage("CobolVisitor.invalidDefMsg", dataName))
            .severity(ErrorSeverity.ERROR)
            .locality(locality)
            .build();
    LOG.debug("Syntax error by CobolVisitor#reportInvalidDefinition: " + error.toString());
    return error;
  }

  /**
   * This value class used for temporal storage variable usages.
   */
  @Value
  private static class VariableUsage {
    String name;
    String searchQualifier;
    Locality locality;
    Map<String, Token> parentVariables;
  }
}
