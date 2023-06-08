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
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InOrder;

import java.net.URI;
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

  private CobolDialect configureDialect(DialectProcessingContext context, String name) {
    ResultWithErrors<DialectOutcome> outcome = mock(ResultWithErrors.class);
    when(outcome.unwrap(any())).thenReturn(new DialectOutcome(ImmutableList.of(), context));

    CobolDialect dialect = mock(CobolDialect.class);
    when(dialect.getName()).thenReturn(name);
    when(dialect.processText(context)).thenReturn(outcome);
    return dialect;
  }

  @Test
  void testConstructor() {
    verify(ddService, times(1)).loadDialects(copybookService, messageService);
  }

  @Test
  void testUpdateDialects() {
    DialectProcessingContext context = mock(DialectProcessingContext.class);
    when(context.getExtendedDocument()).thenReturn(mock(ExtendedDocument.class));

    CobolDialect dialect = configureDialect(context, "dialect");

    when(ddService.loadDialects(URI.create(""), copybookService, messageService)).thenReturn(ImmutableList.of(dialect));
    List<DialectRegistryItem> dialectRegistry = ImmutableList.of(new DialectRegistryItem(dialect.getName(), URI.create(""), "", "extensionId"));
    dialectService.updateDialects(dialectRegistry);

    dialectService.process(ImmutableList.of("dialect"), context);

    verify(dialect, times(1)).extend(context);
    verify(dialect, times(1)).processText(context);
    verify(ddService, times(1))
        .registerExecuteCommandCapabilities(
            dialect.getDialectExecuteCommandCapabilities(), dialect.getName());
    verify(ddService, times(1))
        .registerDialectCodeActionProviders(dialect.getDialectCodeActionProviders());
  }

  @Test
  void testDialectOrder() {
    DialectProcessingContext context = mock(DialectProcessingContext.class);
    when(context.getExtendedDocument()).thenReturn(mock(ExtendedDocument.class));

    CobolDialect dialect1 = configureDialect(context, "1");
    CobolDialect dialect2 = configureDialect(context, "2");
    when(ddService.loadDialects(URI.create(""), copybookService, messageService)).thenReturn(ImmutableList.of(dialect1, dialect2));

    List<DialectRegistryItem> dialectRegistry = ImmutableList.of(
        new DialectRegistryItem(dialect1.getName(), URI.create(""), "", "extensionId"),
        new DialectRegistryItem(dialect2.getName(), URI.create(""), "", "extensionId")
        );

    InOrder inOrder = inOrder(dialect1, dialect2);

    dialectService.updateDialects(dialectRegistry);

    dialectService.process(ImmutableList.of("1", "2"), context);
    inOrder.verify(dialect1).extend(context);
    inOrder.verify(dialect2).extend(context);

    dialectService.process(ImmutableList.of("2", "1"), context);
    inOrder.verify(dialect2).extend(context);
    inOrder.verify(dialect1).extend(context);
  }
}
