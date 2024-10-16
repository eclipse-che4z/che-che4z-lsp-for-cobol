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
package org.eclipse.lsp.cobol.common;

import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Value;
import org.eclipse.lsp.cobol.common.model.Uri;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.symbols.SymbolTable;
import org.eclipse.lsp.cobol.common.model.tree.RootNode;
import org.eclipse.lsp4j.Diagnostic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * This class represents a semantic context of the analysed document. It contains a map of {@link
 * Diagnostic} grouped by related documents, all the
 */
@Value
@Builder(toBuilder = true)
public class AnalysisResult {
  public static final AnalysisResult EMPTY = AnalysisResult.builder().build();
  @Builder.Default Map<Uri, List<Diagnostic>> diagnostics = new HashMap<>();
  @Builder.Default RootNode rootNode = new RootNode();
  @EqualsAndHashCode.Exclude @Builder.Default Map<String, SymbolTable> symbolTableMap = new HashMap<>();
}
