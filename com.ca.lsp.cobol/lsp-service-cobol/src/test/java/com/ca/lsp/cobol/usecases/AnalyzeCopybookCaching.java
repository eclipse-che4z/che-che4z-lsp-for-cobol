package com.ca.lsp.cobol.usecases;

import com.broadcom.lsp.cdi.LangServerCtx;
import com.broadcom.lsp.domain.cobol.databus.api.CopybookRepository;
import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.model.CopybookStorable;
import com.broadcom.lsp.domain.cobol.model.Position;
import com.ca.lsp.cobol.ConfigurableTest;
import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.service.mocks.MockWorkspaceService;
import com.ca.lsp.core.cobol.model.CopybookDefinition;
import com.ca.lsp.core.cobol.preprocessor.sub.copybook.AnalyseCopybookTask;
import com.ca.lsp.core.cobol.preprocessor.sub.util.impl.MultiMapSerializableHelper;
import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import lombok.extern.slf4j.Slf4j;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.Collections;

import static com.ca.lsp.core.cobol.preprocessor.CobolSourceFormat.FIXED;
import static junit.framework.TestCase.assertTrue;

/**
 * This test checks the logic of caching logic performed by copybook analyzer. The cache is
 * invalidated before each test run. The runAnalysis() method starts the analyzing task
 * synchronously, and after finish the content of the copybook should appear in cache managing by
 * databus. After accessing the cache element its hit counter should increase to maintain the
 * element persistence. Also, all the objects in cache are expected to be serializable.
 */
@Slf4j
public class AnalyzeCopybookCaching extends ConfigurableTest {
  private final String COPYBOOK_NAME = "copy";
  private final String COPYBOOK_CONTENT = "000230 77  REPORT-STATUS           PIC 99 VALUE ZERO.";

  private final Position POSITION_FIRST_OCCURRENCE = new Position(null, 0, 0, 0, 0);
  private final Position POSITION_SECOND_OCCURRENCE = new Position(null, 10, 10, 10, 10);
  private final Multimap<String, Position> paragraphDefinitions = HashMultimap.create();

  private final DefaultDataBusBroker databus =
      LangServerCtx.getInjector().getInstance(DefaultDataBusBroker.class);

  @Before
  public void init() {
    initParagraphDefinitions();
    predefineCache();
    initWorkspaceService();
  }

  private void initParagraphDefinitions() {
    String PARAGRAPH_NAME = "PARNAME";
    paragraphDefinitions.put(PARAGRAPH_NAME, POSITION_FIRST_OCCURRENCE);
    paragraphDefinitions.put(PARAGRAPH_NAME, POSITION_SECOND_OCCURRENCE);
  }

  private void predefineCache() {
    databus.storeData(
        CopybookStorable.builder()
            .name(COPYBOOK_NAME)
            .uri(COPYBOOK_NAME)
            .content(COPYBOOK_CONTENT)
            .build());
  }

  private void initWorkspaceService() {
    MockWorkspaceService mockWorkspaceService = new MockWorkspaceService(databus);
    mockWorkspaceService.setCopybooks(
        () -> Collections.singletonList(new CobolText(COPYBOOK_NAME, COPYBOOK_CONTENT)));
  }

  @After
  public void cleanup() {
    databus.invalidateCache();
  }

  @Test
  public void serializeMultiMapInString() {
    log.info("Test serialization in String");
    assertTrue(MultiMapSerializableHelper.serializeInString(paragraphDefinitions).length() > 0);
  }

  @Test
  public void serializeMultiMapInHashMap() {
    log.info("Test serialization in HashMap");
    assertTrue(MultiMapSerializableHelper.serializeInHashMap(paragraphDefinitions).size() > 0);
  }

  @Test
  public void analyzeCopybookFromCache() {
    log.info(databus.printCache());
    runAnalysis();
    log.info(databus.printCache());
    assertTrue(
        databus.getData(CopybookRepository.calculateUUID(new StringBuilder(COPYBOOK_NAME))).getHit()
            > 0);
  }

  @Test
  public void analyzeCopybookFromWorkspaceManager() {
    // invalidate cache in order to ask workspace manager to grab the content
    databus.invalidateCache();
    runAnalysis();
    assertTrue(databus.isStored(CopybookRepository.calculateUUID(COPYBOOK_NAME)));
  }

  private void runAnalysis() {
    AnalyseCopybookTask analyseCopybookTask =
        new AnalyseCopybookTask(
            new CopybookDefinition(COPYBOOK_NAME, null, null),
            Collections.emptyList(),
            FIXED);
    analyseCopybookTask.compute();
  }
}
