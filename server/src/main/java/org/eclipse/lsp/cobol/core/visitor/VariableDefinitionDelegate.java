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

import lombok.*;
import org.eclipse.lsp.cobol.core.CobolParser.*;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.ErrorSeverity;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.variables.*;
import org.eclipse.lsp.cobol.core.semantics.outline.OutlineNodeNames;
import com.google.common.collect.ImmutableList;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.Token;

import javax.annotation.Nullable;
import java.util.*;
import java.util.function.Function;

import static org.eclipse.lsp.cobol.core.model.ErrorSeverity.ERROR;
import static org.eclipse.lsp.cobol.core.model.ErrorSeverity.WARNING;
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
  public static final int LEVEL_77 = 77;
  public static final int LEVEL_88 = 88;
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
  private static final String GLOBAL_NON_01_LEVEL_MSG = "semantics.globalNon01Level";
  private static final String GLOBAL_TOO_MANY_DEFINITIONS = "semantics.globalTooManyDefinitions";

  private static final ErrorSeverity SEVERITY = ERROR;

  // TODO: make Value a separate class that accepts:
  // TODO: 1. literal
  // TODO: 2. literal THRU literal
  // TODO: 3. REFERENCE data-name
  // TODO: Make PIC a separate class that may validate the given value
  private Deque<StructuredVariable> structureStack = new ArrayDeque<>();
  private Deque<Variable> variables = new ArrayDeque<>();
  private List<SyntaxError> errors = new ArrayList<>();
  private Map<String, List<VariableDefinitionContext>> globalVariables = new HashMap<>();

  private final Map<Token, Locality> positions;
  private final MessageService messages;

  private final Map<String, String> redefinedVariables = new HashMap<>();

  /**
   * Create and accumulate a variable of level 01-49 out of the given context. Add errors if the
   * variable definition contains is invalid
   *
   * @param ctx - a {@link DataDescriptionEntryFormat1Context} to retrieve the variable
   */
  public void defineVariable(@NonNull DataDescriptionEntryFormat1Context ctx) {
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
            .global(!ctx.dataGlobalClause().isEmpty())
            .antlrClass(ctx.getClass())
            .starting(positions.get(ctx.LEVEL_NUMBER().getSymbol()))
            .picClauses(ctx.dataPictureClause())
            .occursClauses(ctx.dataOccursClause())
            .valueClauses(ctx.dataValueClause())
            .usageClauses(ctx.dataUsageClause())
            .redefinesClauses(ctx.dataRedefinesClause())
            .build();

    // TODO: Add check that name does not present in the predefined variables list (? - to check)
    checkStartingArea(variableDefinitionContext);
    closePreviousStructureIfNeeded(variableDefinitionContext);
    checkTopElementNumber(variableDefinitionContext);
    checkPictureClauseIsSingle(variableDefinitionContext);
    checkOccursClauseIsSingle(variableDefinitionContext);
    checkValueClauseIsSingle(variableDefinitionContext);
    checkUsageClauseIsSingle(variableDefinitionContext);
    checkGlobalFlagFor01Level(variableDefinitionContext);
    setValueClauseText(variableDefinitionContext);
    saveGlobalVariable(variableDefinitionContext);
    checkRedefinesContainsValue(variableDefinitionContext);
    checkRedefinesClauseIsSingle(variableDefinitionContext);
    // TODO: check the same way that the other clauses are singular or absent

    defineVariable(
        variableDefinitionContext,
        this::redefinesMatcher,
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
  public void defineVariable(@NonNull DataDescriptionEntryFormat1Level77Context ctx) {
    VariableDefinitionContext variableDefinitionContext =
        VariableDefinitionContext.builder()
            .number(LEVEL_77)
            .name(retrieveName(ctx.entryName()))
            .definition(
                retrieveDefinition(
                    Optional.<ParserRuleContext>ofNullable(ctx.entryName()).orElse(ctx)))
            .global(!ctx.dataGlobalClause().isEmpty())
            .antlrClass(ctx.getClass())
            .starting(positions.get(ctx.LEVEL_NUMBER_77().getSymbol()))
            .picClauses(ctx.dataPictureClause())
            .valueClauses(ctx.dataValueClause())
            .usageClauses(ctx.dataUsageClause())
            .occursClauses(ctx.dataOccursClause())
            .redefinesClauses(ctx.dataRedefinesClause())
            .build();

    checkStartingArea(variableDefinitionContext);
    checkPictureClauseIsSingle(variableDefinitionContext);
    checkOccursClauseIsSingle(variableDefinitionContext);
    checkValueClauseIsSingle(variableDefinitionContext);
    checkUsageClauseIsSingle(variableDefinitionContext);
    checkTopElementNumber(variableDefinitionContext);
    checkRedefinesClauseIsSingle(variableDefinitionContext);
    checkRedefinesContainsValue(variableDefinitionContext);
    closePreviousStructure();

    defineVariable(variableDefinitionContext, this::redefinesMatcher, this::independentDataItemMatcher);
  }

  /**
   * Create and accumulate a variable of level 66 out of the given context. Add errors if the
   * variable definition contains is invalid
   *
   * @param ctx - a {@link DataDescriptionEntryFormat2Context} to retrieve the variable
   */
  public void defineVariable(@NonNull DataDescriptionEntryFormat2Context ctx) {
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
  public void defineVariable(@NonNull DataDescriptionEntryFormat3Context ctx) {
    VariableDefinitionContext variableDefinitionContext =
        VariableDefinitionContext.builder()
            .number(LEVEL_88)
            .name(retrieveName(ctx.entryName()))
            .definition(
                retrieveDefinition(
                    Optional.<ParserRuleContext>ofNullable(ctx.entryName()).orElse(ctx)))
            .antlrClass(ctx.getClass())
            .starting(positions.get(ctx.LEVEL_NUMBER_88().getSymbol()))
            .valueClauses(ImmutableList.of(ctx.dataValueClause()))
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
  public void defineVariable(EnvironmentSwitchNameClauseContext ctx) {
    String name = retrieveName(ctx.mnemonicName());
    String systemName = ctx.environmentName().getText();
    variables.push(
        new MnemonicName(
            systemName,
            name,
            retrieveDefinition(
                Optional.<ParserRuleContext>ofNullable(ctx.mnemonicName()).orElse(ctx))));
  }

  /**
   * Notify the variable delegate that the processing moved to another section in order to track the
   * structure correctness
   */
  public void notifySectionChanged() {
    closePreviousStructure();
  }

  /**
   * Get the defined variables and found errors
   *
   * @return the defined variables and found errors
   */
  @NonNull
  public ResultWithErrors<Collection<Variable>> finishDefinitionAnalysis() {
    closePreviousStructure();
    checkGlobalVariableDefinitions();
    return new ResultWithErrors<>(new ArrayList<>(variables), new ArrayList<>(errors));
  }

  private void handleRedefine(int levelNumber, DataRedefinesClauseContext context) {
    String redefinesName = VisitorHelper.getName(context.dataName());
    Locality locality = positions.get(context.dataName().getStart());
    if (locality == null) {
      return;
    }

    boolean notFound = true;
    Iterator<Variable> iterator = variables.iterator();
    if (iterator.hasNext()) {
      while (iterator.hasNext()) {
        Variable variable = iterator.next();
        if (redefinesName.equals(variable.getName())) {
          if (levelNumber != variable.getLevelNumber()) {
            addError(messages.getMessage("semantics.levelsMustMatch", redefinesName), positions.get(context.getParent().getStart()));
          }
          variable.addUsage(locality);
          notFound = false;
          break;
        } else {
          if (levelNumber == variable.getLevelNumber()
              && !redefinesName.equals(redefinedVariables.get(variable.getName()))) {
            break;
          }
        }
      }
      if (notFound) {
        addError(messages.getMessage("semantics.redefineImmediatelyFollow", redefinesName), locality);
      }
    }
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
  private List<IndexItem> retrieveIndexItem(int levelNumber, @NonNull DataOccursClauseContext clause) {
    return clause.indexName().stream()
        .map(it -> new IndexItem(levelNumber, it.getText().toUpperCase(), positions.get(it.start)))
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

  private void checkRedefinesContainsValue(VariableDefinitionContext variable) {
    if (!(variable.getRedefinesClauses().isEmpty() || variable.getValueClauses().isEmpty())) {
      ofNullable(positions.get(variable.getValueClauses().get(0).getStart())).ifPresent(locality ->
          addError(messages.getMessage("semantics.redefinedContainValue", variable.getName()), locality));
    }
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

  private void checkRedefinesClauseIsSingle(VariableDefinitionContext variable) {
    checkClauseIsSingle(variable.getDefinition(), variable.getRedefinesClauses(), "REDEFINES");
  }

  private void checkUsageClauseIsSingle(VariableDefinitionContext variable) {
    checkClauseIsSingle(variable.getDefinition(), variable.getUsageClauses(), "USAGE");
  }

  private void checkGlobalFlagFor01Level(VariableDefinitionContext variable) {
    if (variable.global && variable.number != 1)
      addError(messages.getMessage(GLOBAL_NON_01_LEVEL_MSG), variable.definition);
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
      DataValueIntervalContext intervalContext = variable.getValueClauses().get(0).dataValueClauseLiteral()
          .dataValueInterval(0);
      valueClauseText = intervalContext.dataValueIntervalFrom().getText();
      Optional.ofNullable(intervalContext.dataValueIntervalTo())
          .ifPresent(context -> variable.setThruValue(context.literal().getText()));
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
              retrieveIndexItem(variable.getNumber(), variable.getOccursClauses().get(0)),
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
          variable.global,
          structureStack.peek());
    }
    return null;
  }

  private Variable tableDataNameMatcher(VariableDefinitionContext variable) {
    if ((!variable.getPicClauses().isEmpty() || !variable.getUsageClauses().isEmpty())
        && !variable.getOccursClauses().isEmpty()) {
      TableDataName tableDataName =
          new TableDataName(
              variable.getNumber(),
              variable.getName(),
              variable.getDefinition(),
              variable.isGlobal(),
              structureStack.peek(),
              retrievePicText(variable.getPicClauses()),
              variable.getValueClauseTest(),
              retrieveOccursTimes(variable.getOccursClauses().get(0)),
              retrieveIndexItem(variable.getNumber(), variable.getOccursClauses().get(0)),
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
          variable.getNumber(),
          variable.getName(),
          variable.getDefinition(),
          variable.isGlobal(),
          structureStack.peek(),
          retrievePicText(variable.getPicClauses()),
          variable.getValueClauseTest(),
          retrieveUsageFormat(variable.getUsageClauses()));
    }
    return null;
  }

  private Variable redefinesMatcher(VariableDefinitionContext context) {
    if (!context.getRedefinesClauses().isEmpty()) {

      String value = VisitorHelper.getName(context.getRedefinesClauses().get(0).dataName());
      redefinedVariables.put(context.getName(), value);

      handleRedefine(context.getNumber(), context.getRedefinesClauses().get(0));

      ArrayList<Function<VariableDefinitionContext, Variable>> matchers = new ArrayList<>();
      matchers.add(this::groupItemMatcher);
      matchers.add(this::elementItemMatcher);
      return matchers.stream().map(matcher -> matcher.apply(context))
          .filter(Objects::nonNull).findFirst().orElse(null);
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
        variable.getName(), variable.getDefinition(), variable.isGlobal(), picClause, variable.getValueClauseTest());
  }

  private Variable conditionalDataNameMatcher(VariableDefinitionContext variable) {
    ConditionDataName result =
        new ConditionDataName(
            variable.getName(),
            variable.getDefinition(),
            variable.getContainer(),
            variable.getValueClauseTest(),
            variable.getThruValue());
    Optional.ofNullable(variable.getContainer())
        .ifPresent(container -> container.addConditionName(result));
    return result;
  }

  private Variable renameItemMatcher(VariableDefinitionContext variable) {
    List<Variable> childrenToRename = extractChildrenToRename(variable);
    boolean isGlobal = !childrenToRename.isEmpty() && childrenToRename.get(0).isGlobal();
    RenameItem renameItem = new RenameItem(
        variable.getName(),
        isGlobal,
        variable.getDefinition());
    List<Variable> renamedVariables = renameVariables(renameItem, childrenToRename);
    renamedVariables.forEach(variables::push);
    renamedVariables.forEach(renameItem::addChild);
    return renameItem;
  }

  private List<Variable> extractChildrenToRename(VariableDefinitionContext variable) {
    Locality definition = variable.getDefinition();
    if (variable.getPrecedingStructure() == null) {
      addError(messages.getMessage(NO_STRUCTURE_BEFORE_RENAME), definition);
      return ImmutableList.of();
    }
    StructuredVariable structure = variable.getPrecedingStructure();
    List<Variable> previousChildren = collectChildrenToRename(structure);

    DataRenamesClauseContext renamesClause = variable.getRenamesClauseContext();
    String startName = renamesClause.dataName().getText();
    Optional<Variable> start = retrieveChild(previousChildren, startName);
    if (!start.isPresent()) {
      reportChildrenNotFound(startName, definition);
      return ImmutableList.of();
    }

    Variable startVar = start.get();
    Locality startUsage = positions.get(renamesClause.dataName().getStart());
    if (renamesClause.thruDataName() == null) {
      startVar.addUsage(startUsage);
      return ImmutableList.of(startVar);
    }

    String stopName = renamesClause.thruDataName().dataName().getText();
    Optional<Variable> stop = retrieveChild(previousChildren, stopName);
    if (!stop.isPresent()) {
      reportChildrenNotFound(stopName, definition);
      startVar.addUsage(startUsage);
      return ImmutableList.of(startVar);
    }

    Variable stopVar = stop.get();
    Locality stopUsage = positions.get(renamesClause.thruDataName().dataName().getStart());
    int toIndex = previousChildren.indexOf(stopVar);
    int fromIndex = previousChildren.indexOf(startVar);
    if (toIndex <= fromIndex) {
      addError(messages.getMessage(INCORRECT_CHILDREN_ORDER), definition);
      startVar.addUsage(startUsage);
      stopVar.addUsage(stopUsage);
      return ImmutableList.of();
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

  private void saveGlobalVariable(VariableDefinitionContext variableDefinitionContext) {
    if (variableDefinitionContext.global)
      globalVariables.computeIfAbsent(variableDefinitionContext.name, k -> new ArrayList<>())
          .add(variableDefinitionContext);
  }

  private void checkGlobalVariableDefinitions() {
    globalVariables.values().stream()
        .filter(it -> it.size() > 1)
        .flatMap(List::stream)
        .forEach(it -> addError(messages.getMessage(GLOBAL_TOO_MANY_DEFINITIONS), it.getDefinition()));
  }

  /** This data class used for temporal storage ANTLR parsed variables. */
  @Data
  @Builder
  private static class VariableDefinitionContext {
    int number;
    String name;
    Locality definition;
    boolean global;
    Class<? extends ParserRuleContext> antlrClass;
    Locality starting;
    List<DataPictureClauseContext> picClauses;
    List<DataOccursClauseContext> occursClauses;
    List<DataValueClauseContext> valueClauses;
    List<DataUsageClauseContext> usageClauses;
    List<DataRedefinesClauseContext> redefinesClauses;
    String valueClauseTest;
    String thruValue;
    Variable container;
    DataRenamesClauseContext renamesClauseContext;
    UsageFormat usageFormat;
    StructuredVariable precedingStructure;
  }
}
