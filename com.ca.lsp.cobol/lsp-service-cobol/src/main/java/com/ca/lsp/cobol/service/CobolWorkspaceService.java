/*
 * Copyright (c) 2019 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 *
 */
package com.ca.lsp.cobol.service;

import com.broadcom.lsp.domain.cobol.databus.api.IDataBusObserver;
import com.broadcom.lsp.domain.cobol.model.DataEvent;

import java.nio.file.Path;
import java.util.stream.Stream;

interface CobolWorkspaceService extends org.eclipse.lsp4j.services.WorkspaceService, IDataBusObserver<DataEvent> {
  /**
   * From a given copybook name (without file extension) this method will return the URI of the file
   * - if exists
   *
   * @param fileName (i.e. COPYTEST)
   * @return URI of file (i.e. file:///C:/Users/test/AppData/Local/Temp/WORKSPACE/COPYTEST.cpy) or
   *     null if didn't found. This case should be covered by an appropriate diagnostic message
   *     using the Communication service delegate object
   */
  Path getURIByFileName(String fileName);

  Stream<String> getContentByURI(String copybookName);

  /**
   * @param filename name of copybook retrived in the copy instruction
   * @param URI of the resource found by the method #getUriByFileName()
   * @param content String content for the resource associated to the URI
   */
  void populateDatabus(String filename, Path URI, String content);
}
