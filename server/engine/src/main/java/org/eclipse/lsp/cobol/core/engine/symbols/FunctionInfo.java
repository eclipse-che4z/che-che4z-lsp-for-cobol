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
public class FunctionInfo {
    ProgramNode node;
    List<Location> usage = new ArrayList<>();

    @Getter
    boolean isImplicit;

    public FunctionInfo() {
    }

    public FunctionInfo(ProgramNode node) {
        this(node, false);
    }

    public FunctionInfo(ProgramNode node, boolean isImplicit) {
        this.node = node;
        this.isImplicit = isImplicit;
    }

    /**
     * Retrieve definition location
     *
     * @return Definitions
     */
    public List<Location> getDefinition() {
        if (node == null)
            return ImmutableList.of();
        else
            return ImmutableList.of(node.getLocality().toLocation());
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
