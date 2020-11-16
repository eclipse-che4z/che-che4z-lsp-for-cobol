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

package com.broadcom.lsp.cobol.service.mocks;

import com.broadcom.lsp.cobol.domain.databus.api.DataBusBroker;
import com.broadcom.lsp.cobol.service.CobolTextDocumentService;
import com.broadcom.lsp.cobol.service.delegates.actions.CodeActions;
import com.broadcom.lsp.cobol.service.delegates.communications.Communications;
import com.broadcom.lsp.cobol.service.delegates.completions.Completions;
import com.broadcom.lsp.cobol.service.delegates.formations.Formations;
import com.broadcom.lsp.cobol.service.delegates.references.Occurrences;
import com.broadcom.lsp.cobol.service.delegates.validations.LanguageEngineFacade;
import com.broadcom.lsp.cobol.service.utils.CustomThreadPoolExecutorService;
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

  /** Give a dummy {@link CobolTextDocumentService} with mocked attributes for testing. */
  protected CobolTextDocumentService getMockedTextDocumentService() {
    return CobolTextDocumentService.builder()
        .communications(communications)
        .engine(engine)
        .dataBus(broker)
        .completions(completions)
        .actions(actions)
        .occurrences(occurrences)
        .formations(formations)
        .executors(new CustomThreadPoolExecutorService(1, 1, 60, 1))
        .build();
  }
}
