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

package org.eclipse.lsp.cobol.service.delegates.completions;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import java.util.List;
import java.util.Optional;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.settings.SettingsService;
import org.eclipse.lsp4j.CompletionItem;
import org.eclipse.lsp4j.CompletionItemKind;
import org.eclipse.lsp4j.MarkupContent;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * This test {@link KeywordCompletion} asserts that filtration and preparing the keyword completion
 * suggestions works correctly
 */
class KeywordCompletionTest {
  private static final String DOCUMENTATION_TEXT =
      "The ACCEPT statement transfers data or system date-related information into the "
          + "data area referenced by the specified identifier.\r\n\r\n"
          + "[Read more](https://www.ibm.com/support/knowledgecenter/en/SS6SG3_6.2.0/"
          + "com.ibm.cobol62.ent.doc/PGandLR/ref/rlpsacce.htm)\r\n\r\n"
          + "© Copyright IBM Corporation 1994, 2019.\r\n\r\n"
          + "U.S. Government Users Restricted Rights - "
          + "Use, duplication or disclosure restricted by GSA ADP Schedule Contract with IBM Corp.";
  private static final String LABEL = "ACCEPT";

  private KeywordCompletion completion;

  @BeforeEach
  void init() {
    DialectService dialectService = mock(DialectService.class);
    CobolDialect mockDialect = mock(CobolDialect.class);
    Optional<CobolDialect> result = Optional.of(() -> "COBOL");
    when(mockDialect.getKeywords()).thenReturn(ImmutableMap.of("TEST", "TEST DESCRIPTION"));
    when(dialectService.getDialectByName(any())).thenReturn(result);
    when(dialectService.getImplicitCobolDialects()).thenReturn(ImmutableList.of(mockDialect));
    completion = new KeywordCompletion(new Keywords(mock(SettingsService.class), dialectService));
  }

  @Test
  void testCompletionEmptyResult() {
    assertThat(
        completion.getCompletionItems(
            "accep", new CobolDocumentModel("", "", AnalysisResult.builder().build())),
        is(createExpected(LABEL, DOCUMENTATION_TEXT)));
  }

  @Test
  void testCompletionForImplicitDialects() {
    assertThat(
        completion.getCompletionItems(
            "TEST", new CobolDocumentModel("", "", AnalysisResult.builder().build())),
        is(createExpected("TEST", "TEST DESCRIPTION")));
  }

  @Test
  void testGetStreamDataMap() {
    DialectService dialectService = mock(DialectService.class);
    CobolDialect implicitDialect = mock(CobolDialect.class);
    CobolDialect idmsDialect = mock(CobolDialect.class);
    when(implicitDialect.getKeywords()).thenReturn(ImmutableMap.of("implicit", "implicit desc1"));
    when(idmsDialect.getKeywords()).thenReturn(ImmutableMap.of("idms1", "desc1"));
    when(dialectService.getDialectByName("IDMS")).thenReturn(Optional.of(idmsDialect));
    when(dialectService.getImplicitCobolDialects()).thenReturn(ImmutableList.of(implicitDialect));
    CobolDialect dacoDialect = mock(CobolDialect.class);
    when(dacoDialect.getKeywords()).thenReturn(ImmutableMap.of("daco1", "desc1", "daco2", "desc2"));
    when(dialectService.getDialectByName("DaCo")).thenReturn(Optional.of(dacoDialect));

    Keywords keywords = new Keywords(mock(SettingsService.class), dialectService);
    List<String> dialectType = ImmutableList.of();
    assertEquals(2355, keywords.getDataMap(dialectType).size());

    dialectType = ImmutableList.of("IDMS");
    assertEquals(2356, keywords.getDataMap(dialectType).size());

    dialectType = ImmutableList.of("DaCo");
    assertEquals(2357, keywords.getDataMap(dialectType).size());

    dialectType = ImmutableList.of("DaCo", "IDMS");
    assertEquals(2358, keywords.getDataMap(dialectType).size());
  }

  @Test
  void testCompletionNull() {
    assertThat(
        completion.getCompletionItems("Accep", null),
        is(createExpected(LABEL, DOCUMENTATION_TEXT)));
  }

  @Test
  void testCompletionMock() {
    assertEquals(
        createExpected(LABEL, DOCUMENTATION_TEXT),
        completion.getCompletionItems("ACCEP", MockCompletionModel.MODEL));
  }

  private List<CompletionItem> createExpected(String label, String documentation) {
    return ImmutableList.of(createItem(label, documentation));
  }

  private CompletionItem createItem(String label, String documentation) {
    MarkupContent doc = new MarkupContent();
    doc.setValue(documentation);
    doc.setKind("markdown");
    CompletionItem item = new CompletionItem(label);
    item.setLabel(label);
    item.setInsertText(label);
    item.setDocumentation(doc);
    item.setKind(CompletionItemKind.Keyword);
    item.setSortText("6" + label);
    return item;
  }
}
