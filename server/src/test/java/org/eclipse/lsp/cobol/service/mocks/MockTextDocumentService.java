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

import org.eclipse.lsp.cobol.domain.databus.api.DataBusBroker;
import org.eclipse.lsp.cobol.service.CFASTBuilderImpl;
import org.eclipse.lsp.cobol.service.CobolLSPServerStateService;
import org.eclipse.lsp.cobol.service.CobolTextDocumentService;
import org.eclipse.lsp.cobol.service.SettingsService;
import org.eclipse.lsp.cobol.service.delegates.actions.CodeActions;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp.cobol.service.delegates.completions.Completions;
import org.eclipse.lsp.cobol.service.delegates.formations.Formations;
import org.eclipse.lsp.cobol.service.delegates.hover.HoverProvider;
import org.eclipse.lsp.cobol.service.delegates.references.Occurrences;
import org.eclipse.lsp.cobol.service.delegates.validations.LanguageEngineFacade;
import org.eclipse.lsp.cobol.service.utils.CustomThreadPoolExecutorService;
import org.eclipse.lsp.cobol.service.utils.TestThreadPoolExecutor;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

/** Give a dummy {@link CobolTextDocumentService} with mocked attributes for testing. */
@ExtendWith(MockitoExtension.class)
public class MockTextDocumentService {

  @Mock protected Communications communications;
  @Mock protected LanguageEngineFacade engine;
  @Mock protected DataBusBroker broker;
  @Mock protected Completions completions;
  @Mock protected CodeActions actions;
  @Mock protected Occurrences occurrences;
  @Mock protected Formations formations;
  @Mock protected HoverProvider hoverProvider;

  /**
   * Give a dummy {@link CobolTextDocumentService} with mocked attributes for testing. All tasks run
   * synchronously.
   */
  protected CobolTextDocumentService getMockedTextDocumentServiceUsingSameThread() {
    return CobolTextDocumentService.builder()
        .communications(communications)
        .engine(engine)
        .dataBus(broker)
        .completions(completions)
        .actions(actions)
        .occurrences(occurrences)
        .formations(formations)
        .executors(new TestThreadPoolExecutor())
        .cfastBuilder(new CFASTBuilderImpl())
        .disposableLSPStateService(new CobolLSPServerStateService())
        .hoverProvider(hoverProvider)
        .build();
  }

  /**
   * Give a dummy {@link CobolTextDocumentService} with mocked attributes for testing. Tasks run in
   * the separate thread.
   */
  protected CobolTextDocumentService getMockedTextDocumentServiceUsingSeparateThread() {
    return CobolTextDocumentService.builder()
        .communications(communications)
        .engine(engine)
        .dataBus(broker)
        .completions(completions)
        .actions(actions)
        .occurrences(occurrences)
        .formations(formations)
        .disposableLSPStateService(new CobolLSPServerStateService())
        .executors(new CustomThreadPoolExecutorService(1, 1, 60, 1))
        .hoverProvider(hoverProvider)
        .build();
  }
}
