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
package org.eclipse.lsp.cobol.core;

import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.CobolLine;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReader;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReaderImpl;

import java.util.Collections;
import java.util.List;

import static org.mockito.ArgumentMatchers.matches;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

public abstract class AbstractCobolLinePreprocessorTest {

  protected ResultWithErrors<List<CobolLine>> processText(String text) {
    MessageService mockMessageService = mock(MessageService.class);
    CobolLineReader reader =
        new CobolLineReaderImpl(
            (line, uri, lineNumber) -> new ResultWithErrors<>(line, Collections.emptyList()),
            mockMessageService);
    when(mockMessageService.getMessage(matches("CobolLineReaderImpl.incorrectLineFormat")))
        .thenReturn("Unexpected indicator area content");
    when(mockMessageService.getMessage(matches("CobolLineReaderImpl.longLineMsg")))
        .thenReturn("Source text cannot go past column 80");
    return reader.processLines("", text);
  }

  protected String reduceLines(List<String> lines) {
    return lines.stream().reduce((x, y) -> x + "\r\n" + y).orElse("");
  }
}
