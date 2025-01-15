/*
 * Copyright (c) 2025 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.symbols;

import com.google.common.collect.ImmutableList;
import lombok.Getter;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp4j.Location;

import java.util.ArrayList;
import java.util.List;

/**
 * Information related to function definition and references
 */
public final class FunctionInfo {
    @Getter
    private final ProgramNode programNode;
    private final List<Location> usage = new ArrayList<>();

    @Getter
    private final boolean isImplicit;

    public FunctionInfo() {
        this(null, false);
    }

    public FunctionInfo(ProgramNode programNode) {
        this(programNode, false);
    }

    public FunctionInfo(ProgramNode programNode, boolean isImplicit) {
        this.programNode = programNode;
        this.isImplicit = isImplicit;
    }

    /**
     * Retrieve definition location
     *
     * @return Definitions
     */
    public List<Location> getDefinition() {
        if (programNode == null)
            return ImmutableList.of();
        else
            return ImmutableList.of(programNode.getLocality().toLocation());
    }

    /**
     * Retrieve reference locations
     *
     * @return References
     */
    public List<Location> getReferences() {
        return usage;
    }
}
