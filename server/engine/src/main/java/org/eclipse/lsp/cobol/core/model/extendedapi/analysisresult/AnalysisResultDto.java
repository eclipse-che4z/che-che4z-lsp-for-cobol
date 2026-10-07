/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.core.model.extendedapi.analysisresult;

import java.util.List;
import java.util.Map;
import lombok.Value;
import org.eclipse.lsp4j.Diagnostic;

/**
 * Serialization-safe projection of {@link org.eclipse.lsp.cobol.common.AnalysisResult} returned by
 * the extended/analysisResult request.
 */
@Value
public class AnalysisResultDto {
  Map<String, List<Diagnostic>> diagnostics;
  List<ProgramDto> programs;
}
