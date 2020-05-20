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
package com.ca.lsp.cobol.service;

import com.broadcom.lsp.domain.cobol.databus.api.DataBusBroker;
import com.broadcom.lsp.domain.cobol.event.model.DataEventType;
import com.broadcom.lsp.domain.cobol.event.model.FetchedCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.ca.lsp.cobol.service.utils.FileSystemUtils;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;

import java.net.URI;
import java.nio.file.Path;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutionException;

import static com.ca.lsp.cobol.service.utils.FileSystemUtils.getNameFromURI;

@Singleton
@Slf4j
public class CopybookServiceImpl implements CopybookService {
  private final DataBusBroker dataBus;

  private final ClientService clientService;

  private final Map<String, Path> copybookPath = new ConcurrentHashMap<>(8, 0.9f, 1);

  @Inject
  public CopybookServiceImpl(DataBusBroker dataBus, ClientService clientService) {
    this.dataBus = dataBus;
    this.clientService = clientService;
    dataBus.subscribe(DataEventType.REQUIRED_COPYBOOK_EVENT, this);
  }

  /** create the task and pass it to the executor service */
  @Override
  public void observerCallback(RequiredCopybookEvent event) {
    String requiredCopybookName = event.getName();

    if (copybookPath.containsKey(requiredCopybookName)) {
      Path file = copybookPath.get(requiredCopybookName);
      if (FileSystemUtils.isFileExists(file)) {
        publishOnDatabus(requiredCopybookName, FileSystemUtils.getContentByPath(file), file);
        return;
      } else {
        copybookPath.remove(requiredCopybookName);
      }
    }

    String cobolFileName = getNameFromURI(event.getDocumentUri());
    try {
      String uri = clientService.callClientSync("copybook", cobolFileName, requiredCopybookName);

      System.out.println("Get uri from middleware" + uri);
      if (!uri.isEmpty()) {
        Path file = FileSystemUtils.getPathFromURI(uri);
        copybookPath.put(requiredCopybookName, file);
        publishOnDatabus(requiredCopybookName, FileSystemUtils.getContentByPath(file), file);
        return;
      } else {
        publishOnDatabus(requiredCopybookName);
      }
    } catch (InterruptedException | ExecutionException e) {
      log.error("Error resolving copybook", e);
      publishOnDatabus(requiredCopybookName);
    }
  }

  private void publishOnDatabus(String requiredCopybookName, String content, Path path) {
    dataBus.postData(
        FetchedCopybookEvent.builder()
            .name(requiredCopybookName)
            .uri(Optional.ofNullable(path).map(Path::toUri).map(URI::toString).orElse(null))
            .content(content)
            .build());
  }

  private void publishOnDatabus(String requiredCopybookName) {
    dataBus.postData(FetchedCopybookEvent.builder().name(requiredCopybookName).build());
  }
}
