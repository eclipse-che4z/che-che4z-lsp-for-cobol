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
package org.eclipse.lsp.cobol.core.engine.processor;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.Node;

import java.util.*;
import java.util.function.BiConsumer;

/**
 * AST processing context. Stores the state of processing progress.
 */
@Data
@AllArgsConstructor
public class ProcessingContext {
    private final Map<
            ProcessingPhase,
            Map<Class<? extends Node>, List<BiConsumer<? extends Node, ProcessingContext>>>>
            processors = new HashMap<>();

    final List<SyntaxError> errors;

    /**
     * Register node type processor
     *
     * @param processorDesc Processor descriptor.
     * @param <T> Specific node type
     */
    public <T extends Node> void register(ProcessorDescription processorDesc) {
        processors
                .computeIfAbsent(processorDesc.getPhase(), v -> new LinkedHashMap<>())
                .computeIfAbsent(processorDesc.getNodeClass(), v -> new ArrayList<>())
                .add(processorDesc.getProcessor());
    }
}
