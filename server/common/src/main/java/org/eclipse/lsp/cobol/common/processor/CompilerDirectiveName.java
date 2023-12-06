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

import com.google.common.collect.ImmutableList;

import java.util.Collections;
import java.util.Optional;

/**
 * Compiler directive enum, which needs to be handled for document analysis.
 *
 * <p>Add enums, here in case the compiler directives changes the way document is analysed.
 */
public enum CompilerDirectiveName {
  ADATA {
    @Override
    public Optional<CompilerDirectiveOption> getDirectiveOption(String directiveText) {
      return Optional.empty();
    }

    @Override
    public CompilerDirectiveOption defaultValue() {
      return new CompilerDirectiveOption(this, Collections.emptyList());
    }
  },
  QUALIFY {
    @Override
    public Optional<CompilerDirectiveOption> getDirectiveOption(String directiveText) {
      if (isContains(directiveText, "QUALIFY(EXTEND)") || isContains(directiveText, "QUA(EXTEND)")) {
        return Optional.of(new CompilerDirectiveOption(this, ImmutableList.of("EXTEND")));
      } else if (isContains(directiveText, "QUALIFY(COMPAT)") || isContains(directiveText, "QUA(COMPAT)")) {
        return Optional.of(new CompilerDirectiveOption(this, ImmutableList.of("COMPAT")));
      } else if (isContains(directiveText, "QUALIFY(E_CHAR)") || isContains(directiveText, "QUA(E_CHAR)")) {
        return Optional.of(new CompilerDirectiveOption(this, ImmutableList.of("E_CHAR")));
      } else if (isContains(directiveText, "QUALIFY(C_CHAR)") || isContains(directiveText, "QUA(C_CHAR)")) {
        return Optional.of(new CompilerDirectiveOption(this, ImmutableList.of("C_CHAR")));
      } else {
        return Optional.empty();
      }
    }
    @Override
    public CompilerDirectiveOption defaultValue() {
      return new CompilerDirectiveOption(this, ImmutableList.of("COMPAT"));
    }

  },
  XMLPARSE {
    @Override
    public Optional<CompilerDirectiveOption> getDirectiveOption(String directiveText) {
      if (isContains(directiveText, "XMLPARSE(XMLSS)") || isContains(directiveText, "XP(XMLSS)")) {
        return Optional.of(new CompilerDirectiveOption(this, ImmutableList.of("XMLSS")));
      } else if (isContains(directiveText, "XMLPARSE(COMPAT)") || isContains(directiveText, "XP(COMPAT)")) {
        return Optional.of(new CompilerDirectiveOption(this, ImmutableList.of("COMPAT")));
      } else if (isContains(directiveText, "XMLPARSE(X_CHAR)") || isContains(directiveText, "XP(X_CHAR)")) {
        return Optional.of(new CompilerDirectiveOption(this, ImmutableList.of("X_CHAR")));
      } else if (isContains(directiveText, "XMLPARSE(C_CHAR)") || isContains(directiveText, "XP(C_CHAR)")) {
        return Optional.of(new CompilerDirectiveOption(this, ImmutableList.of("C_CHAR")));
      } else {
        return Optional.empty();
      }
    }

    @Override
    public CompilerDirectiveOption defaultValue() {
      return new CompilerDirectiveOption(this, ImmutableList.of("XMLSS"));
    }
  };

  private static boolean isContains(String directiveText, String s) {
    return directiveText.toUpperCase().contains(s);
  }

  /**
   * Get the {@link CompilerDirectiveOption} based on the compiler directive text in the document.
   *
   * @param directiveText is compiler directive text in the document
   * @return List of {@link CompilerDirectiveOption}
   */
  public abstract Optional<CompilerDirectiveOption> getDirectiveOption(String directiveText);

  /**
   * Creates default value of directive.
   * @return default value of directive.
   */
  public abstract CompilerDirectiveOption defaultValue();
}
