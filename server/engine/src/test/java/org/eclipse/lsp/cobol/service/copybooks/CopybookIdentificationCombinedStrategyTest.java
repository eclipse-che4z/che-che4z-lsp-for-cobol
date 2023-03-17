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
package org.eclipse.lsp.cobol.service.copybooks;

import com.google.common.collect.ImmutableList;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.*;

/**
 * Test for {@link CopybookIdentificationCombinedStrategy}
 */
class CopybookIdentificationCombinedStrategyTest {
  private CopybookIdentificationService suffixStrategy;
  private CopybookIdentificationService contentStrategy;
  private CopybookIdentificationCombinedStrategy combinedStrategy;

  @BeforeEach
  void init() {
    suffixStrategy = mock(CopybookIdentificationService.class);
    contentStrategy = mock(CopybookIdentificationService.class);
    combinedStrategy = new CopybookIdentificationCombinedStrategy(suffixStrategy, contentStrategy);
  }

  @Test
  void testAllReturnFalse() {
    when(contentStrategy.isCopybook(anyString(), any(), any())).thenReturn(false);
    when(suffixStrategy.isCopybook(anyString(), any(), any())).thenReturn(false);
    boolean result = combinedStrategy.isCopybook("file.cbl", "content", ImmutableList.of());

    assertFalse(result);
    verify(contentStrategy, times(1)).isCopybook(anyString(), any(), any());
    verify(suffixStrategy, times(1)).isCopybook(anyString(), any(), any());
  }

  @Test
  void testFirstReturnTrue() {
    when(suffixStrategy.isCopybook(anyString(), any(), any())).thenReturn(true);
    boolean result = combinedStrategy.isCopybook("file.cbl", "content", ImmutableList.of());

    assertTrue(result);
    verify(contentStrategy, times(0)).isCopybook(anyString(), any(), any());
    verify(suffixStrategy, times(1)).isCopybook(anyString(), any(), any());
  }

}
