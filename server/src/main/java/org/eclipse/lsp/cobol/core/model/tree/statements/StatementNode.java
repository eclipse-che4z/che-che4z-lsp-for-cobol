/*
 * Copyright (c) 2021 Broadcom.
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

package org.eclipse.lsp.cobol.core.model.tree.statements;

import lombok.NonNull;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.variables.Variable;

import java.util.List;
import java.util.Map;

import static org.eclipse.lsp.cobol.core.model.tree.NodeType.STATEMENT;

/**
 * This class represents a special node for statements that may apply statement-specific validation.
 * The extensions should encapsulate the logic of all the applicable semantic checks.
 */
public abstract class StatementNode extends Node {

  protected StatementNode(Locality locality) {
    super(locality, STATEMENT);
  }

  /**
   * Apply all the specific validation and return found errors. If the map does not contain value
   * for the locality, then it means that it was not defined correctly and should be skipped. The
   * "Invalid definition" error is defined on the previous steps.
   *
   * @param variableUsages - a map of variable usage localities to the variables themselves.
   * @return a list of syntax errors if they are found or an empty list otherwise.
   */
  @NonNull
  public abstract List<SyntaxError> validate(Map<Locality, Variable> variableUsages);
}
