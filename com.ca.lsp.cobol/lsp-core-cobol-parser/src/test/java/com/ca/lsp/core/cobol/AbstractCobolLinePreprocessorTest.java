/*
 * Copyright (c) 2019 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.core.cobol;

import com.ca.lsp.core.cobol.params.impl.CobolParserParamsImpl;
import com.ca.lsp.core.cobol.parser.listener.PreprocessorListener;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;
import com.ca.lsp.core.cobol.preprocessor.sub.line.reader.impl.CobolLineReaderImpl;

import java.util.ArrayList;
import java.util.List;

import static com.ca.lsp.core.cobol.preprocessor.CobolSourceFormat.FIXED;
import static org.junit.Assert.assertEquals;

public abstract class AbstractCobolLinePreprocessorTest {

  protected PreprocessorListener listener;

  public void eraseListener() {
    listener = new PreprocessorListener(new ArrayList<>());
  }

  protected List<CobolLine> processText(String text) {
    CobolLineReaderImpl reader = new CobolLineReaderImpl(listener, null);
    return reader.processLines(text, FIXED, new CobolParserParamsImpl());
  }

  protected String reduceLines(List<String> lines) {
    return lines.stream().reduce((x, y) -> x + "\r\n" + y).get();
  }

  protected void checkNoErrorsFound() {
    assertEquals(0, listener.getErrorsPipe().size());
  }
}
