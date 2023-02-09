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
package org.eclipse.lsp.cobol.dialects.daco.nodes;

import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.dialects.daco.DaCoDialect;

import static org.eclipse.lsp.cobol.common.model.NodeType.CUSTOM;

/**
 * Copy-from statement node
 */
@ToString(callSuper = true)
@Getter
public class DaCoCopyFromNode extends Node {
    String newSuffix;
    private int level;
    String prototypeName;
    public DaCoCopyFromNode(Locality location, String prototypeName, String newSuffix, int level) {
        super(location, CUSTOM, DaCoDialect.NAME);
        this.prototypeName = prototypeName;
        this.newSuffix = newSuffix;
        this.level = level;
    }
}
