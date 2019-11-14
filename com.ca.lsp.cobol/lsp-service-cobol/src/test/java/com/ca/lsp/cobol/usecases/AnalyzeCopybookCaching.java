package com.ca.lsp.cobol.usecases;

import com.broadcom.lsp.cdi.LangServerCtx;
import com.broadcom.lsp.domain.cobol.databus.api.ICpyRepository;
import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.model.CpyStorable;
import com.broadcom.lsp.domain.cobol.model.Position;
import com.ca.lsp.cobol.ConfigurableTest;
import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.service.mocks.MockWorkspaceService;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.sub.copybook.AnalyseCopybookTask;
import com.ca.lsp.core.cobol.preprocessor.sub.util.impl.MultiMapSerializableHelper;
import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import lombok.extern.slf4j.Slf4j;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.List;

import static junit.framework.TestCase.assertTrue;

@Slf4j
public class AnalyzeCopybookCaching extends ConfigurableTest {
  private final String COPYBOOK_NAME = "copy";
  private final String COPYBOOK_CONTENT = "000230 77  REPORT-STATUS           PIC 99 VALUE ZERO.";

  private final Position POSITION_FIRST_OCCURRENCE = new Position(0, 0, 0, 0, 0);
  private final Position POSITION_SECOND_OCCURRENCE = new Position(10, 10, 10, 10, 10);
  private final Multimap<String, Position> paragraphDefinitions = HashMultimap.create();

  private final DefaultDataBusBroker databus =
      LangServerCtx.getInjector().getInstance(DefaultDataBusBroker.class);
  private MockWorkspaceService mockWorkspaceService;

  @Before
  public void init() {
    String PARAGRAPH_NAME = "PARNAME";
    paragraphDefinitions.put(PARAGRAPH_NAME, POSITION_FIRST_OCCURRENCE);
    paragraphDefinitions.put(PARAGRAPH_NAME, POSITION_SECOND_OCCURRENCE);

    databus.storeData(
        CpyStorable.builder()
            .name(COPYBOOK_NAME)
            .content(COPYBOOK_CONTENT)
            .paragraphPosition(MultiMapSerializableHelper.serializeInHashMap(paragraphDefinitions))
            .build());

    mockWorkspaceService = new MockWorkspaceService(databus);
    mockWorkspaceService.setCopybooks(
        () -> List.of(new CobolText(COPYBOOK_NAME, COPYBOOK_CONTENT)));
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
        databus.getData(ICpyRepository.calculateUUID(new StringBuilder(COPYBOOK_NAME))).getHit()
            > 0);
  }

  @Test
  public void analyzeCopybookFromWorkspaceManager() {
    // invalidate cache in order to ask workspace manager to grab the content
    databus.invalidateCache();
    runAnalysis();
    assertTrue(databus.isStored(ICpyRepository.calculateUUID(COPYBOOK_NAME)));
  }

  private void runAnalysis() {
    AnalyseCopybookTask analyseCopybookTask =
        new AnalyseCopybookTask(COPYBOOK_NAME, CobolPreprocessor.CobolSourceFormatEnum.FIXED);
    analyseCopybookTask.compute();
  }
}
