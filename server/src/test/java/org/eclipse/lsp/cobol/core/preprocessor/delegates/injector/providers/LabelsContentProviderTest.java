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
import org.eclipse.lsp.cobol.core.model.CopybookModel;
import org.eclipse.lsp.cobol.core.model.CopybookName;
import org.eclipse.lsp.cobol.service.SQLBackend;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;
import org.eclipse.lsp.cobol.service.copybooks.CopybookProcessingMode;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * This unit tests check the {@link LabelsContentProvider} class functionality
 */
@ExtendWith(MockitoExtension.class)
class LabelsContentProviderTest {
  private LabelsContentProvider contentProvider;

  @BeforeEach
  void setupMocks() {
    contentProvider = new LabelsContentProvider();
  }

  @Test
  void testCreatesParagraphsFromLabelNames() {
    CopybookConfig copybookConfig = new CopybookConfig(CopybookProcessingMode.ENABLED,
        SQLBackend.DB2_SERVER, ImmutableList.of("LABEL1", "LABEL2"));
    CopybookName copybookName = new CopybookName("name");
    CopybookModel model = contentProvider.read(copybookConfig, copybookName, "uri", "uri").get();
    assertEquals(model.getContent(), "       LABEL1.\r\n       LABEL2.\r\n");
  }

}
