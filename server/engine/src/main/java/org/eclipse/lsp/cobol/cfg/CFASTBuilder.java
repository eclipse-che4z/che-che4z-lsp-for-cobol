/*
 * Copyright (c) 2021 Broadcom.
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
package org.eclipse.lsp.cobol.cfg;

import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.extendedapi.ExtendedApiResult;

/**
 * CF AST builder interface.
 */
public interface CFASTBuilder {
    /**
     * Build Abstract Syntax Tree with Control Flow related nodes.
     * @param rootNode of the application
     * @return CF ASTs wrapped in ExtendedApiResult
     */
    ExtendedApiResult build(Node rootNode);
}
