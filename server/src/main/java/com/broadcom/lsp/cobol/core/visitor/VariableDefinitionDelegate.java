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

import com.broadcom.lsp.cobol.core.CobolParser.*;
import com.broadcom.lsp.cobol.core.messages.MessageService;
import com.broadcom.lsp.cobol.core.model.ErrorSeverity;
import com.broadcom.lsp.cobol.core.model.Locality;
import com.broadcom.lsp.cobol.core.model.ResultWithErrors;
import com.broadcom.lsp.cobol.core.model.SyntaxError;
import com.broadcom.lsp.cobol.core.model.variables.*;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.util.VariableUtils;
import com.broadcom.lsp.cobol.core.semantics.outline.OutlineNodeNames;
import lombok.Builder;
import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.Token;

import javax.annotation.Nullable;
import java.util.*;
import java.util.function.Function;

import static com.broadcom.lsp.cobol.core.model.ErrorSeverity.ERROR;
import static com.broadcom.lsp.cobol.core.model.ErrorSeverity.WARNING;
import static com.broadcom.lsp.cobol.core.visitor.DataDivisionSection.NOT_INITIALIZED;
import static java.lang.String.format;
import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;

/**
 * This class processes the variable definition contexts. It accumulates the variable structures to
 * track the nesting, and the qualifiers that also rely on the structure. Pay attention, that the
 * <code>create*</code> methods are NOT pure, they share a state and rely on the context.
 *
 * <p>Qualifiers used to check the variable usages and may be used to check the uniqueness of the
 * reference using a regex, e.g. PARENT.*CHILD may check this usage even if there are intermediate
 * levels in the given structure. Qualifiers stored in top-down order.
 */
@Slf4j
@RequiredArgsConstructor
class VariableDefinitionDelegate {
  static final int LEVEL_66 = 66;
  static final int LEVEL_77 = 77;
  static final int LEVEL_88 = 88;

  private static final String EMPTY_STRUCTURE_MSG = "semantics.emptyStructure";
  private static final String TOO_MANY_CLAUSES_MSG = "semantics.tooManyClauses";
  private static final String PREVIOUS_WITHOUT_PIC_FOR_88 = "semantics.previousWithoutPicFor88";
  private static final String AREA_A_WARNING = "CobolVisitor.AreaAWarningMsg";
  private static final String NUMBER_NOT_ALLOWED_AT_TOP = "semantics.numberNotAllowedAtTop";
  private static final String NO_STRUCTURE_BEFORE_RENAME = "semantics.noStructureBeforeRename";
  private static final String CHILD_TO_RENAME_NOT_FOUND = "semantics.childToRenameNotFound";
  private static final String INCORRECT_CHILDREN_ORDER = "semantics.incorrectChildrenOrder";
  private static final String CANNOT_BE_RENAMED = "semantics.cannotBeRenamed";
  private static final String DEFINITION_NOT_ALLOWED_IN_SECTION =
      "semantics.definitionNotAllowedInSection";

  private static final ErrorSeverity SEVERITY = ERROR;

  // TODO: make Value a separate class that accepts:
  // TODO: 1. literal
  // TODO: 2. literal THRU literal
  // TODO: 3. REFERENCE data-name
  // TODO: Make PIC a separate class that may validate the given value
  private Deque<StructuredVariable> structureStack = new ArrayDeque<>();
  private Deque<Variable> variables = new ArrayDeque<>();
  private List<SyntaxError> errors = new ArrayList<>();
  private DataDivisionSection section = NOT_INITIALIZED;

  private final Map<Token, Locality> positions;
  private final MessageService messages;

  /**
   * Create and accumulate a variable of level 01-49 out of the given context. Add errors if the
   * variable definition contains is invalid
   *
   * @param ctx - a {@link DataDescriptionEntryFormat1Context} to retrieve the variable
   */
  void defineVariable(@NonNull DataDescriptionEntryFormat1Context ctx) {
    // TODO: add support for the REDEFINES clause:
    // TODO: 1. redefined variable defined
    // TODO: 2. add variable usage for REDEFINES
    // TODO: 3. _redefining_ cannot be redefined
    // TODO: 4. redefining level number should be the same
    // TODO: 5. 66 and 88 cannot be redefined
    // TODO: 6. the redefined element should belong to the same group
    // TODO: 7. redefining element should immediately follow
    // TODO: 8. redefining one may be group when RE is element
    // TODO: 9. cannot contain VALUE

    VariableDefinitionContext variableDefinitionContext =
        VariableDefinitionContext.builder()
            .number(Integer.parseInt(ctx.LEVEL_NUMBER().getText()))
            .name(retrieveName(ctx.entryName()))
            .definition(
                retrieveDefinition(
                    Optional.<ParserRuleContext>ofNullable(ctx.entryName()).orElse(ctx)))
            .antlrClass(ctx.getClass())
            .starting(positions.get(ctx.LEVEL_NUMBER().getSymbol()))
            .picClauses(ctx.dataPictureClause())
            .occursClauses(ctx.dataOccursClause())
            .valueClauses(ctx.dataValueClause())
            .usageClauses(ctx.dataUsageClause())
            .build();

    // TODO: Add check that name does not present in the predefined variables list (? - to check)
    setFillerNameIfNeeded(variableDefinitionContext);
    checkVariableTypeAllowed(variableDefinitionContext);
    checkStartingArea(variableDefinitionContext);
    closePreviousStructureIfNeeded(variableDefinitionContext);
    checkTopElementNumber(variableDefinitionContext);
    updateQualifier(variableDefinitionContext);
    checkPictureClauseIsSingle(variableDefinitionContext);
    checkOccursClauseIsSingle(variableDefinitionContext);
    checkValueClauseIsSingle(variableDefinitionContext);
    checkUsageClauseIsSingle(variableDefinitionContext);
    setValueClauseText(variableDefinitionContext);
    // TODO: check the same way that the other clauses are singular or absent

    defineVariable(
        variableDefinitionContext,
        this::multiTableDataNameMatcher,
        this::groupItemMatcher,
        // TODO: add check that the following items do not have VALUE:
        // TODO: 1. JUSTIFIED
        // TODO: 2. SYNCHRONIZED
        // TODO: 3. USAGE (not USAGE IN DISPLAY)
        this::tableDataNameMatcher,
        this::elementItemMatcher);
  }

  /**
   * Create and accumulate a variable of level 77 out of the given context. Add errors if the
   * variable definition contains is invalid
   *
   * @param ctx - a {@link DataDescriptionEntryFormat1Level77Context} to retrieve the variable
   */
  void defineVariable(@NonNull DataDescriptionEntryFormat1Level77Context ctx) {
    VariableDefinitionContext variableDefinitionContext =
        VariableDefinitionContext.builder()
            .number(LEVEL_77)
            .name(retrieveName(ctx.entryName()))
            .definition(
                retrieveDefinition(
                    Optional.<ParserRuleContext>ofNullable(ctx.entryName()).orElse(ctx)))
            .antlrClass(ctx.getClass())
            .starting(positions.get(ctx.LEVEL_NUMBER_77().getSymbol()))
            .picClauses(ctx.dataPictureClause())
            .valueClauses(ctx.dataValueClause())
            .usageClauses(ctx.dataUsageClause())
            .build();

    setFillerNameIfNeeded(variableDefinitionContext);
    checkVariableTypeAllowed(variableDefinitionContext);
    checkStartingArea(variableDefinitionContext);
    checkUsageClauseIsSingle(variableDefinitionContext);
    checkTopElementNumber(variableDefinitionContext);
    updateQualifier(variableDefinitionContext);
    closePreviousStructure();

    defineVariable(variableDefinitionContext, this::independentDataItemMatcher);
  }

  /**
   * Create and accumulate a variable of level 66 out of the given context. Add errors if the
   * variable definition contains is invalid
   *
   * @param ctx - a {@link DataDescriptionEntryFormat2Context} to retrieve the variable
   */
  void defineVariable(@NonNull DataDescriptionEntryFormat2Context ctx) {
    VariableDefinitionContext variableDefinitionContext =
        VariableDefinitionContext.builder()
            .number(LEVEL_66)
            .name(retrieveName(ctx.entryName()))
            .definition(
                retrieveDefinition(
                    Optional.<ParserRuleContext>ofNullable(ctx.entryName()).orElse(ctx)))
            .antlrClass(ctx.getClass())
            .starting(positions.get(ctx.LEVEL_NUMBER_66().getSymbol()))
            .renamesClauseContext(ctx.dataRenamesClause())
            .build();

    setFillerNameIfNeeded(variableDefinitionContext);
    checkVariableTypeAllowed(variableDefinitionContext);
    checkTopElementNumber(variableDefinitionContext);
    updateQualifier(variableDefinitionContext);

    defineVariable(variableDefinitionContext, this::renameItemMatcher);
  }

  /**
   * Create and accumulate a variable of level 88 out of the given context. Add errors if the
   * variable definition contains is invalid
   *
   * @param ctx - a {@link DataDescriptionEntryFormat3Context} to retrieve the variable
   */
  void defineVariable(@NonNull DataDescriptionEntryFormat3Context ctx) {
    VariableDefinitionContext variableDefinitionContext =
        VariableDefinitionContext.builder()
            .number(LEVEL_88)
            .name(retrieveName(ctx.entryName()))
            .definition(
                retrieveDefinition(
                    Optional.<ParserRuleContext>ofNullable(ctx.entryName()).orElse(ctx)))
            .antlrClass(ctx.getClass())
            .starting(positions.get(ctx.LEVEL_NUMBER_88().getSymbol()))
            .valueClauses(List.of(ctx.dataValueClause()))
            .build();

    setFillerNameIfNeeded(variableDefinitionContext);
    checkVariableTypeAllowed(variableDefinitionContext);
    checkTopElementNumber(variableDefinitionContext);
    setValueClauseText(variableDefinitionContext);
    updateConditionalContainer(variableDefinitionContext);
    updateQualifier(variableDefinitionContext);

    defineVariable(variableDefinitionContext, this::conditionalDataNameMatcher);
  }

  /**
   * Change the currently processing section. Checks if the preceding variable structure is correct
   *
   * @param section - the currently processing section
   */
  void switchSection(@NonNull DataDivisionSection section) {
    this.section = section;
    closePreviousStructure();
  }

  /**
   * Get the defined variables and found errors
   *
   * @return the defined variables and found errors
   */
  @NonNull
  ResultWithErrors<Collection<Variable>> finishDefinitionAnalysis() {
    switchSection(NOT_INITIALIZED);
    return new ResultWithErrors<>(variables, errors);
  }

  /**
   * Check if the variable definition result has already been collected.
   *
   * @return true if the client code has already collected the result.
   */
  boolean isResultCollected() {
    return section == NOT_INITIALIZED;
  }

  private String retrieveName(EntryNameContext context) {
    return ofNullable(context).map(RuleContext::getText).map(String::toUpperCase).orElse(null);
  }

  private String retrieveQualifier(String name) {
    return VariableUtils.createQualifier(structureStack, name);
  }

  private Optional<Variable> retrieveChild(List<Variable> childrenToRename, String stopName) {
    return childrenToRename.stream().filter(it -> it.getName().equals(stopName)).findFirst();
  }

  private List<Variable> renameVariables(RenameItem newParent, List<Variable> children) {
    return children.stream()
        .map(renameVariable(newParent))
        .filter(Objects::nonNull)
        .collect(toList());
  }

  private void reportChildrenNotFound(DataRenamesClauseContext renamesClause, String stopName) {
    addError(
        messages.getMessage(CHILD_TO_RENAME_NOT_FOUND, stopName),
        positions.get(renamesClause.dataName().getStart()));
  }

  private Function<Variable, Variable> renameVariable(RenameItem newParent) {
    return it ->
        ofNullable(it.rename(newParent))
            .orElseGet(
                () -> {
                  addError(
                      messages.getMessage(CANNOT_BE_RENAMED, it.getName()), it.getDefinition());
                  return null;
                });
  }

  @Nullable
  private Variable getConditionalContainer() {
    return ofNullable(variables.peek())
        .filter(Conditional::isConditional)
        .orElseGet(
            () ->
                ofNullable(variables.peek())
                    .filter(it -> it instanceof ConditionDataName)
                    .map(Variable::getParent)
                    .orElse(null));
  }

  @NonNull
  private Locality retrieveDefinition(ParserRuleContext context) {
    return ofNullable(context).map(ParserRuleContext::getStart).map(positions::get).orElse(null);
  }

  @NonNull
  private String retrievePicText(List<DataPictureClauseContext> clauses) {
    if (clauses.isEmpty()) return "";
    DataPictureClauseContext clause = clauses.get(0);
    return clause.getText().replaceAll(clause.getStart().getText(), "").trim();
  }

  private int retrieveOccursTimes(@NonNull DataOccursClauseContext dataOccursClauseContexts) {
    return Integer.parseInt(dataOccursClauseContexts.integerLiteral().getText());
  }

  @NonNull
  private List<IndexItem> retrieveIndexItem(@NonNull DataOccursClauseContext clause) {
    return clause.indexName().stream()
        .map(
            it ->
                new IndexItem(
                    it.getText().toUpperCase(),
                    VariableUtils.createQualifier(it.getText().toUpperCase()),
                    positions.get(it.start)))
        .collect(toList());
  }

  private UsageFormat retrieveUsageFormat(List<DataUsageClauseContext> clauses) {
    if (clauses.isEmpty()) return UsageFormat.UNDEFINED;
    return UsageFormat.of(clauses.get(0).usageFormat().getStart().getText());
  }

  private void closePreviousStructure() {
    closePreviousStructureIfNeeded(0);
  }

  private void closePreviousStructureIfNeeded(int number) {
    ofNullable(structureStack.peek())
        .filter(it -> it.getChildren().isEmpty())
        .filter(it -> it.getLevelNumber() >= number)
        .ifPresent(
            it ->
                addError(
                    messages.getMessage(EMPTY_STRUCTURE_MSG, it.getName()), it.getDefinition()));
    structureStack.removeIf(it -> it.getLevelNumber() >= number);
  }

  private void addError(String suggestion, Locality locality) {
    addError(suggestion, locality, SEVERITY);
  }

  private void addError(String suggestion, Locality locality, ErrorSeverity severity) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .locality(locality)
            .severity(severity)
            .suggestion(suggestion)
            .build();
    errors.add(error);
    LOG.debug(
        format("Syntax error defined by %s: %s", getClass().getSimpleName(), error.toString()));
  }

  private void setFillerNameIfNeeded(VariableDefinitionContext variable) {
    if (variable.getName() == null) {
      variable.setName(OutlineNodeNames.FILLER_NAME);
    }
  }

  private void checkVariableTypeAllowed(VariableDefinitionContext variable) {
    if (!section.allowsVariableType(variable.getAntlrClass())) {
      addError(messages.getMessage(DEFINITION_NOT_ALLOWED_IN_SECTION), variable.getDefinition());
    }
  }

  private void checkStartingArea(VariableDefinitionContext variable) {
    if ((variable.getNumber() == 1 || variable.getNumber() == LEVEL_77)
        && variable.getStarting().getRange().getStart().getCharacter() > 10) {
      addError(
          messages.getMessage(AREA_A_WARNING, variable.getName()), variable.getStarting(), WARNING);
    }
  }

  private void closePreviousStructureIfNeeded(VariableDefinitionContext variable) {
    closePreviousStructureIfNeeded(variable.getNumber());
  }

  private void checkTopElementNumber(VariableDefinitionContext variable) {
    int number = variable.getNumber();
    if (number == 1 || number == LEVEL_66 || number == LEVEL_77 || number == LEVEL_88) return;
    if (structureStack.isEmpty())
      addError(
          messages.getMessage(NUMBER_NOT_ALLOWED_AT_TOP, variable.getName()),
          variable.getDefinition());
  }

  private void updateQualifier(VariableDefinitionContext variable) {
    if (variable.getContainer() == null) {
      variable.setQualifier(retrieveQualifier(variable.getName()));
    } else {
      variable.setQualifier(variable.getContainer().getQualifier() + " " + variable.getName());
    }
  }

  private void checkPictureClauseIsSingle(VariableDefinitionContext variable) {
    checkClauseIsSingle(variable.getDefinition(), variable.getPicClauses(), "PICTURE");
  }

  private void checkOccursClauseIsSingle(VariableDefinitionContext variable) {
    checkClauseIsSingle(variable.getDefinition(), variable.getOccursClauses(), "OCCURS");
  }

  private void checkValueClauseIsSingle(VariableDefinitionContext variable) {
    checkClauseIsSingle(variable.getDefinition(), variable.getValueClauses(), "VALUE");
  }

  private void checkUsageClauseIsSingle(VariableDefinitionContext variable) {
    checkClauseIsSingle(variable.getDefinition(), variable.getUsageClauses(), "USAGE");
  }

  private void checkClauseIsSingle(
      Locality locality, List<? extends ParserRuleContext> clauses, String clause) {
    if (clauses.size() > 1) {
      addError(messages.getMessage(TOO_MANY_CLAUSES_MSG, clause), locality);
    }
  }

  private void setValueClauseText(VariableDefinitionContext variable) {
    String valueClauseText = "";
    if (!variable.getValueClauses().isEmpty()) {
      valueClauseText = variable.getValueClauses().get(0).dataValueClauseLiteral().getText();
    }
    variable.setValueClauseTest(valueClauseText);
  }

  private void updateConditionalContainer(VariableDefinitionContext variable) {
    Variable container = getConditionalContainer();
    variable.setContainer(container);
    if (container == null) {
      addError(
          messages.getMessage(PREVIOUS_WITHOUT_PIC_FOR_88, variable.getName()),
          variable.getDefinition());
    }
  }

  private void defineVariable(
      VariableDefinitionContext variableDefinitionContext,
      Function<VariableDefinitionContext, Variable>... matchers) {
    Arrays.stream(matchers)
        .map(matcher -> matcher.apply(variableDefinitionContext))
        .filter(Objects::nonNull)
        .findFirst()
        .ifPresent(
            variable -> {
              // TODO: add check that value does not exceed PIC length
              ofNullable(structureStack.peek()).ifPresent(it -> it.addChild(variable));
              if (variable instanceof StructuredVariable) {
                structureStack.push((StructuredVariable) variable);
              }
              variables.push(variable);
            });
  }

  private Variable multiTableDataNameMatcher(VariableDefinitionContext variable) {
    if (variable.getPicClauses().isEmpty()
        && !variable.getOccursClauses().isEmpty()
        && variable.getUsageClauses().isEmpty()) {
      MultiTableDataName result =
          new MultiTableDataName(
              variable.getNumber(),
              variable.getName(),
              variable.getQualifier(),
              variable.getDefinition(),
              structureStack.peek(),
              retrieveOccursTimes(variable.getOccursClauses().get(0)),
              retrieveIndexItem(variable.getOccursClauses().get(0)),
              retrieveUsageFormat(variable.getUsageClauses()));
      result.getIndexes().forEach(variables::push);
      return result;
    }
    return null;
  }

  private Variable groupItemMatcher(VariableDefinitionContext variable) {
    if (variable.getPicClauses().isEmpty()
        && variable.getOccursClauses().isEmpty()
        && variable.getUsageClauses().isEmpty()) {
      return new GroupItem(
          variable.getNumber(),
          variable.getName(),
          variable.getQualifier(),
          variable.getDefinition(),
          structureStack.peek());
    }
    return null;
  }

  private Variable tableDataNameMatcher(VariableDefinitionContext variable) {
    if ((!variable.getPicClauses().isEmpty() || !variable.getUsageClauses().isEmpty())
        && !variable.getOccursClauses().isEmpty()) {
      TableDataName tableDataName =
          new TableDataName(
              variable.getName(),
              variable.getQualifier(),
              variable.getDefinition(),
              structureStack.peek(),
              retrievePicText(variable.getPicClauses()),
              variable.getValueClauseTest(),
              retrieveOccursTimes(variable.getOccursClauses().get(0)),
              retrieveIndexItem(variable.getOccursClauses().get(0)),
              retrieveUsageFormat(variable.getUsageClauses()));
      tableDataName.getIndexes().forEach(variables::push);
      return tableDataName;
    }
    return null;
  }

  private Variable elementItemMatcher(VariableDefinitionContext variable) {
    if ((!variable.getPicClauses().isEmpty() || !variable.getUsageClauses().isEmpty())
        && variable.getOccursClauses().isEmpty()) {
      return new ElementItem(
          variable.getName(),
          variable.getQualifier(),
          variable.getDefinition(),
          structureStack.peek(),
          retrievePicText(variable.getPicClauses()),
          variable.getValueClauseTest(),
          retrieveUsageFormat(variable.getUsageClauses()));
    }
    return null;
  }

  private Variable independentDataItemMatcher(VariableDefinitionContext variable) {
    String picClause = "";
    if (variable.getPicClauses().isEmpty()) {
      addError(
          messages.getMessage(EMPTY_STRUCTURE_MSG, variable.getName()), variable.getDefinition());
    } else {
      picClause = retrievePicText(variable.getPicClauses());
    }
    return new IndependentDataItem(
        variable.getName(),
        variable.getQualifier(),
        variable.getDefinition(),
        picClause,
        variable.getValueClauseTest());
  }

  private Variable conditionalDataNameMatcher(VariableDefinitionContext variable) {
    ConditionDataName result =
        new ConditionDataName(
            variable.getName(),
            variable.getQualifier(),
            variable.getDefinition(),
            variable.getContainer(),
            variable.getValueClauseTest());
    Optional.ofNullable(variable.getContainer())
        .ifPresent(container -> container.addConditionName(result));
    return result;
  }

  private Variable renameItemMatcher(VariableDefinitionContext variable) {
    RenameItem renameItem =
        new RenameItem(variable.getName(), variable.getQualifier(), variable.getDefinition());
    List<Variable> renamedVariables =
        renameVariables(renameItem, extractChildrenToRename(variable));
    renamedVariables.forEach(variables::push);
    renamedVariables.forEach(renameItem::addChild);
    return renameItem;
  }

  private List<Variable> extractChildrenToRename(VariableDefinitionContext variable) {
    StructuredVariable structure = structureStack.getFirst();
    Variable previousVariable = variables.peek();
    if (structure == null || previousVariable == null) {
      addError(messages.getMessage(NO_STRUCTURE_BEFORE_RENAME), variable.getDefinition());
      return List.of();
    }
    List<Variable> previousChildren = structure.getChildren();
    DataRenamesClauseContext renamesClause = variable.getRenamesClauseContext();
    String startName = renamesClause.dataName().getText();
    Optional<Variable> start = retrieveChild(previousChildren, startName);
    if (start.isEmpty()) {
      reportChildrenNotFound(renamesClause, startName);
      return List.of();
    }
    if (renamesClause.thruDataName() == null) {
      start.get().addUsage(positions.get(renamesClause.dataName().getStart()));
      return List.of(start.get());
    }
    String stopName = renamesClause.thruDataName().dataName().getText();
    Optional<Variable> stop = retrieveChild(previousChildren, stopName);
    if (stop.isEmpty()) {
      reportChildrenNotFound(renamesClause, stopName);
      start.get().addUsage(positions.get(renamesClause.dataName().getStart()));
      return List.of(start.get());
    }
    int fromIndex = previousChildren.indexOf(start.get());
    int toIndex = previousChildren.indexOf(stop.get());
    if (toIndex <= fromIndex) {
      addError(INCORRECT_CHILDREN_ORDER, variable.getDefinition());
      start.get().addUsage(positions.get(renamesClause.dataName().getStart()));
      return List.of(start.get());
    }

    start.get().addUsage(positions.get(renamesClause.dataName().getStart()));
    stop.get().addUsage(positions.get(renamesClause.thruDataName().dataName().getStart()));
    return previousChildren.subList(fromIndex, toIndex);
  }

  /** This data class used for temporal storage ANTLR parsed variables. */
  @Data
  @Builder
  private static class VariableDefinitionContext {
    int number;
    String name;
    Locality definition;
    Class<? extends ParserRuleContext> antlrClass;
    Locality starting;
    String qualifier;
    List<DataPictureClauseContext> picClauses;
    List<DataOccursClauseContext> occursClauses;
    List<DataValueClauseContext> valueClauses;
    List<DataUsageClauseContext> usageClauses;
    String valueClauseTest;
    Variable container;
    DataRenamesClauseContext renamesClauseContext;
    UsageFormat usageFormat;
  }
}
