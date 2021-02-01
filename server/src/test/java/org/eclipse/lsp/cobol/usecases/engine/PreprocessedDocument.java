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

package org.eclipse.lsp.cobol.usecases.engine;

import org.eclipse.lsp.cobol.positive.CobolText;
import lombok.Value;

import java.util.List;

/**
 * This class contains the result of the use-case preprocessing. Text and copybooks will be passed
 * to the actual Language Engine, and the testDAta will be used to assert the result.
 */
@Value
class PreprocessedDocument {
  private String text;
  private List<CobolText> copybooks;
  private TestData testData;
}
