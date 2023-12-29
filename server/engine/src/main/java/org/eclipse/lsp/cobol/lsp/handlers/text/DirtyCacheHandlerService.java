/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.lsp.handlers.text;

import com.google.inject.Inject;
import java.util.concurrent.atomic.AtomicBoolean;
import org.eclipse.lsp.cobol.lsp.*;

/** Service to handle dirty cache */
public class DirtyCacheHandlerService {
  private final AtomicBoolean cacheIsDirty = new AtomicBoolean(false);
  private final LspMessageBroker lspMessageBroker;
  private final AsyncAnalysisService asyncAnalysisService;

  @Inject
  public DirtyCacheHandlerService(
          LspMessageBroker lspMessageBroker, AsyncAnalysisService asyncAnalysisService) {
    this.lspMessageBroker = lspMessageBroker;
    this.asyncAnalysisService = asyncAnalysisService;
  }

  /** Handle dirty cache by publishing an event to the queue. */
  public void handleDirtyCache() {
    cacheIsDirty.compareAndSet(false, true);
    lspMessageBroker.notify(getLspEvent()); // create an event to trigger re analysis
  }

  private LspNotification getLspEvent() {
    return () -> {
      cacheIsDirty.compareAndSet(true, false);
      asyncAnalysisService.reanalyseOpenedPrograms();
    };
  }
}
