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
package org.eclipse.lsp.cobol.core.engine.symbols;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;
import lombok.Value;
import org.eclipse.lsp.cobol.core.model.tree.CodeBlockDefinitionNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableNode;

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
}
