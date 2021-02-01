/*
 * Copyright (c) 2020 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.core.semantics;

import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.Locality;
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
