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

import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.event.api.EventObserver;
import com.broadcom.lsp.domain.cobol.event.model.DataEventType;
import com.broadcom.lsp.domain.cobol.event.model.FetchedCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.service.FileSystemService;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import net.jodah.concurrentunit.Waiter;
import org.eclipse.lsp4j.WorkspaceFolder;

import java.util.List;

/**
 * This class is used to mock the actual behavior of {@link FileSystemService} by returning the
 * predefined values.
 */
@Singleton
@Slf4j
public class MockFileSystemServiceImpl
    implements MockFileSystemService, EventObserver<RequiredCopybookEvent> {
  @Setter private CopybooksMock copybooks;
  @Getter private final DefaultDataBusBroker dataBus;

  @Getter protected Waiter waiter = new Waiter();

  @Inject
  public MockFileSystemServiceImpl(DefaultDataBusBroker dataBus) {
    this.dataBus = dataBus;
    dataBus.subscribe(DataEventType.REQUIRED_COPYBOOK_EVENT, this);
  }

  @Override
  public void observerCallback(RequiredCopybookEvent event) {
    String name = event.getName();
    String content = getContentByCopybookName(event.getName());
    dataBus.postData(FetchedCopybookEvent.builder().name(name).uri(name).content(content).build());
  }

  @Override
  public void setWorkspaceFolders(List<WorkspaceFolder> workspaceFolders) {}

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
}
