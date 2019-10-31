package com.ca.lsp.cobol.service.mocks;

import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.model.*;
import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.positive.CobolTextRegistry;
import com.ca.lsp.cobol.service.CobolWorkspaceService;
import com.google.inject.Inject;
import org.eclipse.lsp4j.DidChangeConfigurationParams;
import org.eclipse.lsp4j.DidChangeWatchedFilesParams;

import java.nio.file.Path;

public class TestWorkspaceService implements CobolWorkspaceService {

  private CobolTextRegistry registry;
  private DefaultDataBusBroker dataBus;

  @Inject
  public TestWorkspaceService(CobolTextRegistry registry, DefaultDataBusBroker dataBus) {
    this.registry = registry;
    this.dataBus = dataBus;
    dataBus.subscribe(DataEventType.CBLSCAN_EVENT, this);
  }

  @Override
  public Path getURIByFileName(String fileName) {
    return null;
  }

  @Override
  public String getContentByURI(String copybookName) {
    return registry.getCopybooks().stream()
        .filter(it -> it.getFileName().equals(copybookName + ".cpy"))
        .map(CobolText::getText)
        .findAny()
        .orElse(null);
  }

  @Override
  public void didChangeConfiguration(DidChangeConfigurationParams didChangeConfigurationParams) {}

  @Override
  public void didChangeWatchedFiles(DidChangeWatchedFilesParams didChangeWatchedFilesParams) {}


  @Override
  public void observerCallback(CblScanEvent event) {
    if (!event.getEventType().equals(DataEventType.CBLSCAN_EVENT)) {
      return;
    }
    String name = event.getName();
    String content = getContentByURI(name);
    dataBus.postData(CblFetchEvent.builder().name(name).content(content).build());
  }
}
