package com.broadcom.lsp.cobol.core.semantics;

import com.broadcom.lsp.cobol.core.messages.MessageService;
import com.broadcom.lsp.cobol.core.model.Locality;
import org.eclipse.lsp4j.Location;
import org.junit.jupiter.api.Test;

import java.util.Collection;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.mock;

/**
 * Test for GroupContext class
 */
class GroupContextTest {

  @Test
  void testSectionUsages() {
    Locality locality = Locality.builder()
        .token("test")
        .build();

    GroupContext groupContext = prepareGroup(locality);

    groupContext.addSectionDefinition("test", Locality.builder().build());
    checkUsages(groupContext.getSectionUsages(), locality.toLocation());
  }

  @Test
  void testParagraphUsages() {
    Locality locality = Locality.builder()
        .token("test")
        .build();

    GroupContext groupContext = prepareGroup(locality);

    groupContext.addParagraphDefinition("test", Locality.builder().build());
    checkUsages(groupContext.getParagraphUsages(), locality.toLocation());
  }

  @Test
  void testGenerateParagraphErrorsParagraphs() {
    GroupContext groupContext = new GroupContext();

    MessageService messageService = mock(MessageService.class);
    assertEquals(0, groupContext.generateParagraphErrors(messageService).size());

    groupContext.addCandidateUsage("test1", Locality.builder().build());
    assertEquals(1, groupContext.generateParagraphErrors(messageService).size());

    groupContext.addParagraphDefinition("test1", Locality.builder().build());
    assertEquals(0, groupContext.generateParagraphErrors(messageService).size());

    groupContext.addCandidateUsage("test2", Locality.builder().build());
    assertEquals(1, groupContext.generateParagraphErrors(messageService).size());

    groupContext.addSectionDefinition("test2", Locality.builder().build());
    assertEquals(0, groupContext.generateParagraphErrors(messageService).size());
  }
  
  private GroupContext prepareGroup(Locality locality) {
    GroupContext context = new GroupContext();
    context.addCandidateUsage("test", locality);
    assertTrue(context.getParagraphUsages().isEmpty());
    assertTrue(context.getSectionDefinitions().isEmpty());

    return context;
  }

  private void checkUsages(Map<String, Collection<Location>> usages, Location expectedLocation) {
    assertEquals(1, usages.size());
    Location actualLocation = usages.get("test").iterator().next();
    assertEquals(expectedLocation, actualLocation);
  }

}
