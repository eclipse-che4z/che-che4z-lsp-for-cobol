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
import com.google.gson.JsonPrimitive;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;

import java.net.URI;
import java.nio.file.Path;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import static com.ca.lsp.cobol.service.utils.FileSystemUtils.*;
import static java.util.Optional.ofNullable;

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
      if (fileExists(file)) {
        publishOnDatabus(requiredCopybookName, getContentByPath(file), file);
        return;
      } else {
        copybookPath.remove(requiredCopybookName);
      }
    }
    if (TextDocumentSyncType.DID_OPEN.toString().equals(event.getTextDocumentSyncType())) {
      String cobolFileName = getNameFromURI(event.getDocumentUri());
      clientService
              .callClient("copybook", cobolFileName, requiredCopybookName)
              .thenAccept(
                      result -> dataBus.postData(fetchCopybook(requiredCopybookName, retrieveURI(result))));
    } else {
      publishOnDatabus(requiredCopybookName, null, null);
    }
  }

  private FetchedCopybookEvent fetchCopybook(String requiredCopybookName, String uri) {
    if (uri.isEmpty()) {
      return FetchedCopybookEvent.builder().name(requiredCopybookName).build();
    }
    Path file = getPathFromURI(uri);
    copybookPath.put(requiredCopybookName, file);

    return FetchedCopybookEvent.builder()
        .name(requiredCopybookName)
        .uri(toURI(file))
        .content(getContentByPath(file))
        .build();
  }

  private void publishOnDatabus(String requiredCopybookName, String content, Path path) {
    dataBus.postData(
        FetchedCopybookEvent.builder()
            .name(requiredCopybookName)
            .uri(toURI(path))
            .content(content)
            .build());
  }

  private String toURI(Path file) {
    return ofNullable(file).map(Path::toUri).map(URI::toString).orElse(null);
  }

  private String retrieveURI(List<Object> result) {
    return result.isEmpty() ? "" : ((JsonPrimitive) result.get(0)).getAsString();
  }
}
