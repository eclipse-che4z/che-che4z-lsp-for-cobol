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

import org.antlr.v4.runtime.IntStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Recognizer;

/** Help {@link org.antlr.v4.runtime.ANTLRErrorListener} to identify a warning error */
public class WarningRecognitionException extends RecognitionException {
  public WarningRecognitionException(
      Recognizer<?, ?> recognizer, IntStream input, ParserRuleContext ctx) {
    super(recognizer, input, ctx);
  }

  public WarningRecognitionException() {
    super(null, null, null);
  }
}
