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
package com.broadcom.lsp.cobol.service;

import com.broadcom.lsp.cobol.jrpc.CobolLanguageClient;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.concurrent.CompletableFuture;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

/**
 * This test checks the entry points of the {@link SubroutineServiceImpl} implementation.
 */
public class SubroutineServiceImplTest {
  private static final String NAME = "NAME";
  private static final String PRESENT_FILE = "existing";
  private static final String MISSING_FILE = "nonExisting";

  @Test
  void subroutinesUriCached() {
    CobolLanguageClient languageClient = mock(CobolLanguageClient.class);
    when(languageClient.resolveSubroutine(any()))
        .thenReturn(CompletableFuture.completedFuture("URI1"))
        .thenReturn(CompletableFuture.completedFuture("URI2"));

    SubroutineService subroutineService =
        new SubroutineServiceImpl(() -> languageClient, 3, 3, "HOURS");
    assertTrue(subroutineService.getNames().isEmpty());
    assertEquals("URI1", subroutineService.getUri(NAME).get());
    // second get returns the same cached object
    assertEquals("URI1", subroutineService.getUri(NAME).get());
    assertEquals(List.of(NAME), subroutineService.getNames());
    subroutineService.invalidateCache();
    assertTrue(subroutineService.getNames().isEmpty());
    assertEquals("URI2", subroutineService.getUri(NAME).get());

    verify(languageClient, times(2)).resolveSubroutine(NAME);
  }

  @Test
  void subroutinesCachedEmptyResult() {
    CobolLanguageClient languageClient = mock(CobolLanguageClient.class);
    when(languageClient.resolveSubroutine(PRESENT_FILE)).thenReturn(CompletableFuture.completedFuture("URI"));
    when(languageClient.resolveSubroutine(MISSING_FILE)).thenReturn(CompletableFuture.completedFuture(null));

    SubroutineService subroutineService =
        new SubroutineServiceImpl(() -> languageClient, 3, 3, "HOURS");
    assertEquals("URI", subroutineService.getUri(PRESENT_FILE).get());
    assertTrue(subroutineService.getUri(MISSING_FILE).isEmpty());
    // the service must use cache instead of language client
    assertTrue(subroutineService.getUri(MISSING_FILE).isEmpty());

    assertEquals(List.of(PRESENT_FILE), subroutineService.getNames());

    verify(languageClient, times(1)).resolveSubroutine(PRESENT_FILE);
    verify(languageClient, times(1)).resolveSubroutine(MISSING_FILE);
  }
}
