/*
 * Copyright (c) 2019 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 *
 */
package com.ca.lsp.cobol.positive;

import java.util.List;

public interface CobolTextRegistry {
    /** @return all the Cobol files for positive tests */
    List<CobolText> getPositives();

    /** @return all the Cobol files for negative tests */
    List<CobolText> getNegatives();

    /** @return all the Cobol files for copybooks */
    List<CobolText> getCopybooks();
}
