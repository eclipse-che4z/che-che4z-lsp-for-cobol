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

package com.broadcom.lsp.cobol.core.semantics;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Value;
import org.eclipse.lsp4j.DocumentSymbol;
import org.eclipse.lsp4j.Location;

import java.util.*;

/**
 * This class represents the entire semantic context of the current document, including its
 * variables, paragraphs, copybooks etc., with their definitions and usages.
 */
@Value
@Builder
@AllArgsConstructor
public class SemanticContext {
  @Builder.Default Map<String, Collection<Location>> variableDefinitions = new HashMap<>();
  @Builder.Default Map<String, Collection<Location>> variableUsages = new HashMap<>();
  @Builder.Default Map<String, Collection<Location>> paragraphDefinitions = new HashMap<>();
  @Builder.Default Map<String, Collection<Location>> paragraphUsages = new HashMap<>();
  @Builder.Default Map<String, Collection<Location>> sectionDefinitions = new HashMap<>();
  @Builder.Default Map<String, Collection<Location>> sectionUsages = new HashMap<>();
  @Builder.Default Map<String, Collection<Location>> constantDefinitions = new HashMap<>();
  @Builder.Default Map<String, Collection<Location>> constantUsages = new HashMap<>();
  @Builder.Default Map<String, Collection<Location>> copybookDefinitions = new HashMap<>();
  @Builder.Default Map<String, Collection<Location>> copybookUsages = new HashMap<>();
  @Builder.Default Map<String, Collection<Location>> subroutinesDefinitions = new HashMap<>();
  @Builder.Default Map<String, Collection<Location>> subroutinesUsages = new HashMap<>();
  @Builder.Default List<DocumentSymbol> outlineTree=new ArrayList<>();
}
