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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.service.mocks;

import com.broadcom.lsp.domain.cobol.event.api.EventObserver;
import com.broadcom.lsp.domain.cobol.event.model.DataEvent;
import com.ca.lsp.cobol.service.CopybookService;

import java.io.IOException;

/**
 * This interface define the responsability for a mock class used during the
 * com.ca.lsp.cobol.positive.PositiveTest suite
 */
public interface MockCopybookService extends CopybookService, EventObserver<DataEvent> {
  void setCopybooks(CopybooksMock copybooksMock);

  String getContentByCopybookName(String copybookName) throws IOException;
}
