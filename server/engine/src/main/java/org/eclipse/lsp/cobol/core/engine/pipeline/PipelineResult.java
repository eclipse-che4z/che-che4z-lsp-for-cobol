/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.pipeline;

import lombok.RequiredArgsConstructor;
import lombok.Value;
import org.eclipse.lsp.cobol.core.engine.analysis.Timing;

import java.util.Map;

/**
 * A class to store the pipeline execution results
 */
@Value
@RequiredArgsConstructor
public class PipelineResult {
  Map<String, Timing> timings;
  StageResult<?> lastStageResult;
}
