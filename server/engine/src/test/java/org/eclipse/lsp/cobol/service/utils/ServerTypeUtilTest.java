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
package org.eclipse.lsp.cobol.service.utils;

import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.usecases.DialectConfigs;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

/**
 * Tests @{@link ServerTypeUtil}
 */
class ServerTypeUtilTest {

  @Test
  void WhenCompatibleSettingsThenReturnFalse() {
    System.setProperty("serverType", "NATIVE");
    boolean inCompatibleServerTypeRegistered =
        ServerTypeUtil.isInCompatibleServerTypeRegistered(
            AnalysisConfig.defaultConfig(CopybookProcessingMode.DISABLED));
    Assertions.assertFalse(inCompatibleServerTypeRegistered);
  }

  @Test
  void WhenInCompatibleSettingsThenReturnFalse() {
    System.setProperty("serverType", "NATIVE");
    AnalysisConfig dialectAnalysisConfig = DialectConfigs.getDaCoAnalysisConfig();
    boolean inCompatibleServerTypeRegistered =
            ServerTypeUtil.isInCompatibleServerTypeRegistered(
                    dialectAnalysisConfig);
    Assertions.assertTrue(inCompatibleServerTypeRegistered);
  }

  @Test
  void whenJavaServerThenReturnFalse() {
    System.setProperty("serverType", "JAVA");
    Assertions.assertFalse(ServerTypeUtil.isNativeServerType());
  }

  @Test
  void whenNativeServerThenReturnTrue() {
    System.setProperty("serverType", "NATIVE");
    Assertions.assertTrue(ServerTypeUtil.isNativeServerType());
  }

  @AfterAll
  static void unsetSystemProperty() {
    System.setProperty("serverType", "JAVA");
  }
}
