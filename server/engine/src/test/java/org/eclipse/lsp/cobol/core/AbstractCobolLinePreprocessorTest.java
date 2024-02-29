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

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.matches;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.List;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.core.preprocessor.CobolLine;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReader;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReaderImpl;
import org.eclipse.lsp.cobol.service.settings.layout.CobolProgramLayout;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;

public abstract class AbstractCobolLinePreprocessorTest {

  protected ResultWithErrors<List<CobolLine>> processText(String text) {
    MessageService mockMessageService = mock(MessageService.class);
    CodeLayoutStore layoutStore = mock(CodeLayoutStore.class);
    when(layoutStore.getCodeLayout()).thenReturn(new CobolProgramLayout());

    CobolLineReader reader = new CobolLineReaderImpl(mockMessageService, layoutStore);
    when(mockMessageService.getMessage(matches("CobolLineReaderImpl.incorrectLineFormat")))
        .thenReturn("Unexpected indicator area content");
    when(mockMessageService.getMessage(matches("CobolLineReaderImpl.longLineMsg"), any()))
        .thenReturn("Source text cannot go past column 80");
    return reader.processLines("", text);
  }

  protected ResultWithErrors<List<CobolLine>> processTextWithNoSequenceArea(String text) {
    MessageService mockMessageService = mock(MessageService.class);
    CodeLayoutStore layoutStore = mock(CodeLayoutStore.class);
    when(layoutStore.getCodeLayout()).thenReturn(new CobolProgramLayout(0, 1, 4, 61, 8));

    CobolLineReader reader = new CobolLineReaderImpl(mockMessageService, layoutStore);
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
