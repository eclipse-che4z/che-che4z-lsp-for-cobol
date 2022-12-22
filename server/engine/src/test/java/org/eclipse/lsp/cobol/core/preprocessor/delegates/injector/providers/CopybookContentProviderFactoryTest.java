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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.providers;

import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * This unit tests check the {@link ContentProviderFactory} class functionality
 */
@ExtendWith(MockitoExtension.class)
class CopybookContentProviderFactoryTest {
  private ContentProviderFactory factory;
  @Mock private CopybookService copybookService;

  @BeforeEach
  void setupMocks() {
    factory = new ContentProviderFactory(copybookService);
  }

  @Test
  void testCopybookContentProvider() {
    CopybookContentProvider copybookContentProvider = factory.getInstanceFor(ContentProviderFactory.InjectContentType.RESOLVE_COPYBOOK);
    assertTrue(copybookContentProvider instanceof CopybookCopybookContentProviderImpl);
  }

}
