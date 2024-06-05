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
package org.eclipse.lsp.cobol.implicitDialects.sql.node;

import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableType;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableWithLevelNode;

/**
 * These are sql host variables as defined at https://www.ibm.com/docs/en/db2-for-zos/12?topic=v-host-variables
 */
public class SqlHostVariable extends VariableWithLevelNode {
    public SqlHostVariable(String name, Locality location) {
        super(location, 1, name, false, VariableType.ELEMENTARY_ITEM, false);
    }

    @Override
    protected String getVariableDisplayString() {
        return getFormattedSuffix() + ".";
    }
}
