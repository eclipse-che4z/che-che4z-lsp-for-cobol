package com.ca.lsp.cobol.service.mocks;

import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.model.DataEventType;
import com.broadcom.lsp.domain.cobol.model.FetchedCopybookEvent;
import com.broadcom.lsp.domain.cobol.model.RequiredCopybookEvent;
import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.positive.CobolTextRegistry;
import com.ca.lsp.cobol.service.CobolWorkspaceService;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.Setter;
import org.eclipse.lsp4j.DidChangeConfigurationParams;
import org.eclipse.lsp4j.DidChangeWatchedFilesParams;
import org.eclipse.lsp4j.WorkspaceFolder;

import java.nio.file.Path;
import java.util.List;

/**
 * This class is used to mock the actual behavior of {@link
 * org.eclipse.lsp4j.services.WorkspaceService} by returning the predefined values. It requires the
 * {@link CobolTextRegistry} as a provider of copybooks. This class is a singleton to allow external
 * configuration after injecting using DI.
 *
 * <p>Notice: singleton implementation with the shared state may cause some dirty-environment
 * problems, so remember to re-configure the instance if you are working on some test case with
 * copybooks
 */
@Singleton
public class MockWorkspaceService implements CobolWorkspaceService {

  @Setter private CopybooksMock copybooks;
  private final DefaultDataBusBroker dataBus;

  @Inject
  public MockWorkspaceService(DefaultDataBusBroker dataBus) {
    this.dataBus = dataBus;
    dataBus.subscribe(DataEventType.REQUIRED_COPYBOOK_EVENT, this);
  }

  @Override
  public Path getURIByCopybookName(String fileName) {
    return null;
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
  public void setWorkspaceFolders(List<WorkspaceFolder> workspaceFolders) {}

  @Override
  public void didChangeConfiguration(DidChangeConfigurationParams didChangeConfigurationParams) {}

  @Override
  public void didChangeWatchedFiles(DidChangeWatchedFilesParams didChangeWatchedFilesParams) {}

  @Override
  public void observerCallback(RequiredCopybookEvent event) {
    String name = event.getName();
    String content = getContentByCopybookName(name);
    dataBus.postData(FetchedCopybookEvent.builder().name(name).uri(name).content(content).build());
  }
}
