/*
 * Copyright (c) 2020 Broadcom.
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
package com.broadcom.lsp.domain;

import com.broadcom.lsp.domain.cobol.databus.model.CopybookStorable;
import com.broadcom.lsp.domain.cobol.event.api.CopybookObserver;
import com.broadcom.lsp.domain.cobol.event.model.DataEvent;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

import javax.inject.Singleton;

@Slf4j
public class CopybookStorableProvider implements CopybookObserver<DataEvent> {
  @Getter private static final String unknownEventMessage = "Dummy event";
  @Getter private static final String copybookName = "Test";
  @Getter private static final String copybookURI = "file:///C:/Users/test/Test.cbl";
  @Getter private static final String copybookContent = "000000 IDENTIFICATION DIVISION.";
  @Getter private static final String REQCPY = "REQCPY";
  @Getter private static final String FETCHEDCPY = "FETCHEDCPY";
  @Getter private static final String UNKNOWN = "UNKNOWN";

  @Singleton
  private static CopybookStorable STORABLE_INSTANCE =
      new CopybookStorable(copybookName, copybookURI, copybookContent);

  public CopybookStorable getDummyStorable() {
    return STORABLE_INSTANCE;
  }

  @Override
  public void observerCallback(DataEvent adaptedDataEvent) {
    LOG.debug("CALLBACK WORKS!");
  }
}
