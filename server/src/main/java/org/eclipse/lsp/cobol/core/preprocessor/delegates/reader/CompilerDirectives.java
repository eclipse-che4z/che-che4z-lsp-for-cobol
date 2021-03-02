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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.reader;

/**
 * Enum for supported Compiler directives. These compiler directives can't be continued to the next
 * line.
 */
public enum CompilerDirectives {
  CBL("*CBL"),
  CONTROL("*CONTROL"),
  EJECT("EJECT"),
  ENTER("ENTER"),
  PROCESS("PROCESS"),
  PROCESS_CBL("CBL"),
  SKIP1("SKIP1"),
  SKIP2("SKIP2"),
  SKIP3("SKIP3"),
  TITLE("TITLE");

  private final String directive;

  CompilerDirectives(String directive) {
    this.directive = directive;
  }

  public String getDirective() {
    return directive;
  }
}
