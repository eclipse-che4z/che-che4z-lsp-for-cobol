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
package org.eclipse.lsp.cobol.common.symbols;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;
import lombok.Value;
import org.eclipse.lsp.cobol.common.model.tree.CodeBlockDefinitionNode;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** A container for symbol information */
@Value
public class SymbolTable {
  List<CodeBlockDefinitionNode> codeBlocks = new ArrayList<>();
  Map<String, CodeBlockReference> paragraphMap = new HashMap<>();
  Map<String, CodeBlockReference> sectionMap = new HashMap<>();
  Multimap<String, VariableNode> variables = ArrayListMultimap.create();

  /**
   * Generates unique key for the prorgam
   * @param program node
   * @return string value of a generated key
   */
  public static String generateKey(ProgramNode program) {
    return program.getProgramName() + "%" + program.getLocality().getUri() + "%" + program.getLocality().getRange();
  }
}
