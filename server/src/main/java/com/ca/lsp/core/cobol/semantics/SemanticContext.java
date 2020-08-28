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

import com.broadcom.lsp.domain.common.model.Position;
import lombok.AllArgsConstructor;
import lombok.Value;
import org.eclipse.lsp4j.DocumentSymbol;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * THis class represents the entire semantic context of the current document, including its
 * variables, paragraphs, copybooks etc., with their definitions and usages.
 */
@Value
@AllArgsConstructor
public class SemanticContext {
  private Map<String, Collection<Position>> variableDefinitions;
  private Map<String, Collection<Position>> variableUsages;
  private Map<String, Collection<Position>> paragraphDefinitions;
  private Map<String, Collection<Position>> paragraphUsages;
  private Map<String, Collection<Position>> copybookDefinitions;
  private Map<String, Collection<Position>> copybookUsages;
  private List<DocumentSymbol> outlineTree;
}
