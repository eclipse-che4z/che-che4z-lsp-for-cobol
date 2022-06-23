/*
 * Copyright (c) 2020 Broadcom.
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
package org.eclipse.lsp.cobol.core.messages;

/**
 * Enum list of supported locale by application.
 */
public enum LocaleEnum {
    EN("en");

    private String label;
    LocaleEnum(String label) {
        this.label = label;
    }

    public String getLabel() {
        return label.toLowerCase();
    }
}
