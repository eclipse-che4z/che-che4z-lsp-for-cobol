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

package org.eclipse.lsp.cobol.core.engine.directives.node;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.Node;

/**
 * Represents a Java-Callable which are only allowed before procedure section.
 */
@Getter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class JavaCallablePrecedureSectionNode extends Node {
    private final boolean isProcedureDivisionLine;
    public JavaCallablePrecedureSectionNode(Locality location, boolean isProcedureDivisionLine) {
    super(location, NodeType.CUSTOM);
        this.isProcedureDivisionLine = isProcedureDivisionLine;
    }
}
