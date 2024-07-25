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
package org.eclipse.lsp.cobol.common.copybook;

import lombok.Builder;
import lombok.Value;

import java.util.Optional;

import static org.eclipse.lsp.cobol.common.copybook.CopybookId.COBOL;

/**
 * This value class represents a copybook DTO with name  and dialect info. Display name is the name
 * as it is specified in the original COPY statement. Dialect type is the type of the dialect the
 * copybook statement belongs to.
 */
@Value
public class CopyBookDTO {
    String name;
    String dialect;
    public CopyBookDTO(CopybookName copybookName) {
        this.name = copybookName.getDisplayName();
        this.dialect = Optional.ofNullable(copybookName.getDialectType()).orElse(COBOL);
    }
}
