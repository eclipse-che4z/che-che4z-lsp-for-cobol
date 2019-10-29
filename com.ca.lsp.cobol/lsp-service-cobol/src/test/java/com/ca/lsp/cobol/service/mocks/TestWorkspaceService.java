package com.ca.lsp.cobol.service.mocks;

import com.broadcom.lsp.domain.cobol.model.DataEvent;
import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.positive.CobolTextRegistry;
import com.ca.lsp.cobol.service.CobolWorkspaceService;
import com.google.inject.Inject;
import org.eclipse.lsp4j.DidChangeConfigurationParams;
import org.eclipse.lsp4j.DidChangeWatchedFilesParams;

import java.nio.file.Path;

public class TestWorkspaceService implements CobolWorkspaceService {

  private CobolTextRegistry registry;

  @Inject
  public TestWorkspaceService(CobolTextRegistry registry) {
    this.registry = registry;
  }

  @Override
  public Path getURIByFileName(String fileName) {
    return null;
  }

  @Override
  public String getContentByURI(String copybookName) {
    return CobolTextRegistry.INSTANCE.getCopybooks().stream()
        .filter(it -> it.getFileName().equals(copybookName))
        .map(CobolText::getText)
        .findAny()
        .orElse(null);
  }

  @Override
  public void didChangeConfiguration(DidChangeConfigurationParams didChangeConfigurationParams) {}

  @Override
  public void didChangeWatchedFiles(DidChangeWatchedFilesParams didChangeWatchedFilesParams) {}

  @Override
  public void observerCallback(DataEvent adaptedDataEvent) {}
}
