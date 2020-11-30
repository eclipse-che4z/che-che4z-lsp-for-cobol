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
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.Token;
import org.eclipse.lsp4j.Range;

import javax.annotation.Nullable;
import java.util.*;
import java.util.function.Function;

import static com.broadcom.lsp.cobol.core.model.ErrorSeverity.ERROR;
import static com.broadcom.lsp.cobol.core.model.ErrorSeverity.WARNING;
import static com.broadcom.lsp.cobol.core.visitor.DataDivisionSection.NOT_INITIALIZED;
import static java.lang.String.format;
import static java.util.Optional.*;
import static java.util.function.Predicate.not;
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

  private static final int LEVEL_66 = 66;
  private static final int LEVEL_77 = 77;
  private static final int LEVEL_88 = 88;

  // TODO: make Value a separate class that accepts:
  // TODO: 1. literal
  // TODO: 2. literal THRU literal
  // TODO: 3. REFERENCE data-name
  // TODO: Make PIC a separate class that may validate the given value
  private Deque<StructuredVariable> structureStack = new ArrayDeque<>();
  // TODO: Check variable uniquity on usage by qualifier
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

    int number = Integer.parseInt(ctx.LEVEL_NUMBER().getText());

    // TODO: Add check that name does not present in the predefined variables list (? - to check)
    String name = retrieveName(ctx.entryName());
    Locality definition = retrieveDefinition(ctx.entryName());

    checkVariableTypeAllowed(ctx.getClass(), definition);
    checkStartingArea(number, positions.get(ctx.LEVEL_NUMBER().getSymbol()));
    closePreviousStructureIfNeeded(number);
    checkTopElementNumber(number, definition);

    String qualifier = retrieveQualifier(name);

    Optional<DataPictureClauseContext> picClause = retrieveClause(ctx.dataPictureClause());
    Optional<DataOccursClauseContext> occursClause = retrieveClause(ctx.dataOccursClause());
    // TODO: check the same way that the other clauses are singular or absent

    Variable variable;
    if (picClause.isEmpty()) {
      StructuredVariable structuredVariable =
          occursClause
              .<StructuredVariable>map(
                  it ->
                      new MultiTableDataName(
                          number,
                          name,
                          qualifier,
                          definition,
                          retrieveOccursTimes(occursClause.get()),
                          retrieveIndexItem(occursClause.get())))
              .orElse(new GroupItem(number, qualifier, name, definition));

      structureStack.push(structuredVariable);
      variable = structuredVariable;
    } else {
      // TODO: add check that the following items do not have VALUE:
      // TODO: 1. JUSTIFIED
      // TODO: 2. SYNCHRONIZED
      // TODO: 3. USAGE (not USAGE IN DISPLAY)
      String valueClauseText =
          retrieveClause(ctx.dataValueClause())
              .map(DataValueClauseContext::dataValueClauseLiteral)
              .map(ParserRuleContext::getText)
              .orElse("");

      String picClauseText = retrievePicText(picClause.get());
      variable =
          occursClause
              .map(
                  occurs ->
                      new TableDataName(
                          name,
                          qualifier,
                          definition,
                          picClauseText,
                          valueClauseText,
                          retrieveOccursTimes(occurs),
                          retrieveIndexItem(occurs)))
              .map(storeIndexVariables())
              .orElse(new ElementItem(name, qualifier, definition, picClauseText, valueClauseText));

      // TODO: add check that value does not exceed PIC length
      ofNullable(structureStack.peek()).ifPresent(it -> it.addChild(variable));
    }
    variables.push(variable);
  }

  /**
   * Create and accumulate a variable of level 77 out of the given context. Add errors if the
   * variable definition contains is invalid
   *
   * @param ctx - a {@link DataDescriptionEntryFormat1Level77Context} to retrieve the variable
   */
  void defineVariable(@NonNull DataDescriptionEntryFormat1Level77Context ctx) {
    String name = retrieveName(ctx.entryName());
    Locality definition = retrieveDefinition(ctx.entryName());

    checkVariableTypeAllowed(ctx.getClass(), definition);
    checkStartingArea(LEVEL_77, positions.get(ctx.LEVEL_NUMBER_77().getSymbol()));
    closePreviousStructure();
    checkTopElementNumber(LEVEL_77, definition);

    String qualifier = retrieveQualifier(name);
    String picClause =
        retrieveClause(ctx.dataPictureClause()).map(this::retrievePicText).orElse("");

    if (picClause.isEmpty()) {
      addError(messages.getMessage(EMPTY_STRUCTURE_MSG, name), definition);
    }

    String valueClauseText =
        retrieveClause(ctx.dataValueClause())
            .map(DataValueClauseContext::dataValueClauseLiteral)
            .map(ParserRuleContext::getText)
            .orElse("");

    variables.push(
        new IndependentDataItem(name, qualifier, definition, picClause, valueClauseText));
  }

  /**
   * Create and accumulate a variable of level 66 out of the given context. Add errors if the
   * variable definition contains is invalid
   *
   * @param ctx - a {@link DataDescriptionEntryFormat2Context} to retrieve the variable
   */
  void defineVariable(@NonNull DataDescriptionEntryFormat2Context ctx) {
    String name = retrieveName(ctx.entryName());
    Locality definition = retrieveDefinition(ctx.entryName());
    String qualifier = retrieveQualifier(name);
    checkVariableTypeAllowed(ctx.getClass(), definition);
    checkTopElementNumber(LEVEL_66, definition);
    StructuredVariable structure = structureStack.getFirst();
    Variable previousVariable = variables.peek();
    if (structure == null || previousVariable == null) {
      addError(messages.getMessage(NO_STRUCTURE_BEFORE_RENAME), definition);
      variables.push(new RenameItem(name, qualifier, definition, List.of()));
      return;
    }
    closePreviousStructure();

    List<Variable> childrenToRename;
    List<Variable> previousChildren = structure.getChildren();
    DataRenamesClauseContext renamesClause = ctx.dataRenamesClause();
    String startName = renamesClause.qualifiedDataName().getText();
    Optional<Variable> start = retrieveChild(previousChildren, startName);
    if (start.isEmpty()) {
      childrenToRename = List.of();
      reportChildrenNotFound(renamesClause, startName);
    } else if (renamesClause.thruDataName() != null) {
      String stopName = renamesClause.thruDataName().qualifiedDataName().getText();
      Optional<Variable> stop = retrieveChild(previousChildren, stopName);
      if (stop.isEmpty()) {
        reportChildrenNotFound(renamesClause, stopName);
        childrenToRename = List.of(start.get());
      } else {
        int fromIndex = previousChildren.indexOf(start.get());
        int toIndex = previousChildren.indexOf(stop.get());
        if (toIndex <= fromIndex) {
          addError(INCORRECT_CHILDREN_ORDER, definition);
          childrenToRename = List.of(start.get());
        } else childrenToRename = previousChildren.subList(fromIndex, toIndex);
      }
    } else {
      childrenToRename = List.of(start.get());
    }
    List<Variable> renamedVariables = renameVariables(name, childrenToRename);

    variables.push(new RenameItem(name, qualifier, definition, renamedVariables));
    renamedVariables.forEach(variables::push);
  }

  /**
   * Create and accumulate a variable of level 88 out of the given context. Add errors if the
   * variable definition contains is invalid
   *
   * @param ctx - a {@link DataDescriptionEntryFormat3Context} to retrieve the variable
   */
  void defineVariable(@NonNull DataDescriptionEntryFormat3Context ctx) {
    String name = retrieveName(ctx.entryName());
    Locality definition = retrieveDefinition(ctx.entryName());
    String valueClauseText = ctx.dataValueClause().dataValueClauseLiteral().getText();
    ElementItem container = getConditionalContainer();

    checkVariableTypeAllowed(ctx.getClass(), definition);
    checkTopElementNumber(LEVEL_88, definition);

    ConditionalDataName variable;
    if (container == null) {
      addError(messages.getMessage(PREVIOUS_WITHOUT_PIC_FOR_88, name), definition);
      String qualifier = retrieveQualifier(name);
      variable = new ConditionalDataName(name, qualifier, definition, valueClauseText);
    } else {
      String qualifier = container.getQualifier() + " " + name;
      variable = new ConditionalDataName(name, qualifier, definition, valueClauseText);
      container.addConditionalChild(variable);
    }
    variables.push(variable);
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

  private String retrieveName(EntryNameContext context) {
    return ofNullable(context).map(RuleContext::getText).orElse(OutlineNodeNames.FILLER_NAME);
  }

  private String retrieveQualifier(String name) {
    return VariableUtils.createQualifier(structureStack, name);
  }

  private Optional<Variable> retrieveChild(List<Variable> childrenToRename, String stopName) {
    return childrenToRename.stream().filter(it -> it.getName().equals(stopName)).findFirst();
  }

  private List<Variable> renameVariables(String renameVariableName, List<Variable> children) {
    List<Variable> renamedVariables =
        children.stream().map(it -> it.rename(renameVariableName)).collect(toList());
    renamedVariables.stream()
        .filter(not(Renameable::isRenameable))
        .forEach(
            it ->
                addError(messages.getMessage(CANNOT_BE_RENAMED, it.getName()), it.getDefinition()));
    return renamedVariables;
  }

  private void reportChildrenNotFound(DataRenamesClauseContext renamesClause, String stopName) {
    addError(
        messages.getMessage(CHILD_TO_RENAME_NOT_FOUND, stopName),
        positions.get(renamesClause.qualifiedDataName().getStart()));
  }

  private Function<TableDataName, Variable> storeIndexVariables() {
    return table -> {
      table.getIndexes().forEach(variables::push);
      return table;
    };
  }

  private void checkTopElementNumber(int number, Locality definition) {
    if (number == 1 || number == LEVEL_66 || number == LEVEL_77) return;
    addError(messages.getMessage(NUMBER_NOT_ALLOWED_AT_TOP), definition);
  }

  private void checkVariableTypeAllowed(Class variableType, Locality definition) {
    if (!section.allowsVariableType(variableType)) {
      addError(messages.getMessage(DEFINITION_NOT_ALLOWED_IN_SECTION), definition);
    }
  }

  @Nullable
  private ElementItem getConditionalContainer() {
    return (ElementItem)
        ofNullable(variables.peek())
            .filter(it -> it instanceof ElementItem)
            .filter(it -> ((ElementItem) it).getValue().isEmpty())
            .orElse(null);
  }

  @NonNull
  private Locality retrieveDefinition(EntryNameContext context) {
    return positions.get(context.start);
  }

  @NonNull
  private String retrievePicText(@NonNull DataPictureClauseContext picClause) {
    return picClause.getText().replaceAll(picClause.getStart().getText(), "");
  }

  @NonNull
  private <T extends ParserRuleContext> Optional<T> retrieveClause(@NonNull List<T> clauses) {
    if (clauses.isEmpty()) return empty();
    if (clauses.size() > 1) {
      addError(
          messages.getMessage(TOO_MANY_CLAUSES_MSG, clauses.get(0).getStart().getText()),
          retrieveRangeLocality(clauses));
    }
    return of(clauses.get(0));
  }

  @NonNull
  private <T extends ParserRuleContext> Locality retrieveRangeLocality(@NonNull List<T> clauses) {
    Locality start = positions.get(clauses.get(0).getStart());
    Locality end = positions.get(clauses.get(clauses.size() - 1).getStop());
    Range range = new Range(start.getRange().getStart(), end.getRange().getEnd());
    return Locality.builder().uri(start.getUri()).range(range).build();
  }

  private int retrieveOccursTimes(@NonNull DataOccursClauseContext dataOccursClauseContexts) {
    return Integer.parseInt(dataOccursClauseContexts.integerLiteral().toString());
  }

  @NonNull
  private List<IndexItem> retrieveIndexItem(@NonNull DataOccursClauseContext clause) {
    return clause.indexName().stream()
        .map(it -> new IndexItem(it.getText(), it.getText(), positions.get(it.start)))
        .collect(toList());
  }

  private void closePreviousStructure() {
    closePreviousStructureIfNeeded(0);
  }

  private void closePreviousStructureIfNeeded(int number) {
    ofNullable(structureStack.peek())
        .filter(it -> it.getChildren().isEmpty())
        .ifPresent(
            it ->
                addError(
                    messages.getMessage(EMPTY_STRUCTURE_MSG, it.getName()), it.getDefinition()));
    structureStack.removeIf(it -> it.getLevelNumber() >= number);
  }

  private void checkStartingArea(int number, @NonNull Locality locality) {
    if ((number == 1 || number == LEVEL_77) && locality.getRange().getStart().getCharacter() > 10) {
      addError(AREA_A_WARNING, locality, WARNING);
    }
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
}
