package com.ca.lsp.core.cobol.preprocessor;

import com.broadcom.lsp.domain.cobol.model.Position;
import com.ca.lsp.core.cobol.preprocessor.sub.util.impl.MultiMapSerializableHelper;
import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import lombok.extern.slf4j.Slf4j;
import org.junit.Before;
import org.junit.Test;

@Slf4j
public class AnalyseCopybookTask {
  private final String PARAGRAPH_NAME = "PARNAME";
  private final Position POSITION_FIRST_OCCURRENCE = new Position(0, 0, 0, 0, 0);
  private final Position POSITION_SECOND_OCCURRENCE = new Position(10, 10, 10, 10, 10);

  private final Multimap<String, Position> paragraphDefinitions = HashMultimap.create();

  @Before
  public void initMultiMap() {
    paragraphDefinitions.put(PARAGRAPH_NAME, POSITION_FIRST_OCCURRENCE);
    paragraphDefinitions.put(PARAGRAPH_NAME, POSITION_SECOND_OCCURRENCE);
  }

  @Test
  public void serializeMultiMapInString() {
    LOG.info("Test serialization in String");
    assert (MultiMapSerializableHelper.serializeInString(paragraphDefinitions).length() > 0);
  }

  @Test
  public void serializeMultiMapInHashMap() {
    LOG.info("Test serialization in HashMap");
    assert (MultiMapSerializableHelper.serializeInHashMap(paragraphDefinitions).size() > 0);
  }
}
