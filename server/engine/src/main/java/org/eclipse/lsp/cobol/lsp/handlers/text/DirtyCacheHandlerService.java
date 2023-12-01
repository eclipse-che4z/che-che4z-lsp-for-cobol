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

import com.google.common.collect.ImmutableList;
import com.google.inject.Inject;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import org.eclipse.lsp.cobol.lsp.*;

/** Service to handle dirty cache */
public class DirtyCacheHandlerService {
  private final AtomicBoolean cacheIsDirty = new AtomicBoolean(false);
  private final LspMessageDispatcher lspMessageDispatcher;
  private final AsyncAnalysisService asyncAnalysisService;

  @Inject
  public DirtyCacheHandlerService(
      LspMessageDispatcher lspMessageDispatcher, AsyncAnalysisService asyncAnalysisService) {
    this.lspMessageDispatcher = lspMessageDispatcher;
    this.asyncAnalysisService = asyncAnalysisService;
  }

  /** Handle dirty cache by publishing an event to the queue. */
  public void handleDirtyCache() {
    cacheIsDirty.compareAndSet(false, true);
    lspMessageDispatcher.publish(getLspEvent()); // create an event to trigger re analysis
  }

  private LspEvent<Object> getLspEvent() {
    return new LspEvent<Object>() {
      @Override
      public Object execute() {
        cacheIsDirty.compareAndSet(true, false);
        asyncAnalysisService.reanalyseOpenedPrograms();
        return null;
      }

      @Override
      public List<LspEventDependency> getDependencies() {
        return ImmutableList.of(() -> lspMessageDispatcher.queueSize() == 0, cacheIsDirty::get);
      }

      @Override
      public List<LspEventCancelCondition> getCancelConditions() {
        return ImmutableList.of(
            () -> lspMessageDispatcher.queueSizeForType(this.getClass()) > 0,
            () -> !cacheIsDirty.get());
      }
    };
  }
}
