/*
 *
 *  Copyright (c) 2020 Broadcom.
 *  The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 *  This program and the accompanying materials are made
 *  available under the terms of the Eclipse Public License 2.0
 *  which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 *  SPDX-License-Identifier: EPL-2.0
 *
 *  Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */

package com.ca.lsp.core.cobol.semantics;

import lombok.AllArgsConstructor;
import lombok.Value;
import org.eclipse.lsp4j.DocumentSymbol;
import org.eclipse.lsp4j.Location;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * This class represents the entire semantic context of the current document, including its
 * variables, paragraphs, copybooks etc., with their definitions and usages.
 */
@Value
@AllArgsConstructor
public class SemanticContext {
  private Map<String, Collection<Location>> variableDefinitions;
  private Map<String, Collection<Location>> variableUsages;
  private Map<String, Collection<Location>> paragraphDefinitions;
  private Map<String, Collection<Location>> paragraphUsages;
  private Map<String, Collection<Location>> constantDefinitions;
  private Map<String, Collection<Location>> constantUsages;
  private Map<String, Collection<Location>> copybookDefinitions;
  private Map<String, Collection<Location>> copybookUsages;
  private List<DocumentSymbol> outlineTree;
}
