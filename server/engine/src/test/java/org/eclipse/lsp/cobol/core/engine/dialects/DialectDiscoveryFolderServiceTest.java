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
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.core.engine.dialects;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * Test for DialectDiscoveryFolderService
 */
class DialectDiscoveryFolderServiceTest {
  @Test
  void test() {
    WorkingFolderService workingFolderService = mock(WorkingFolderService.class);
    when(workingFolderService.getFilenames(any())).thenReturn(ImmutableList.of("dialect-test.jar"));

    DialectDiscoveryFolderService service = new DialectDiscoveryFolderService(workingFolderService);
    List<CobolDialect> dialectList = service.loadDialects(mock(CopybookService.class), mock(MessageService.class));
    assertEquals(0, dialectList.size());
  }
}
