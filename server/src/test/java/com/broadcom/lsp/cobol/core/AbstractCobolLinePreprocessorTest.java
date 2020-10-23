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
package com.broadcom.lsp.cobol.core;

import com.broadcom.lsp.cobol.core.messages.MessageService;
import com.broadcom.lsp.cobol.core.model.CobolLine;
import com.broadcom.lsp.cobol.core.model.ResultWithErrors;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReader;
import com.broadcom.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReaderImpl;

import java.util.List;

import static org.mockito.Mockito.mock;

public abstract class AbstractCobolLinePreprocessorTest {

  protected ResultWithErrors<List<CobolLine>> processText(String text) {
    MessageService mockMessageService = mock(MessageService.class);
    CobolLineReader reader = new CobolLineReaderImpl(line -> line, mockMessageService);
    return reader.processLines("", text);
  }

  protected String reduceLines(List<String> lines) {
    return lines.stream().reduce((x, y) -> x + "\r\n" + y).orElse("");
  }
}
