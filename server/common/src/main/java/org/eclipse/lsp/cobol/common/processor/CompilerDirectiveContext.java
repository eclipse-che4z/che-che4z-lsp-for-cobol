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
package org.eclipse.lsp.cobol.common.processor;

import lombok.Getter;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/** Compiler directive context */
public class CompilerDirectiveContext {
  @Getter private final Map<CompilerDirectiveName, List<String>> compilerDirectiveMap;

  public CompilerDirectiveContext() {
    this.compilerDirectiveMap = defaultCompilerDirective();
  }

  private Map<CompilerDirectiveName, List<String>> defaultCompilerDirective() {
    return Arrays.stream(CompilerDirectiveName.values())
        .map(directive -> directive.getDirectiveOption(""))
        .flatMap(o -> o.map(Stream::of).orElseGet(Stream::empty))
        .collect(
            Collectors.toMap(
                CompilerDirectiveOption::getCompilerDirectiveName,
                CompilerDirectiveOption::getValue));
  }

  /**
   * Updates the compiler directive options
   *
   * @param compilerDirectiveOption {@link CompilerDirectiveOption}
   */
  public void updateDirectiveOptions(CompilerDirectiveOption compilerDirectiveOption) {
    compilerDirectiveMap.merge(compilerDirectiveOption.getCompilerDirectiveName(),
            compilerDirectiveOption.getValue(),
            (n1, n2) -> Stream.concat(n1.stream(), n2.stream()).collect(Collectors.toList()));
  }

  /**
   * Updates the list of compiler directive options
   *
   * @param compilerDirectiveOption List of @{@link CompilerDirectiveOption}
   */
  public void updateDirectiveOptions(List<CompilerDirectiveOption> compilerDirectiveOption) {
    compilerDirectiveOption.forEach(this::updateDirectiveOptions);
  }

  /**
   * Utility to get filtered list of compiler directive from the context
   *
   * @param names List of @{@link CompilerDirectiveName}
   * @return List of @{@link CompilerDirectiveOption}
   */
  public Optional<CompilerDirectiveOption> filterDirectiveList(List<CompilerDirectiveName> names) {
    CompilerDirectiveOption defaultValue = names.get(0).defaultValue();
    return Optional.ofNullable(compilerDirectiveMap.entrySet().stream()
            .filter(entry -> Objects.nonNull(entry.getKey()))
            .filter(entry -> names.contains(entry.getKey()))
            .map(entry -> new CompilerDirectiveOption(entry.getKey(), entry.getValue()))
            .findFirst().orElse(defaultValue));
  }
}
