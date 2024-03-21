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
package org.eclipse.lsp.cobol.cli;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Test for {@link Cli}
 */
@ExtendWith(MockitoExtension.class)
class CliTest {

    @Test
    void testCall_srcNull() {
        Cli cli = new Cli();
        Integer actual;
        try {
        actual = cli.call();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        assertEquals(1, actual);
    }
}
