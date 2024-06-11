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
package org.eclipse.lsp.cobol.cst.base;

import java.util.ArrayList;
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
     * Restore suorce code of the node.
     * @return source code string.
     */
    String toText();

    /**
     * List of all nodes from the current one (this) children.
     * @param clazz Node class to filter by
     * @return a list of clazz nodes
     * @param <T> - node class
     */
    default <T extends CstNode> List<T> list(Class<T> clazz) {
        List<T> result = new ArrayList<>();
        for (CstNode child : getChildren()) {
            if (clazz.isInstance(child)) {
                result.add((T) child);
            }
            result.addAll(child.list(clazz));
        }
        return result;
    }
}
