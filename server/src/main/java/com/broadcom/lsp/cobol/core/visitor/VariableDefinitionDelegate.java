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
import static java.lang.String.format;
import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;

/**
 * This class processes the variable definition contexts. It accumulates the variable structures to
 * track the nesting, and the qualifiers that also rely on the structure. Pay attention, that the
 * <code>define*</code> methods are NOT pure, they share a state and rely on the context.
 */
@Slf4j
@RequiredArgsConstructor
public class VariableDefinitionDelegate {
  public static final int LEVEL_01 = 1;
  public static final int LEVEL_66 = 66;
  static final int LEVEL_77 = 77;
  static final int LEVEL_88 = 88;
  static final int AREA_A_FINISH = 10;

  private static final String EMPTY_STRUCTURE_MSG = "semantics.emptyStructure";
  private static final String TOO_MANY_CLAUSES_MSG = "semantics.tooManyClauses";
  private static final String PREVIOUS_WITHOUT_PIC_FOR_88 = "semantics.previousWithoutPicFor88";
  private static final String AREA_A_WARNING = "CobolVisitor.AreaAWarningMsg";
  private static final String NUMBER_NOT_ALLOWED_AT_TOP = "semantics.numberNotAllowedAtTop";
  private static final String NO_STRUCTURE_BEFORE_RENAME = "semantics.noStructureBeforeRename";
  private static final String CHILD_TO_RENAME_NOT_FOUND = "semantics.childToRenameNotFound";
  private static final String INCORRECT_CHILDREN_ORDER = "semantics.incorrectChildrenOrder";
  private static final String CANNOT_BE_RENAMED = "semantics.cannotBeRenamed";

  private static final ErrorSeverity SEVERITY = ERROR;

  // TODO: make Value a separate class that accepts:
  // TODO: 1. literal
  // TODO: 2. literal THRU literal
  // TODO: 3. REFERENCE data-name
  // TODO: Make PIC a separate class that may validate the given value
  private Deque<StructuredVariable> structureStack = new ArrayDeque<>();
  private Deque<Variable> variables = new ArrayDeque<>();
  private List<SyntaxError> errors = new ArrayList<>();

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
    checkStartingArea(variableDefinitionContext);
    closePreviousStructureIfNeeded(variableDefinitionContext);
    checkTopElementNumber(variableDefinitionContext);
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
            .occursClauses(ctx.dataOccursClause())
            .build();

    checkStartingArea(variableDefinitionContext);
    checkPictureClauseIsSingle(variableDefinitionContext);
    checkOccursClauseIsSingle(variableDefinitionContext);
    checkValueClauseIsSingle(variableDefinitionContext);
    checkUsageClauseIsSingle(variableDefinitionContext);
    checkTopElementNumber(variableDefinitionContext);
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
            .precedingStructure(structureStack.peekLast())
            .build();

    closePreviousStructure();
    checkTopElementNumber(variableDefinitionContext);
    variables.push(renameItemMatcher(variableDefinitionContext));
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

    checkTopElementNumber(variableDefinitionContext);
    setValueClauseText(variableDefinitionContext);
    updateConditionalContainer(variableDefinitionContext);

    defineVariable(variableDefinitionContext, this::conditionalDataNameMatcher);
  }

  /**
   * Create and accumulate a variable for mnemonic name out of the given context. Add errors if the
   * variable definition contains is invalid
   *
   * @param ctx - a {@link EnvironmentSwitchNameClauseContext} to retrieve the variable
   */
  void defineVariable(EnvironmentSwitchNameClauseContext ctx) {
    String name = retrieveName(ctx.mnemonicName());
    variables.push(
        new MnemonicName(
            name,
            retrieveDefinition(
                Optional.<ParserRuleContext>ofNullable(ctx.mnemonicName()).orElse(ctx))));
  }

  /**
   * Notify the variable delegate that the processing moved to another section in order to track the
   * structure correctness
   */
  void notifySectionChanged() {
    closePreviousStructure();
  }

  /**
   * Get the defined variables and found errors
   *
   * @return the defined variables and found errors
   */
  @NonNull
  ResultWithErrors<Collection<Variable>> finishDefinitionAnalysis() {
    closePreviousStructure();
    return new ResultWithErrors<>(new ArrayList<>(variables), new ArrayList<>(errors));
  }

  private String retrieveName(RuleContext context) {
    return ofNullable(context)
        .map(RuleContext::getText)
        .map(String::toUpperCase)
        .orElse(OutlineNodeNames.FILLER_NAME);
  }

  private Optional<Variable> retrieveChild(List<Variable> childrenToRename, String stopName) {
    return childrenToRename.stream().filter(it -> it.getName().equals(stopName)).findFirst();
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
        .map(it -> new IndexItem(it.getText().toUpperCase(), positions.get(it.start)))
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

  private void checkStartingArea(VariableDefinitionContext variable) {
    if ((variable.getNumber() == LEVEL_01 || variable.getNumber() == LEVEL_77)
        && variable.getStarting().getRange().getStart().getCharacter() > AREA_A_FINISH) {
      addError(
          messages.getMessage(AREA_A_WARNING, variable.getName()), variable.getStarting(), WARNING);
    }
  }

  private void closePreviousStructureIfNeeded(VariableDefinitionContext variable) {
    closePreviousStructureIfNeeded(variable.getNumber());
  }

  private void checkTopElementNumber(VariableDefinitionContext variable) {
    int number = variable.getNumber();
    // Level 88 is not allowed as a top element, but it may follow a 77 or 01 elementary item, so it
    // may produce a false-positive semantic error. The reason is that elementary items are not
    // stored in the structure stack, and the 88 may be falsy treated as a top element.
    if (number == LEVEL_01 || number == LEVEL_66 || number == LEVEL_77 || number == LEVEL_88)
      return;
    if (structureStack.isEmpty())
      addError(
          messages.getMessage(NUMBER_NOT_ALLOWED_AT_TOP, variable.getName()),
          variable.getDefinition());
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
        variable.getName(), variable.getDefinition(), picClause, variable.getValueClauseTest());
  }

  private Variable conditionalDataNameMatcher(VariableDefinitionContext variable) {
    ConditionDataName result =
        new ConditionDataName(
            variable.getName(),
            variable.getDefinition(),
            variable.getContainer(),
            variable.getValueClauseTest());
    Optional.ofNullable(variable.getContainer())
        .ifPresent(container -> container.addConditionName(result));
    return result;
  }

  private Variable renameItemMatcher(VariableDefinitionContext variable) {
    RenameItem renameItem = new RenameItem(variable.getName(), variable.getDefinition());
    List<Variable> renamedVariables =
        renameVariables(renameItem, extractChildrenToRename(variable));
    renamedVariables.forEach(variables::push);
    renamedVariables.forEach(renameItem::addChild);
    return renameItem;
  }

  private List<Variable> extractChildrenToRename(VariableDefinitionContext variable) {
    Locality definition = variable.getDefinition();
    if (variable.getPrecedingStructure() == null) {
      addError(messages.getMessage(NO_STRUCTURE_BEFORE_RENAME), definition);
      return List.of();
    }
    StructuredVariable structure = variable.getPrecedingStructure();
    List<Variable> previousChildren = collectChildrenToRename(structure);

    DataRenamesClauseContext renamesClause = variable.getRenamesClauseContext();
    String startName = renamesClause.dataName().getText();
    Optional<Variable> start = retrieveChild(previousChildren, startName);
    if (start.isEmpty()) {
      reportChildrenNotFound(startName, definition);
      return List.of();
    }

    Variable startVar = start.get();
    Locality startUsage = positions.get(renamesClause.dataName().getStart());
    if (renamesClause.thruDataName() == null) {
      startVar.addUsage(startUsage);
      return List.of(startVar);
    }

    String stopName = renamesClause.thruDataName().dataName().getText();
    Optional<Variable> stop = retrieveChild(previousChildren, stopName);
    if (stop.isEmpty()) {
      reportChildrenNotFound(stopName, definition);
      startVar.addUsage(startUsage);
      return List.of(startVar);
    }

    Variable stopVar = stop.get();
    Locality stopUsage = positions.get(renamesClause.thruDataName().dataName().getStart());
    int toIndex = previousChildren.indexOf(stopVar);
    int fromIndex = previousChildren.indexOf(startVar);
    if (toIndex <= fromIndex) {
      addError(messages.getMessage(INCORRECT_CHILDREN_ORDER), definition);
      startVar.addUsage(startUsage);
      stopVar.addUsage(stopUsage);
      return List.of();
    }

    startVar.addUsage(startUsage);
    stopVar.addUsage(stopUsage);
    return previousChildren.subList(fromIndex, toIndex + 1);
  }

  private List<Variable> collectChildrenToRename(StructuredVariable structure) {
    List<Variable> result = new ArrayList<>();
    for (Variable child : structure.getChildren()) {
      result.add(child);
      if (child instanceof StructuredVariable) {
        result.addAll(collectChildrenToRename((StructuredVariable) child));
      }
    }
    return result;
  }

  private List<Variable> renameVariables(RenameItem newParent, List<Variable> children) {
    return children.stream()
        .map(renameVariable(newParent))
        .filter(Objects::nonNull)
        .collect(toList());
  }

  private Function<Variable, Variable> renameVariable(RenameItem newParent) {
    return it ->
        ofNullable(it.rename(newParent))
            .orElseGet(
                () -> {
                  addError(
                      messages.getMessage(CANNOT_BE_RENAMED, it.getName()),
                      newParent.getDefinition());
                  return null;
                });
  }

  private void reportChildrenNotFound(String stopName, Locality locality) {
    addError(messages.getMessage(CHILD_TO_RENAME_NOT_FOUND, stopName), locality);
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
    List<DataPictureClauseContext> picClauses;
    List<DataOccursClauseContext> occursClauses;
    List<DataValueClauseContext> valueClauses;
    List<DataUsageClauseContext> usageClauses;
    String valueClauseTest;
    Variable container;
    DataRenamesClauseContext renamesClauseContext;
    UsageFormat usageFormat;
    StructuredVariable precedingStructure;
  }
}
