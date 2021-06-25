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

package org.eclipse.lsp.cobol.core.semantics;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Value;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.variables.Variable;
import org.eclipse.lsp4j.DocumentSymbol;
import org.eclipse.lsp4j.Location;

import java.util.*;

/**
 * This class represents the entire semantic context of the current document, including its
 * variables, paragraphs, copybooks etc., with their definitions and usages.
 */
@Value
@Builder(toBuilder = true)
@AllArgsConstructor
public class SemanticContext {
  @Builder.Default Map<String, Collection<Location>> variableDefinitions = new HashMap<>();
  @Builder.Default Map<String, Collection<Location>> variableUsages = new HashMap<>();
  @Builder.Default Map<String, Collection<Location>> paragraphDefinitions = new HashMap<>();
  @Builder.Default Map<String, Collection<Location>> paragraphUsages = new HashMap<>();
  @Builder.Default Map<String, Collection<Location>> paragraphRanges = new HashMap<>();
  @Builder.Default Map<String, Collection<Location>> sectionDefinitions = new HashMap<>();
  @Builder.Default Map<String, Collection<Location>> sectionUsages = new HashMap<>();
  @Builder.Default Map<String, Collection<Location>> sectionRanges = new HashMap<>();
  @Builder.Default PredefinedVariableContext constants = new PredefinedVariableContext();
  @Builder.Default Map<String, Collection<Location>> copybookDefinitions = new HashMap<>();
  @Builder.Default Map<String, Collection<Location>> copybookUsages = new HashMap<>();
  @Builder.Default Map<String, Collection<Location>> subroutinesDefinitions = new HashMap<>();
  @Builder.Default Map<String, Collection<Location>> subroutinesUsages = new HashMap<>();
  @Builder.Default List<DocumentSymbol> outlineTree = new ArrayList<>();
  @Builder.Default Collection<Variable> variables = new ArrayList<>();
  Node rootNode;
}
