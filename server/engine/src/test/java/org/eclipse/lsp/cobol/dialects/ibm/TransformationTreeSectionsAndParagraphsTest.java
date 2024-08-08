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
package org.eclipse.lsp.cobol.dialects.ibm;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * Paragraphs and section nesting test
 */
class TransformationTreeSectionsAndParagraphsTest {
    private static final String TEXT =
              "       ID DIVISION.\n"
            + "       PROGRAM-ID. SAP1.\n"
            + "       PROCEDURE DIVISION.\n"
            + "       {@*SECT1} SECTION.\n"
            + "       {#*PAR}.\n"
            + "           PERFORM {#PAR} OF SECT2.\n"
            + "       COPY {~AAA}.";
    private static final String TEXT_AAA = "\n\n\n\n       {@*SECT2} SECTION.\n"
            + "       {#*PAR}.\n";

    @Test
    void test() {
        UseCaseEngine.runTest(TEXT, ImmutableList.of(new CobolText("AAA", TEXT_AAA)), ImmutableMap.of());
    }
}
