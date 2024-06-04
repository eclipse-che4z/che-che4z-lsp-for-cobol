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
package org.eclipse.lsp.cobol.core.engine.analysis;

import java.util.*;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.benchmark.BenchmarkSession;
import org.eclipse.lsp.cobol.common.benchmark.BenchmarkSessionProvider;
import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;

/**
 * Contains related to analysis state
 */
@Slf4j
@Getter
@RequiredArgsConstructor
public class AnalysisContext implements BenchmarkSessionProvider {
  private @Setter ExtendedDocument extendedDocument;
  private final AnalysisConfig config;
  private final List<SyntaxError> accumulatedErrors = new ArrayList<>();
  private final BenchmarkSession benchmarkSession;
  private final String documentUri;
  private final String text;
  private final CobolLanguageId languageId;

  private @Setter List<Node> dialectNodes = new ArrayList<>();
  private @Setter CopybooksRepository copybooksRepository;

  public AnalysisContext(ExtendedDocument extendedDocument,
                         AnalysisConfig config,
                         BenchmarkSession benchmarkSession,
                         String documentUri,
                         String text,
                         CobolLanguageId languageId) {
    this.extendedDocument = extendedDocument;
    this.config = config;
    this.benchmarkSession = benchmarkSession;
    this.documentUri = documentUri;
    this.text = text;
    this.languageId = languageId;
  }
}
