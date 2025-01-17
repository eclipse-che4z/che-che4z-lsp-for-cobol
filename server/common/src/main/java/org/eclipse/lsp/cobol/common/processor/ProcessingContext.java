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
package org.eclipse.lsp.cobol.common.processor;

import com.google.gson.JsonElement;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.symbols.VariableAccumulator;

import java.lang.reflect.Modifier;
import java.util.*;

/**
 * AST processing context. Stores the state of processing progress.
 */
@Data
@AllArgsConstructor
public class ProcessingContext {
    private final Map<
        ProcessingPhase,
            List<Map.Entry<Class<? extends Node>, List<Processor<? extends Node>>>>>
            processors = new HashMap<>();

    final List<SyntaxError> errors;
    final VariableAccumulator variableAccumulator;
    private final CompilerDirectiveContext compilerDirectiveContext;
    private final Map<String, JsonElement> dialectsConfig;

    private final LinkedList<ProgramNode> currentProgramNodeStack = new LinkedList<>();

    public ProcessingContext(List<SyntaxError> errors, VariableAccumulator variableAccumulator, Map<String, JsonElement> dialectsConfig) {
        this(errors, variableAccumulator, new CompilerDirectiveContext(), dialectsConfig);
    }

    public ProgramNode getCurrentProgramNode() {
        return currentProgramNodeStack.peek();
    }

    /**
     * Register node type processor
     *
     * @param processorDesc Processor descriptor.
     */
    public void register(ProcessorDescription processorDesc) {
        List<Map.Entry<Class<? extends Node>, List<Processor<? extends Node>>>> ps = processors.computeIfAbsent(processorDesc.getPhase(), v -> new ArrayList<>());
        for (Map.Entry<Class<? extends Node>, List<Processor<? extends Node>>> pair : ps) {
            if (pair.getKey().isAssignableFrom(processorDesc.getNodeClass())
                    || processorDesc.getNodeClass().isAssignableFrom(pair.getKey())) {
                if(pair.getValue().contains(processorDesc.processor)) {
                    throw new RuntimeException("Processor " + processorDesc.getProcessor().getClass().getName()
                            + " register twice: for classes " + pair.getKey().getName() + " and " + processorDesc.getNodeClass().getName()
                            + " in " + processorDesc.getPhase() + " phase");
                }
            }
            if (pair.getKey().equals(processorDesc.getNodeClass())) {
                pair.getValue().add(processorDesc.processor);
                return;
            }
        }
        ArrayList<Processor<? extends Node>> pList = new ArrayList<>();
        pList.add(processorDesc.processor);
        ps.add(new AbstractMap.SimpleEntry<>(processorDesc.getNodeClass(), pList));
    }

    /**
     * Register node type processor
     * @param phase processing phase
     * @param nodeClass nodes of this class will be processed by the processor
     * @param processor processor instance to use
     */
    public void register(ProcessingPhase phase, Class<? extends Node> nodeClass, Processor<? extends Node> processor) {
        register(new ProcessorDescription(nodeClass, phase, processor));
    }
}
