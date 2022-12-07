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

import org.junit.jupiter.api.Test;

import java.net.URI;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * Test for WorkingFolderService class
 */
class WorkingFolderServiceTest {
  @Test
  void testWorkingFolder() {
    WorkingFolderService service = new WorkingFolderService();
    URI workdir = service.getWorkingFolder();
    assertTrue(workdir.toString().startsWith("file:/"));
  }

  @Test
  void testGetFilenames() {
    WorkingFolderService service = new WorkingFolderService();
    List<String> files = service.getFilenames(service.getWorkingFolder());
    assertTrue(files.size() > 0);
  }

}
