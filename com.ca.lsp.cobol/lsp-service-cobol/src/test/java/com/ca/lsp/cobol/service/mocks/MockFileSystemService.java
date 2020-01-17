package com.ca.lsp.cobol.service.mocks;

import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.event.model.DataEventType;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.ca.lsp.cobol.positive.CobolTextRegistry;
import com.ca.lsp.cobol.service.FileSystemService;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import net.jodah.concurrentunit.Waiter;
import org.eclipse.lsp4j.WorkspaceFolder;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.file.*;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

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
@Slf4j
public class MockFileSystemService implements FileSystemService {
  public static final String SOMEPROG_DEP = "SOMEPROG.dep";
  @Setter private CopybooksMock copybooks;
  @Getter private final DefaultDataBusBroker dataBus;
  private List<WorkspaceFolder> workspaceFolders;
  private Path depFolderPath = null;
  private Path depFilePath = null;

  @Getter protected Waiter waiter = new Waiter();

  @Inject
  public MockFileSystemService(DefaultDataBusBroker dataBus) {
    this.dataBus = dataBus;
    dataBus.subscribe(DataEventType.REQUIRED_COPYBOOK_EVENT, this);
  }

  @Override
  public String getContentByCopybookName(String copybookName) {
    Path path = getPathByCopybookName(copybookName);
    if (path != null) {
      return retrieveContentByPath(path);
    } else {
      return null;
    }
  }

  public void generateDependencyFile() throws URISyntaxException {

    Path cobdepsPath = Paths.get(cobdepsPath());

    log.info("Path for folder: " + cobdepsPath);

    if (!Files.exists(cobdepsPath)) {
      try {
        if (depFolderPath == null) {
          depFolderPath = Files.createDirectories(cobdepsPath);
          log.info(depFolderPath.toString());
        }

        if (depFolderPath.toFile().exists()) {
          // Files.deleteIfExists((Paths.get(depFolderPath + filesystemSeparator() +
          // SOMEPROG_DEP)));

          depFilePath = Paths.get(depFolderPath + filesystemSeparator() + SOMEPROG_DEP);

          // TODO: Replace if exists.
          Files.createFile(Paths.get(depFolderPath + filesystemSeparator() + SOMEPROG_DEP));
          generateDummyContentForFile();
        }

      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }

  private String cobdepsPath() throws URISyntaxException {
    return Paths.get(new URI(getWorkspaceFolders().get(0).getUri()))
        + filesystemSeparator()
        + ".cobdeps"
        + filesystemSeparator();
  }

  @Override
  public void observerCallback(RequiredCopybookEvent event) throws URISyntaxException {
    String name = event.getName();
    Path path = getPathByCopybookName(name);

    // if content is null I will update or  generate a dependency file
    if (path == null) {
      generateDependencyFile();
    }
    waiter.resume();
  }

  @Override
  public void setWorkspaceFolders(List<WorkspaceFolder> workspaceFolders) {
    this.workspaceFolders = workspaceFolders;
  }

  private List<WorkspaceFolder> getWorkspaceFolders() {
    return workspaceFolders;
  }

  private Path getPathByCopybookName(String fileName) {
    try (Stream<Path> pathStream =
        Files.find(
            workspaceFoldersAsPathList().get(0),
            100,
            (path, basicFileAttributes) -> {
              File resFile = path.toFile();
              return resFile.isFile()
                  && !resFile.isDirectory()
                  && resFile.getName().contains(".")
                  && resFile
                      .getName()
                      .substring(0, resFile.getName().lastIndexOf('.'))
                      .equalsIgnoreCase(fileName);
            },
            FileVisitOption.FOLLOW_LINKS)) {
      return pathStream.findAny().orElse(null);
    } catch (IOException e) {
      log.error(Arrays.toString(e.getStackTrace()));
    }
    return null;
  }

  private String filesystemSeparator() {
    return FileSystems.getDefault().getSeparator();
  }

  private void generateDummyContentForFile() {
    try {
      Files.write(depFilePath, "DSF".getBytes());
    } catch (IOException e) {
      log.error(e.getLocalizedMessage());
    }
  }

  private List<Path> workspaceFoldersAsPathList() {
    return getWorkspaceFolders().stream()
        .map(this::getPathFromWorkspaceFolder)
        .collect(Collectors.toList());
  }

  private Path getPathFromWorkspaceFolder(WorkspaceFolder it) {
    try {
      return Paths.get(new URI(it.getUri()));
    } catch (URISyntaxException e) {
      throw new IllegalArgumentException("Workspace URI not valid");
    }
  }

  private String retrieveContentByPath(Path uriForFileName) {
    String content = null;
    try (Stream<String> stream = Files.lines(uriForFileName)) {
      content = stream.reduce((s1, s2) -> s1 + "\r\n" + s2).orElse(null);
    } catch (IOException e) {
      log.error(Arrays.toString(e.getStackTrace()));
    }
    return content;
  }
}
