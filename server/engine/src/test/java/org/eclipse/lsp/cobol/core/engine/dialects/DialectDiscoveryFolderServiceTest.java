/*
 * Copyright (c) 2022 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.core.engine.dialects;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

import java.net.URI;
import java.util.Collections;
import java.util.List;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.service.delegates.actions.CodeActions;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp.cobol.service.delegates.communications.ServerCommunications;
import org.junit.jupiter.api.Test;

/** Test for DialectDiscoveryFolderService */
class DialectDiscoveryFolderServiceTest {
  @Test
  void testLoadDialects_noImplicitDiscovery() {
    Communications communications = mock(ServerCommunications.class);
    CodeActions actions = mock(CodeActions.class);

    DialectDiscoveryFolderService service =
        new DialectDiscoveryFolderService(communications, actions);
    List<CobolDialect> dialectList =
        service.loadDialects(mock(CopybookService.class), mock(MessageService.class));
    assertEquals(0, dialectList.size());
  }

  @Test
  void testLoadDialects_specifiedPath() {
    Communications communications = mock(ServerCommunications.class);
    CodeActions actions = mock(CodeActions.class);

    DialectDiscoveryFolderService service =
        new DialectDiscoveryFolderService(communications, actions);
    List<CobolDialect> dialectList =
        service.loadDialects(
            URI.create(""), mock(CopybookService.class), mock(MessageService.class));
    assertEquals(0, dialectList.size());
  }

  @Test
  void testRegisterExecuteCommandCapabilities() {
    Communications communications = mock(ServerCommunications.class);
    CodeActions actions = mock(CodeActions.class);
    DialectDiscoveryFolderService service =
        new DialectDiscoveryFolderService(communications, actions);
    service.registerExecuteCommandCapabilities(Collections.emptyList(), "test");
    verify(communications).registerExecuteCommandCapability(Collections.emptyList(), "test");
  }

  @Test
  void testUnRegisterExecuteCommandCapabilities() {
    Communications communications = mock(ServerCommunications.class);
    CodeActions actions = mock(CodeActions.class);
    DialectDiscoveryFolderService service =
        new DialectDiscoveryFolderService(communications, actions);
    service.unregisterExecuteCommandCapabilities("test");
    verify(communications).unregisterExecuteCommandCapability("test");
  }

  @Test
  void testRegisterDialectCodeActionProviders() {
    Communications communications = mock(ServerCommunications.class);
    CodeActions actions = mock(CodeActions.class);
    DialectDiscoveryFolderService service =
        new DialectDiscoveryFolderService(communications, actions);
    service.registerDialectCodeActionProviders(Collections.emptyList());
    verify(actions).registerNewProviders(Collections.emptyList());
  }
}
