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
import com.broadcom.lsp.domain.cobol.event.model.FetchedCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.ca.lsp.cobol.service.utils.FileSystemService;
import com.google.gson.JsonPrimitive;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;

import java.net.URI;
import java.nio.file.Path;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Consumer;

import static com.broadcom.lsp.domain.cobol.event.model.DataEventType.REQUIRED_COPYBOOK_EVENT;
import static com.ca.lsp.cobol.service.TextDocumentSyncType.DID_OPEN;
import static java.util.Optional.ofNullable;

/** This service processes copybook requests and returns content by its name */
@Slf4j
@Singleton
@SuppressWarnings("unchecked")
public class CopybookServiceImpl implements CopybookService {
  private final DataBusBroker dataBus;
  private final ClientService clientService;
  private final FileSystemService files;

  private final Map<String, Path> copybookPath = new ConcurrentHashMap<>(8, 0.9f, 1);

  @Inject
  public CopybookServiceImpl(
      DataBusBroker dataBus, ClientService clientService, FileSystemService files) {
    this.dataBus = dataBus;
    this.clientService = clientService;
    this.files = files;

    dataBus.subscribe(REQUIRED_COPYBOOK_EVENT, this);
  }

  @Override
  public void invalidateURICache() {
    copybookPath.clear();
  }

  /**
   * Retrieve copybook content by its name, and the document name {@see RequiredCopybookEvent}. It
   * will apply a file system calls only if the {@link TextDocumentSyncType is DID_OPEN} in order to
   * avoid obtaining the copybooks with incomplete names.
   *
   * <p>The retrieved URIs stored in the cache. If the URI points to non-existing file, then the
   * cache invalidated and new request applied.
   *
   * <p>Replies with copybook content and its URI if exists, or with an empty response if the
   * copybook not found. The response sends in any case.
   *
   * @param event - copybook request params
   */
  @Override
  public void observerCallback(RequiredCopybookEvent event) {
    String requiredCopybookName = event.getName();

    if (copybookPath.containsKey(requiredCopybookName)) {
      Path file = copybookPath.get(requiredCopybookName);
      if (files.fileExists(file)) {
        sendResponse(requiredCopybookName, files.getContentByPath(file), file);
        return;
      } else {
        copybookPath.remove(requiredCopybookName);
      }
    }
    if (DID_OPEN.name().equals(event.getTextDocumentSyncType())) {
      String cobolFileName = files.getNameFromURI(event.getDocumentUri());
      clientService
          .callClient("copybook", cobolFileName, requiredCopybookName)
          .thenAccept(sendResponse(requiredCopybookName));
    } else {
      sendResponse(requiredCopybookName, null, null);
    }
  }

  private Consumer<List<Object>> sendResponse(String requiredCopybookName) {
    return result -> dataBus.postData(fetchCopybook(requiredCopybookName, retrieveURI(result)));
  }

  private void sendResponse(String requiredCopybookName, String content, Path path) {
    dataBus.postData(
        FetchedCopybookEvent.builder()
            .name(requiredCopybookName)
            .uri(toURI(path))
            .content(content)
            .build());
  }

  private FetchedCopybookEvent fetchCopybook(String requiredCopybookName, String uri) {
    if (uri.isEmpty()) {
      return FetchedCopybookEvent.builder().name(requiredCopybookName).build();
    }
    Path file = files.getPathFromURI(uri);
    if (file == null) {
      return FetchedCopybookEvent.builder().name(requiredCopybookName).build();
    }
    copybookPath.put(requiredCopybookName, file);

    return FetchedCopybookEvent.builder()
        .name(requiredCopybookName)
        .uri(toURI(file))
        .content(files.getContentByPath(file))
        .build();
  }

  private String toURI(Path file) {
    return ofNullable(file).map(Path::toUri).map(URI::toString).orElse(null);
  }

  private String retrieveURI(List<Object> result) {
    return result.isEmpty() ? "" : ((JsonPrimitive) result.get(0)).getAsString();
  }
}
