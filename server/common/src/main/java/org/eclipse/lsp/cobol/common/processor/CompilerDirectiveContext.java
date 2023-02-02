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

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/** Compiler directive context */
public class CompilerDirectiveContext {
  @Getter private final List<CompilerDirectiveOption> compilerDirectiveList = new ArrayList<>();

  /**
   * Updates the compiler directive options
   *
   * @param compilerDirectiveOption @{@link CompilerDirectiveOption}
   */
  public void updateDirectiveOptions(CompilerDirectiveOption compilerDirectiveOption) {
    Optional<CompilerDirectiveOption> existingOption =
        compilerDirectiveList.stream()
            .filter(
                options ->
                    options.getCompilerDirectiveName()
                        == compilerDirectiveOption.getCompilerDirectiveName())
            .findFirst();
    compilerDirectiveList.add(existingOption.orElse(compilerDirectiveOption));
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
  public List<CompilerDirectiveOption> filterDirectiveList(List<CompilerDirectiveName> names) {
    return compilerDirectiveList.stream()
        .filter(p -> names.contains(p.getCompilerDirectiveName()))
        .collect(Collectors.toList());
  }
}
