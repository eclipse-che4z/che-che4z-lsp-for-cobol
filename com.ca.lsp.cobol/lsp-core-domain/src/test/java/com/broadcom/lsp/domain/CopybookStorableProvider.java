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
import com.broadcom.lsp.domain.cobol.event.api.EventObserver;
import com.broadcom.lsp.domain.cobol.event.model.DataEvent;
import lombok.extern.slf4j.Slf4j;

import javax.inject.Singleton;

@Slf4j
public class CopybookStorableProvider implements EventObserver<DataEvent> {
  private static final String COPYBOOK_NAME = "Test";
  private static final String COPYBOOK_URI = "file:///C:/Users/test/Test.cbl";
  private static final String COPYBOOK_CONTENT = "000000 IDENTIFICATION DIVISION.";

  @Singleton
  private static CopybookStorable STORABLE_INSTANCE =
      new CopybookStorable(COPYBOOK_NAME, COPYBOOK_URI, COPYBOOK_CONTENT);

  public CopybookStorable getDummyStorable() {
    return STORABLE_INSTANCE;
  }

  @Override
  public void observerCallback(DataEvent adaptedDataEvent) {
    LOG.debug("CALLBACK WORKS!");
  }
}
