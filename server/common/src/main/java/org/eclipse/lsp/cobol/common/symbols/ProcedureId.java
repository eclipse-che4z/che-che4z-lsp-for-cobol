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
package org.eclipse.lsp.cobol.common.symbols;

import lombok.NonNull;
import lombok.ToString;
import lombok.Value;

/**
 * The class represents procedure identification in COBOL program.
 */
@Value
@ToString
public class ProcedureId {
    String sectionName;
    String paragraphName;

    public ProcedureId(String sectionName, String paragraphName) {
        this.sectionName = sectionName !=null ? sectionName.toUpperCase() : null;
        this.paragraphName = paragraphName !=null ? paragraphName.toUpperCase() : null;
    }
    /**
     * Check if the code block is a procedure section.
     *
     * @return true the code block is a procedure section
     */
    public boolean isSection() {
        return sectionName != null && paragraphName == null;
    }
}
