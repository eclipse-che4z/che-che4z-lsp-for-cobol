/*
 * Copyright (c) 2023 Broadcom.
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
package org.openmainframe.cobol.dialects.cobolCheck;

import lombok.Getter;
import org.antlr.v4.runtime.BaseErrorListener;
import org.eclipse.lsp.cobol.common.error.SyntaxError;

import java.util.ArrayList;
import java.util.List;

/** This error listener registers syntax errors found by dialect parser. */
public class DialectParserListener extends BaseErrorListener {
    private final String uri;

    @Getter
    private final List<SyntaxError> errors = new ArrayList<>();

    DialectParserListener(String uri) {
        this.uri = uri;
    }
}
