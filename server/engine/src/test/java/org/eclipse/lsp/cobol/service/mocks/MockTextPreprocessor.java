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
package org.eclipse.lsp.cobol.service.mocks;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.mapping.ExtendedText;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;

/**
 * Mock Text Processor class
 */
public class MockTextPreprocessor implements TextPreprocessor {
  @Override
  public ResultWithErrors<ExtendedText> cleanUpCode(String documentUri, String cobolCode) {
    return new ResultWithErrors<>(new ExtendedText(cobolCode, documentUri), ImmutableList.of());
  }
}
