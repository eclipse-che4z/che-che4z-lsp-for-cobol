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

package org.eclipse.lsp.cobol.service.delegates.completions;

import lombok.NonNull;
import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.core.model.variables.StructuredVariable;
import org.eclipse.lsp.cobol.core.model.variables.Variable;
import org.eclipse.lsp4j.MarkupContent;

import javax.annotation.Nullable;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

/** This utility class contains methods specific for preparing completion suggestion */
@UtilityClass
public class DocumentationUtils {

  public static final String PREFIX = "  ";

  /**
   * Returns predicate which may be used to filter strings that starts with a given string ignoring
   * case. Code example: list.stream().filter(CompletionUtils.startsWithIgnoreCase("string");
   *
   * @param token - The string that the checking string should start with
   * @return Predicate that may be used in Stream.filter()
   */
  @NonNull
  Predicate<String> startsWithIgnoreCase(@NonNull String token) {
    return word -> word.regionMatches(true, 0, token, 0, token.length());
  }

  /**
   * Convert given string into a marked up content with "markdown" kind
   *
   * @param text - text to wrap
   * @return marked up text
   */
  @NonNull
  MarkupContent wrapWithMarkup(@Nullable String text) {
    MarkupContent markupContent = new MarkupContent();
    markupContent.setKind("markdown");
    markupContent.setValue(text);
    return markupContent;
  }

  /**
   * Collects a string description of the hierarchy of the variable
   *
   * @param variable - a variable to collect the hierarchy
   * @return string description
   */
  public String collectDescription(Variable variable) {
    StringBuilder prefix = new StringBuilder();
    List<String> lines = new ArrayList<>();
    for (String parentLine : parentsDescriptions(variable.getParent())) {
      lines.add(prepend(prefix.toString(), parentLine));
      prefix.append(PREFIX);
    }
    lines.add(prepend(prefix.toString(), variable.getFormattedDisplayLine()));
    prefix.append(PREFIX);
    lines.addAll(childrenDescriptions(variable, prefix.toString()));
    return String.join("\n", lines);
  }

  private List<String> parentsDescriptions(Variable variable) {
    if (variable == null) return new ArrayList<>();
    List<String> result = parentsDescriptions(variable.getParent());
    result.add(variable.getFormattedDisplayLine());
    return result;
  }

  private List<String> childrenDescriptions(Variable variable, String prefix) {
    List<String> description = new ArrayList<>();
    if (variable instanceof StructuredVariable) {
      ((StructuredVariable) variable)
          .getChildren().stream()
              .map(it -> childDescription(prefix, it))
              .forEach(description::addAll);
    }
    description.addAll(collectConditionNames(variable.getConditionNames(), prefix));
    return description;
  }

  private List<String> childDescription(String prefix, Variable variable) {
    List<String> description = new ArrayList<>();
    description.add(prepend(prefix, variable.getFormattedDisplayLine()));
    description.addAll(collectConditionNames(variable.getConditionNames(), prefix + PREFIX));
    return description;
  }

  private List<String> collectConditionNames(List<? extends Variable> variables, String prefix) {
    return variables.stream()
        .map(Variable::getFormattedDisplayLine)
        .map(it -> prepend(prefix, it))
        .collect(Collectors.toList());
  }

  private String prepend(String prefix, String text) {
    return prefix + text.replace("\n", "\n" + prefix);
  }
}
