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
package org.eclipse.lsp.cobol.core.visitor;

import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.ErrorSeverity;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.VariableUsageUtils;
import org.eclipse.lsp.cobol.core.model.variables.Variable;
import lombok.RequiredArgsConstructor;
import lombok.Value;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.Token;

import java.util.*;

import static org.eclipse.lsp.cobol.core.CobolParser.*;
import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
import static java.util.stream.Collectors.toMap;

/**
 * This class processes the variable usage contexts. It accumulates usages when they appear in the
 * text. Later it checks variable definition and updates its usages.
 */
@Slf4j
@RequiredArgsConstructor
public class VariableUsageDelegate {
  private final List<VariableUsage> variableUsages = new ArrayList<>();
  private final Map<Token, Locality> positionMapping;
  private final MessageService messageService;

  /**
   * Accumulate variable appearance for analise its definition later.
   *
   * @param dataName the variable name
   * @param locality the variable text position
   * @param ctx the ANTLR variable context
   */
  public void handleDataName(String dataName, Locality locality, QualifiedDataNameFormat1Context ctx) {
    List<QualifiedInDataContext> hierarchy = ctx.qualifiedInData();
    List<String> parents = createPatentsList(hierarchy.stream().map(this::getDataName2Context).collect(toList()));
    Map<String, Token> parentVariables = collectParentVariablesFromDataAndTable(hierarchy);
    variableUsages.add(new VariableUsage(dataName, parents, locality, parentVariables));
  }

  /**
   * Accumulate variable appearance for analise its definition later.
   *
   * @param dataName the variable name
   * @param locality the variable text position
   * @param ctx the ANTLR variable context
   */
  public void handleConditionCall(String dataName, Locality locality, ConditionNameReferenceContext ctx) {
    List<DataName2Context> hierarchy = ctx.inData().stream().map(InDataContext::dataName2).collect(toList());
    List<String> parents = createPatentsList(hierarchy);
    Map<String, Token> parentVariables = collectParentVariablesFromInData(hierarchy);
    variableUsages.add(new VariableUsage(dataName, parents, locality, parentVariables));
  }

  /**
   * Accumulate variable appearance for analise its definition later.
   *
   * @param dataName the variable name
   * @param locality the variable text position
   */
  public void handleTableCall(String dataName, Locality locality) {
    variableUsages.add(new VariableUsage(dataName, Collections.emptyList(), locality, Collections.emptyMap()));
  }

  /**
   * Find correct definition for collected usages. Update variable usage or produce an error.
   *
   * @param definedVariables the collection of COBOL variables
   * @return the list of usage errors
   */
  public List<SyntaxError> updateUsageAndGenerateErrors(Collection<Variable> definedVariables) {
    Map<String, List<Variable>> convertedVariables = VariableUsageUtils.convertDefinedVariables(definedVariables);
    List<SyntaxError> errors = new ArrayList<>();
    for (VariableUsage variableUsage : variableUsages) {
      List<Variable> foundVariables =
          VariableUsageUtils.findVariables(convertedVariables, variableUsage.name, variableUsage.parents);
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

  private List<String> createPatentsList(List<DataName2Context> hierarchy) {
    return hierarchy.stream()
            .map(RuleContext::getText)
            .map(String::toUpperCase)
            .collect(toList());
  }

  private Map<String, Token> collectParentVariablesFromDataAndTable(
      List<QualifiedInDataContext> hierarchy) {
    Map<String, Token> parentVariables =
        hierarchy.stream()
            .map(QualifiedInDataContext::inData)
            .filter(Objects::nonNull)
            .map(InDataContext::dataName2)
            .collect(toMap(it -> it.getText().toUpperCase(), ParserRuleContext::getStart));

    parentVariables.putAll(
        hierarchy.stream()
            .map(QualifiedInDataContext::inTable)
            .filter(Objects::nonNull)
            .map(InTableContext::tableCall)
            .collect(toMap(it -> it.getText().toUpperCase(), ParserRuleContext::getStart)));
    return parentVariables;
  }

  private Map<String, Token> collectParentVariablesFromInData(List<DataName2Context> hierarchy) {
    return hierarchy.stream()
        .collect(toMap(it -> it.getText().toUpperCase(), ParserRuleContext::getStart));
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

  private DataName2Context getDataName2Context(QualifiedInDataContext node) {
    return ofNullable(node.inData())
        .map(InDataContext::dataName2)
        .orElseGet(
            () ->
                ofNullable(node.inTable())
                    .map(InTableContext::tableCall)
                    .map(TableCallContext::dataName2)
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

  /** This value class used for temporal storage variable usages. */
  @Value
  private static class VariableUsage {
    String name;
    List<String> parents;
    Locality locality;
    Map<String, Token> parentVariables;
  }
}
