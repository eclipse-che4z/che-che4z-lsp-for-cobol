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

import com.ca.lsp.core.cobol.model.CopybookDefinition;
import com.ca.lsp.core.cobol.model.CopybookSemanticContext;
import lombok.Value;

import java.util.List;

@Value
public class SemanticContext {
  private CobolVariableContext variables = new CobolVariableContext();
  private SubContext<String> paragraphs = new CobolNamedContext();
  private SubContext<String> copybooks = new CobolNamedContext();
  private List<CopybookDefinition> copybookUsageTracker;

  public void merge(CopybookSemanticContext semanticContext) {
    variables.merge(semanticContext.getName(), semanticContext.getContext().getVariables());
    paragraphs.merge(semanticContext.getName(), semanticContext.getContext().getParagraphs());
    copybooks.merge(semanticContext.getName(), semanticContext.getContext().getCopybooks());
  }
}
