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
package org.eclipse.lsp.cobol.core.model.tree.variables;

import com.google.common.collect.ImmutableList;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;
import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.function.Supplier;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil.TOO_MANY_CLAUSES_MSG;

/** The node represents a variable definition. */
@Getter
@ToString(callSuper = true)
@SuppressWarnings("squid:S107")
@EqualsAndHashCode(callSuper = true)
public final class VariableDefinitionNode extends Node {
  private static final String SPACES_AFTER_NEWLINE_REGEX = "[\\r\\n|\\r|\\n]\\s+";
  private final int level;
  private final VariableNameAndLocality variableName;
  private final boolean global;
  private final List<String> picClauses;
  private final List<OccursClause> occursClauses;
  private final List<ValueClause> valueClauses;
  private final List<VariableNameAndLocality> redefinesClauses;
  private final List<VariableNameAndLocality> renamesClause;
  private final List<VariableNameAndLocality> renamesThruClause;
  private final String systemName;
  private final Locality levelLocality;
  private final boolean isBlankWhenZeroPresent;
  private final boolean isSignClausePresent;
  private final String valueToken;
  private final String fileDescriptor;
  @Setter private String fileControlClause;
  private final boolean isSortDescription;
  @Setter private List<UsageFormat> usageClauses;

  private VariableDefinitionNode(
      Locality location,
      int level,
      VariableNameAndLocality variableName,
      boolean global,
      List<String> picClauses,
      List<OccursClause> occursClauses,
      List<ValueClause> valueClauses,
      List<UsageFormat> usageClauses,
      List<VariableNameAndLocality> redefinesClauses,
      List<VariableNameAndLocality> renamesClause,
      List<VariableNameAndLocality> renamesThruClause,
      String systemName,
      Locality levelLocality,
      boolean isBlankWhenZeroPresent,
      boolean isSignClausePresent,
      String valueToken,
      String fileDescriptor,
      String fileControlClause,
      boolean isSortDescription) {
    super(location, NodeType.VARIABLE_DEFINITION);
    this.level = level;
    this.variableName = variableName;
    this.global = global;
    this.picClauses = picClauses;
    this.occursClauses = occursClauses;
    this.valueClauses = valueClauses;
    this.usageClauses = usageClauses;
    this.redefinesClauses = redefinesClauses;
    this.renamesClause = renamesClause;
    this.renamesThruClause = renamesThruClause;
    this.systemName = systemName;
    this.levelLocality = levelLocality;
    this.isBlankWhenZeroPresent = isBlankWhenZeroPresent;
    this.isSignClausePresent = isSignClausePresent;
    this.valueToken = valueToken;
    this.fileDescriptor = fileDescriptor;
    this.fileControlClause = fileControlClause;
    this.isSortDescription = isSortDescription;
  }

  private static SyntaxError checkClauseIsSingle(
      VariableNode variableNode, Supplier<List<?>> clausesGetter, String clauseName) {
    if (clausesGetter.get().size() > 1)
      return variableNode.getError(MessageTemplate.of(TOO_MANY_CLAUSES_MSG, clauseName));
    return null;
  }

  /**
   * Construct a new builder for {@link}VariableDefinitionNode{@link}.
   *
   * @return the builder
   */
  public static Builder builder() {
    return new Builder();
  }

  /**
   * Get definition value
   *
   * @return the value or empty string
   */
  public String getValue() {
    if (valueClauses.isEmpty()) return "";
    return valueClauses.get(0).getValueIntervals().get(0).getFrom();
  }

  /**
   * Get value intervals
   *
   * @return the intervals or empty list
   */
  public List<ValueInterval> getValueIntervals() {
    if (valueClauses.isEmpty()) return ImmutableList.of();
    return valueClauses.get(0).getValueIntervals();
  }

  /**
   * Get value picture
   *
   * @return the value picture or empty string
   */
  public String getPic() {
    if (picClauses.isEmpty()) return "";
    return picClauses.get(0);
  }

  /**
   * Return occurs number
   *
   * @return the occurs number
   */
  public Integer getOccursNumber() {
    return occursClauses.get(0).getFrom();
  }

  /**
   * Return occurs indexes
   *
   * @return the occurs indexes
   */
  public List<VariableNameAndLocality> getOccursIndexes() {
    return occursClauses.get(0).getIndexed();
  }

  /**
   * Get usage
   *
   * @return the variable usage
   */
  public UsageFormat getUsage() {
    if (usageClauses.isEmpty()) return UsageFormat.UNDEFINED;
    return usageClauses.get(0);
  }

  /**
   * Return redefines clause
   *
   * @return variable name and locality for redefines clause
   */
  public VariableNameAndLocality getRedefines() {
    return redefinesClauses.get(0);
  }

  /**
   * Get value locality
   *
   * @return the value locality
   */
  public Locality getValueLocality() {
    return valueClauses.get(0).getLocality();
  }

  /**
   * Return true if the variable definition has a value
   *
   * @return true if the variable definition has a value
   */
  public boolean hasValue() {
    return !valueClauses.isEmpty();
  }

  /**
   * Return true if the variable definition has a picture
   *
   * @return true if the variable definition has a picture
   */
  public boolean hasPic() {
    return !picClauses.isEmpty();
  }

  /**
   * Return true if the variable definition doesn't have a picture
   *
   * @return true if the variable definition doesn't have a picture
   */
  public boolean doesntHavePic() {
    return picClauses.isEmpty();
  }

  /**
   * Return true if the variable definition has occurs clause
   *
   * @return true if the variable definition has occurs clause
   */
  public boolean hasOccurs() {
    return !occursClauses.isEmpty();
  }

  /**
   * Return true if the variable definition doesn't have occurs clause
   *
   * @return true if the variable definition doesn't have occurs clause
   */
  public boolean doesntHaveOccurs() {
    return occursClauses.isEmpty();
  }

  /**
   * Return true if the variable definition has usage clause
   *
   * @return true if the variable definition has usage clause
   */
  public boolean hasUsage() {
    return !usageClauses.isEmpty();
  }

  /**
   * Return true if the variable definition doesn't have usage clause
   *
   * @return true if the variable definition doesn't have usage clause
   */
  public boolean doesntHaveUsage() {
    return usageClauses.isEmpty() || usageClauses.contains(UsageFormat.UNDEFINED);
  }

  /**
   * Return true if the variable definition has redefines clause
   *
   * @return true if the variable definition has redefines clause
   */
  public boolean hasRedefines() {
    return !redefinesClauses.isEmpty();
  }

  /**
   * Return true if the variable definition doesn't have redefines clause
   *
   * @return true if the variable definition doesn't have redefines clause
   */
  public boolean doesntHaveRedefines() {
    return redefinesClauses.isEmpty();
  }

  /**
   * Return list of errors.
   *
   * @param variableNode related variableNode for extracting appropriate locality for errors
   * @return the list of syntax errors
   */
  public List<SyntaxError> getErrors(VariableNode variableNode) {
    return Stream.of(
            checkClauseIsSingle(variableNode, this::getPicClauses, "PICTURE"),
            checkClauseIsSingle(variableNode, this::getOccursClauses, "OCCURS"),
            checkClauseIsSingle(variableNode, this::getValueClauses, "VALUE"),
            checkClauseIsSingle(variableNode, this::getRedefinesClauses, "REDEFINES"),
            checkClauseIsSingle(variableNode, this::getUsageClauses, "USAGE")
            // TODO: check the same way that the other clauses are singular or absent
            )
        .filter(Objects::nonNull)
        .collect(Collectors.toList());
  }

  /**
   * Returns file Description text for the FD / SD variable
   * @return String
   */
  public String getFileDescriptor() {
    return Optional.ofNullable(fileDescriptor)
        .map(f -> f.replaceAll(SPACES_AFTER_NEWLINE_REGEX, System.lineSeparator()))
        .orElse("");
  }

  /**
   * Returns file control text for a FD / SD variable.
   * @return String
   */
  public String getFileControlClause() {
    return Optional.ofNullable(fileControlClause)
        .map(c -> c.replaceAll(SPACES_AFTER_NEWLINE_REGEX, System.lineSeparator()))
        .orElse("");
  }

  /**
   * Returns True if variable is SD, false otherwise
   * @return boolean
   */
  public boolean isSortDescription() {
    return isSortDescription;
  }

  /** The builder for {@link}VariableDefinitionNode{@link}. */
  @Accessors(chain = true, fluent = true)
  @Setter
  public static final class Builder {
    int level;
    VariableNameAndLocality variableNameAndLocality;
    boolean global;
    List<String> picClauses = ImmutableList.of();
    List<OccursClause> occursClauses = ImmutableList.of();
    List<ValueClause> valueClauses = ImmutableList.of();
    List<UsageFormat> usageClauses = ImmutableList.of();
    List<VariableNameAndLocality> redefinesClauses = ImmutableList.of();
    List<VariableNameAndLocality> renamesClause;
    List<VariableNameAndLocality> renamesThruClause;
    Locality statementLocality;
    String systemName;
    Locality levelLocality;
    boolean blankWhenZero;
    boolean signClause;
    String valueToken;
    String fileDescriptor;
    String fileControlClause;
    boolean isSortDescription;

    private Builder() {}

    /**
     * Build the VariableDefinitionNode.
     *
     * @return the VariableDefinitionNode
     */
    public VariableDefinitionNode build() {
      return new VariableDefinitionNode(
          statementLocality,
          level,
          variableNameAndLocality,
          global,
          picClauses,
          occursClauses,
          valueClauses,
          usageClauses,
          redefinesClauses,
          renamesClause,
          renamesThruClause,
          systemName,
          levelLocality,
          blankWhenZero,
          signClause,
          valueToken,
          fileDescriptor,
          fileControlClause,
          isSortDescription);
    }
  }
}
