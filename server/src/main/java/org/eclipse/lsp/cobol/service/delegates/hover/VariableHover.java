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
package org.eclipse.lsp.cobol.service.delegates.hover;

import com.google.common.collect.ImmutableList;
import com.google.inject.Singleton;
import lombok.NonNull;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.variables.Variable;
import org.eclipse.lsp.cobol.core.semantics.outline.RangeUtils;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.delegates.completions.DocumentationUtils;
import org.eclipse.lsp4j.Hover;
import org.eclipse.lsp4j.MarkedString;
import org.eclipse.lsp4j.TextDocumentPositionParams;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

import javax.annotation.Nullable;
import java.util.Collection;

/** The class provides hover information for variables. */
@Singleton
public class VariableHover implements HoverProvider {
  @Nullable
  @Override
  public Hover getHover(
      @Nullable CobolDocumentModel document, @NonNull TextDocumentPositionParams position) {
    if (document == null) return null;
    Variable variable =
        findVariableByPosition(document.getAnalysisResult().getVariables(), position);
    if (variable == null) return null;
    return createHoverInfo(variable);
  }

  private Hover createHoverInfo(Variable variable) {
    return new Hover(
        ImmutableList.of(
            Either.forRight(
                // Hover coloring didn't work if the language is "COBOL" (our language ID)
                new MarkedString("cobol", DocumentationUtils.collectDescription(variable)))));
  }

  private static Variable findVariableByPosition(
      Collection<Variable> variables, TextDocumentPositionParams position) {
    for (Variable variable : variables)
      if (RangeUtils.isInside(position, variable.getDefinition().toLocation())
          || variable.getUsages().stream()
              .map(Locality::toLocation)
              .anyMatch(location -> RangeUtils.isInside(position, location))) return variable;
    return null;
  }
}
