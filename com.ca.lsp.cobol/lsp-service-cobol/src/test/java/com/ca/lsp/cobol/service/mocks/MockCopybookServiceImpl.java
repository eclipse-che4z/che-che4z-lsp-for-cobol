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
package com.ca.lsp.cobol.service.mocks;

import com.broadcom.lsp.domain.cobol.databus.api.DataBusBroker;
import com.broadcom.lsp.domain.cobol.event.model.DataEventType;
import com.broadcom.lsp.domain.cobol.event.model.FetchedCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.ca.lsp.cobol.positive.CobolText;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import net.jodah.concurrentunit.Waiter;

import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.toURI;

/**
 * This class used to mock the actual behavior of {@link
 * com.ca.lsp.cobol.service.CopybookService} and return stubs value not used to validate any
 * CopybookService functionality
 */
@Singleton
@Slf4j
public class MockCopybookServiceImpl implements MockCopybookService {
  @Setter private CopybooksMock copybooks;
  @Getter private final DataBusBroker dataBus;

  @Getter protected Waiter waiter = new Waiter();

  @Inject
  public MockCopybookServiceImpl(DataBusBroker dataBus) {
    this.dataBus = dataBus;
    dataBus.subscribe(DataEventType.REQUIRED_COPYBOOK_EVENT, this);
  }

  @Override
  public void observerCallback(RequiredCopybookEvent event) {
    String name = event.getName();
    String content = getContentByCopybookName(event.getName());
    dataBus.postData(
        FetchedCopybookEvent.builder().name(name).uri(toURI(name)).content(content).build());
  }

  @Override
  public String getContentByCopybookName(String copybookName) {
    return copybooks.getCopybooks().stream()
        .filter(
            it ->
                it.getFileName().equalsIgnoreCase(copybookName)
                    || it.getFileName().equalsIgnoreCase(copybookName + ".cpy"))
        .map(CobolText::getFullText)
        .findAny()
        .orElse(null);
  }

  @Override
  public void invalidateURICache() {}
}
