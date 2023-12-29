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
package org.eclipse.lsp.cobol.lsp.analysis;

import org.eclipse.lsp.cobol.lsp.SourceUnitGraph;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;

/**
 * Contract for the listeners which would register to {@link AnalysisStateNotifier} .
 */
public interface AnalysisStateListener {
    /**
     * Notify the analysis state to all registered {@link AnalysisStateNotifier} listeners
     * @param state
     * @param model
     * @param eventSource
     */
    void notifyState(AnalysisState state, CobolDocumentModel model, SourceUnitGraph.EventSource eventSource);
}
