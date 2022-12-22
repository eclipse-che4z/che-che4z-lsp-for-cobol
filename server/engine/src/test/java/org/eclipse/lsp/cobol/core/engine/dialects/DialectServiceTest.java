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
import org.eclipse.lsp.cobol.common.DialectRegistryItem;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.mapping.ExtendedSource;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.mockito.Mockito.*;

/**
 * Test for DialectService
 */
class DialectServiceTest {

  DialectService dialectService;
  DialectDiscoveryService ddService;
  CopybookService copybookService;
  MessageService messageService;

  @BeforeEach
  void init() {
    ddService = mock(DialectDiscoveryService.class);
    copybookService = mock(CopybookService.class);
    messageService = mock(MessageService.class);
    when(ddService.loadDialects(copybookService, messageService)).thenReturn(ImmutableList.of());

    dialectService = new DialectService(ddService, copybookService, messageService);
  }

  @Test
  void testConstructor() {
    verify(ddService, times(1)).loadDialects(copybookService, messageService);
  }

  @Test
  void testUpdateDialects() {
    DialectProcessingContext context = mock(DialectProcessingContext.class);
    when(context.getExtendedSource()).thenReturn(mock(ExtendedSource.class));

    ResultWithErrors<DialectOutcome> outcome = mock(ResultWithErrors.class);
    when(outcome.unwrap(any())).thenReturn(new DialectOutcome(ImmutableList.of(), context));

    CobolDialect dialect = mock(CobolDialect.class);
    when(dialect.getName()).thenReturn("dialect");
    when(dialect.processText(context)).thenReturn(outcome);

    List<DialectRegistryItem> dialectRegistry = ImmutableList.of(new DialectRegistryItem(dialect.getName(), "path", "", "extensionId"));
    when(ddService.loadDialects("path", copybookService, messageService)).thenReturn(ImmutableList.of(dialect));

    dialectService.updateDialects(dialectRegistry);
    dialectService.process(ImmutableList.of("dialect"), context);

    verify(dialect, times(1)).extend(context);
    verify(dialect, times(1)).processText(context);
  }
}
