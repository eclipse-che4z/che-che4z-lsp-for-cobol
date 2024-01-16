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
 *    DAF Trucks NV – implementation of DaCo COBOL statements
 *    and DAF development standards
 *
 */
package org.eclipse.lsp.cobol.core.cst.base;

import org.eclipse.lsp.cobol.core.hw.GrammarRule;

import java.util.List;

/**
 * Concrete tree node interface.
 */
public interface CstNode {
    /**
     * Access to the list of children nodes.
     * @return the list of children nodes.
     */
    List<CstNode> getChildren();

    /**
     * Get the syntax rule associated with the node.
     * @return rule type.
     */
    GrammarRule getRule();

    /**
     * Restore suorce code of the node.
     * @return source code string.
     */
    String toText();
}
