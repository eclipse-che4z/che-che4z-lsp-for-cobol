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

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.common.copybook.*;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.when;

/**
 * This unit tests check the {@link CopybookCopybookContentProviderImpl} class functionality
 */
@ExtendWith(MockitoExtension.class)
class CopybookCopybookContentProviderImplTest {
  @Mock private CopybookService copybookService;
  private CopybookConfig copybookConfig;
  private CopybookCopybookContentProviderImpl contentProvider;
  private CopybookName copybookName;

  @BeforeEach
  void init() {
    contentProvider = new CopybookCopybookContentProviderImpl(copybookService);
    copybookConfig = new CopybookConfig(CopybookProcessingMode.ENABLED, SQLBackend.DB2_SERVER, ImmutableList.of());
    copybookName = new CopybookName(UUID.randomUUID().toString());
  }

  @Test
  void testReturnsEmptyForNonExistingCopybookContent() {
    String programDocumentUrl = UUID.randomUUID().toString();
    String documentUrl = UUID.randomUUID().toString();

    when(copybookService.resolve(copybookName.toCopybookId(programDocumentUrl),
            copybookName, programDocumentUrl, documentUrl, copybookConfig, false))
        .thenReturn(new CopybookModel(CopybookId.fromString(copybookName.getDisplayName()), copybookName, documentUrl, null));
    Optional<CopybookModel> copybookModel = contentProvider.read(copybookConfig, copybookName, programDocumentUrl, documentUrl);

    assertFalse(copybookModel.isPresent());
  }

  @Test
  void testReturnsCopybookModelForExistingCopybookContent() {
    String programDocumentUrl = UUID.randomUUID().toString();
    String documentUrl = UUID.randomUUID().toString();
    CopybookModel resolvedCopybookModel = new CopybookModel(CopybookId.fromString(copybookName.getDisplayName()), copybookName, documentUrl, "");

    when(copybookService.resolve(copybookName.toCopybookId(programDocumentUrl), copybookName, programDocumentUrl, documentUrl, copybookConfig, false))
        .thenReturn(resolvedCopybookModel);
    Optional<CopybookModel> copybookModel = contentProvider.read(copybookConfig, copybookName, programDocumentUrl, documentUrl);

    assertTrue(copybookModel.isPresent());
    assertEquals(resolvedCopybookModel, copybookModel.get());
  }

}
