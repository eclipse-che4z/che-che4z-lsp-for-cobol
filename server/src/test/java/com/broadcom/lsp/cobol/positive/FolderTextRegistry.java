package com.broadcom.lsp.cobol.positive;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.ListMultimap;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

/** Registry for Cobol source code files. */
@Slf4j
public class FolderTextRegistry implements CobolTextRegistry {
  private static final String POSITIVE_ENTRY = "positive";
  private static final String NEGATIVE_ENTRY = "negative";
  private static final String COPYBOOK_ENTRY = "copybooks";

  private final ListMultimap<String, CobolText> texts = ArrayListMultimap.create();

  public FolderTextRegistry(String pathToTestResources) {
    if (StringUtils.isNotEmpty(pathToTestResources)) {
      try {
        collectFilesToTest(pathToTestResources);
      } catch (IOException e) {
        LOG.error(e.getMessage());
      }
    }
  }

  @Override
  public List<CobolText> getPositives() {
    return Collections.unmodifiableList(texts.get(POSITIVE_ENTRY));
  }

  @Override
  public List<CobolText> getNegatives() {
    return Collections.unmodifiableList(texts.get(NEGATIVE_ENTRY));
  }

  @Override
  public List<CobolText> getCopybooks() {
    return Collections.unmodifiableList(texts.get(COPYBOOK_ENTRY));
  }

  private void collectFilesToTest(String folderPath) throws IOException {
    Files.walk(Paths.get(folderPath))
            .filter(Files::isRegularFile)
            .forEach(this::processFile);
  }

  private void processFile(Path path) {
    String name = path.getFileName().toString();
    String folder = Optional.ofNullable(path.getParent())
            .map(Path::getFileName)
            .map(Path::toString)
            .orElse("");

    if (!isSupportedFolder(folder)) {
      return;
    }

    try {
      CobolText loadCobolText = new CobolText(name, Files.readString(path));
      texts.put(folder, loadCobolText);
    } catch (IOException e) {
      LOG.warn("Unable to load file: {}, skipped", path);
    }
  }

  private boolean isSupportedFolder(String folder) {
    return (folder.equals(POSITIVE_ENTRY)
            || folder.equals(NEGATIVE_ENTRY)
            || folder.equals(COPYBOOK_ENTRY));
  }
}
