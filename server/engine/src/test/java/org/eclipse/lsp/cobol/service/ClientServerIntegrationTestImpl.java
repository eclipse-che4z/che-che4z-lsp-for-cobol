/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.service;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp.cobol.service.delegates.validations.LanguageEngineFacade;
import org.eclipse.lsp.cobol.service.delegates.validations.SourceInfoLevels;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;

/** The class is to override the actual preprocessor and redirect to usecase engine preprocessor.
 * TODO: It requires further refactoring as it is for clientServerIntegration test specifically.
 * */
public class ClientServerIntegrationTestImpl implements LanguageEngineFacade {
  @Override
  public AnalysisResult analyze(String uri, String text, AnalysisConfig analysisConfig) {
    final String copybook1 = "       COPY {~CPYBK1}.";
    final String copybook2 = "       COPY {~CPYBK2}.";

    return UseCaseEngine.runTest(
        text,
        ImmutableList.of(new CobolText("CPYBK1", copybook1), new CobolText("CPYBK2", copybook2)),
        ImmutableMap.of(
            "1",
            new Diagnostic(
                new Range(),
                "Recursive copybook declaration for: CPYBK1",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText()),
            "2",
            new Diagnostic(
                new Range(),
                "Recursive copybook declaration for: CPYBK2",
                DiagnosticSeverity.Error,
                SourceInfoLevels.ERROR.getText())));
  }
}
