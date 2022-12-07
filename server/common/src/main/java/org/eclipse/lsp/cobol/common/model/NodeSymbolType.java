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

package org.eclipse.lsp.cobol.common.model;

import lombok.AllArgsConstructor;
import org.eclipse.lsp4j.SymbolKind;

import static org.eclipse.lsp4j.SymbolKind.Class;
import static org.eclipse.lsp4j.SymbolKind.Object;
import static org.eclipse.lsp4j.SymbolKind.*;

/**
 * The Node Type represents different kinds of COBOL source structure. Has the same meaning as
 * SymbolKind from LSP.
 *
 * @see <a
 *     href="https://microsoft.github.io/language-server-protocol/specifications/specification-current/#textDocument_documentSymbol">LSP
 *     document symbol</a>
 */
@AllArgsConstructor
public enum NodeSymbolType {
  PROGRAM(Class),
  PROGRAM_ID(Method),
  DIVISION(Method),
  SECTION(Object),
  STRUCT(Struct),
  REDEFINES(Constant),
  MNEMONIC_NAME(Variable),
  FIELD(Variable),
  FIELD_66(Variable),
  FIELD_88(EnumMember),
  COPYBOOK(File),
  PROCEDURE(Method),
  PROCEDURE_SECTION(Method),
  FILE(File),
  MAP_NAME(Variable);

  private final SymbolKind symbolKind;

  /**
   * Gives an appropriate SymbolKind.
   *
   * @return the SymbolKind.
   */
  public SymbolKind getSymbolKind() {
    return symbolKind;
  }
}
