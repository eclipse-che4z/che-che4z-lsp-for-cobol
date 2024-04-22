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
package org.eclipse.lsp.cobol.lsp.handlers.server;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;

import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;
import org.junit.jupiter.api.Test;

/** Test {@link CancelProgressHandler} */
class CancelProgressHandlerTest {

  @Test
  void whenCancelIsCalled_properMethodIsInvoked() throws InterruptedException {
    AsyncAnalysisService asyncAnalysisService = mock(AsyncAnalysisService.class);
    CancelProgressHandler handler = new CancelProgressHandler(asyncAnalysisService);
    handler.cancel("test-uri");
    verify(asyncAnalysisService).cancelAnalysis("test-uri");
  }
}
