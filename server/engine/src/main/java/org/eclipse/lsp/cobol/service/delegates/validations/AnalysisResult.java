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
package org.eclipse.lsp.cobol.service.delegates.validations;

import lombok.Builder;
import lombok.Value;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.RootNode;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
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
  @Builder.Default Map<String, List<Diagnostic>> diagnostics = new HashMap<>();
  @Builder.Default Node rootNode = new RootNode(Locality.builder().build(), new CopybooksRepository());
}
