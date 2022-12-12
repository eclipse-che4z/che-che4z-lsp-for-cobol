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

import java.util.Optional;

/**
 * Compiler directive enum, which needs to be handled for document analysis.
 *
 * <p>Add enums, here in case the compiler directives changes the way document is analysed.
 */
public enum CompilerDirectiveName {
  ADATA {
    @Override
    public Optional<CompilerDirectiveOption<Boolean>> getDirectiveOption(String directiveText) {
      return Optional.empty();
    }
  },
  QUALIFY {
    @Override
    public Optional<CompilerDirectiveOption<Boolean>> getDirectiveOption(String directiveText) {
      return Optional.of(new CompilerDirectiveOption<>(true, this))
              .filter(cd -> directiveText.contains("QUALIFY(EXTEND)"));
    }
  },
  QUA {
    @Override
    public Optional<CompilerDirectiveOption<Boolean>> getDirectiveOption(String directiveText) {
      return Optional.of(new CompilerDirectiveOption<>(true, this))
              .filter(cd -> directiveText.contains("QUA(EXTEND)"));
    }
  };

  /**
   * Get the {@link CompilerDirectiveOption} based on the compiler directive text in the document.
   *
   * @param directiveText is compiler directive text in the document
   * @return List of {@link CompilerDirectiveOption}
   */
  public abstract Optional<CompilerDirectiveOption<Boolean>> getDirectiveOption(String directiveText);
}
