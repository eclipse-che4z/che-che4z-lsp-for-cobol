/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.dialects;

import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.TextTransformations;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Text Transformation tests
 */
public class TestTextTransformations {
    @Test
    void replace() {
        String text = ""
                + "1: abcd\n"
                + "2: TEST\n";
        TextTransformations tt = new TextTransformations(text, "https://example.com/text1.txt");

        tt.replace(Locality.builder()
                .range(new Range(
                        new Position(2, 4),
                        new Position(2, 8)))
                .build(), "1234");
        assertEquals("1: abcd\n2: 1234\n", tt.calculateExtendedText());
    }
}
