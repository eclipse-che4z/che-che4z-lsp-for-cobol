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
package org.eclipse.lsp.cobol.lsp.events.notifications;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;

import org.eclipse.lsp.cobol.lsp.handlers.server.CancelProgressHandler;
import org.junit.jupiter.api.Test;

/** Test {@link CancelProgressNotification} */
class CancelProgressNotificationTest {
  @Test
  void test() throws InterruptedException {
    CancelProgressHandler handler = mock(CancelProgressHandler.class);
    CancelProgressNotification notification = new CancelProgressNotification("uri", handler);
    notification.execute();
    verify(handler).cancel("uri");
  }
}
