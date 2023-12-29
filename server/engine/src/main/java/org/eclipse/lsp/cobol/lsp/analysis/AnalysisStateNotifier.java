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

import java.util.List;
import org.eclipse.lsp.cobol.lsp.SourceUnitGraph;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;

/**
 * Contract for the notifier which notifies the document analysis state to all registered {@link AnalysisStateListener}
 */
public interface AnalysisStateNotifier {
    /**
     * registers the listeners, which are interested in the {@link AnalysisStateListener}
     * @param analysisStateListeners
     */
    void register(List<AnalysisStateListener> analysisStateListeners);

    /**
     * notify all listeners the analysis state
     * @param state
     * @param model
     * @param eventSource
     */
    void notifyAllListeners(AnalysisState state, CobolDocumentModel model, SourceUnitGraph.EventSource eventSource);
}
