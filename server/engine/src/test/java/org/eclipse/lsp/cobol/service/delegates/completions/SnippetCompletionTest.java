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

import com.google.common.collect.ImmutableList;
import com.google.gson.JsonArray;
import org.eclipse.lsp.cobol.core.engine.dialects.daco.DaCoDialect;
import org.eclipse.lsp.cobol.core.engine.dialects.idms.IdmsDialect;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.SettingsService;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp4j.*;
import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.List;

import static java.util.concurrent.CompletableFuture.supplyAsync;
import static org.eclipse.lsp.cobol.service.utils.SettingsParametersEnum.DIALECTS;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * Test to check SnippetCompletion
 */
class SnippetCompletionTest {
    private static final String INSERT_TEXT = "WRITE ${1:item}";
    private static final String DOCUMENTATION_TEXT = "WRITE item";
    private static final String LABEL = "WRITE item";
    private static final String KEY = "WRITE item";

    private static final String IDMS_INSERT_TEXT =
            "IDMS-CONTROL SECTION.\nPROTOCOL. MODE IS ${1:operating-mode}.";
    private static final String IDMS_DOCUMENTATION_TEXT =
            "IDMS-CONTROL SECTION.\nPROTOCOL. MODE IS operating-mode.";
    private static final String IDMS_DESCRIPTION = "[IDMS] IDMS-CONTROL SECTION";
    private static final String IDMS_LABEL = "IDMS-CONTROL SECTION";
    private static SettingsService settingsService = mock(SettingsService.class);
    private CompletionItemLabelDetails labelDetails = new CompletionItemLabelDetails();

    @Test
    void testCompletionEmptyResult() {
        assertThat(
                new SnippetCompletion(new Snippets(settingsService))
                        .getCompletionItems("Wr", new CobolDocumentModel("", AnalysisResult.builder().build())),
                is(createExpected()));
    }

    @Test
    void testCompletionNull() {

        SnippetCompletion completion = new SnippetCompletion(new Snippets(settingsService));
        assertThat(completion.getCompletionItems("WR", null), is(createExpected()));
    }

  @Test
  void testGetStreamDataMap() {
    Snippets snippets = new Snippets(settingsService);
    SnippetCompletion completion = new SnippetCompletion(snippets);
    assertEquals(222, snippets.getDataMap("COBOL").size());
    assertEquals(232, snippets.getDataMap(IdmsDialect.NAME).size());
    assertEquals(310, snippets.getDataMap(DaCoDialect.NAME).size());
  }

  @Test
  void testCompletionMock() {

    Snippets snippets = new Snippets(settingsService);
    SnippetCompletion completion = new SnippetCompletion(snippets);

    when(settingsService.fetchConfiguration(DIALECTS.label))
        .thenReturn(supplyAsync(() -> ImmutableList.of(new JsonArray())));

    snippets.updateStorage();

    assertEquals(createExpected(), completion.getCompletionItems("wr", MockCompletionModel.MODEL));
    assertEquals(0, completion.getCompletionItems("IDMS", MockCompletionModel.MODEL).size());
    assertEquals(3, completion.getCompletionItems("EXEC ", MockCompletionModel.MODEL).size());
    assertEquals(
        ImmutableList.of(), completion.getCompletionItems("GET JOB", MockCompletionModel.MODEL));
  }

  @Test
  void testCompletionIDMSMock() {

    Snippets snippets = new Snippets(settingsService);
    SnippetCompletion completion = new SnippetCompletion(snippets);

    JsonArray dialectSettings = new JsonArray();
    dialectSettings.add(IdmsDialect.NAME);
    List<Object> clientConfig = Arrays.asList(dialectSettings);
    when(settingsService.fetchConfiguration(DIALECTS.label))
        .thenReturn(supplyAsync(() -> clientConfig));
    snippets.updateStorage();

    assertEquals(createExpected(), completion.getCompletionItems("wr", MockCompletionModel.MODEL));
    assertEquals(1, completion.getCompletionItems("WRITE", MockCompletionModel.MODEL).size());
    assertEquals(
        0, completion.getCompletionItems("WRITE TRANSACTION", MockCompletionModel.MODEL).size());
    assertEquals(
        ImmutableList.of(createIDMSItem()),
        completion.getCompletionItems("IDMS", MockCompletionModel.MODEL));
  }

  @Test
  void testCompletionDaCoMock() {

    Snippets snippets = new Snippets(settingsService);
    SnippetCompletion completion = new SnippetCompletion(snippets);

    JsonArray dialectSettings = new JsonArray();
    dialectSettings.add(DaCoDialect.NAME);
    List<Object> clientConfig = Arrays.asList(dialectSettings);
    when(settingsService.fetchConfiguration(DIALECTS.label))
            .thenReturn(supplyAsync(() -> clientConfig));
    snippets.updateStorage();
    System.out.println("Dialect list :" +  dialectSettings.get(0));
    assertEquals(
            ImmutableList.of(createIDMSItem()),
            completion.getCompletionItems("IDMS", MockCompletionModel.MODEL));
    assertEquals(11, completion.getCompletionItems("GET", MockCompletionModel.MODEL).size());
    assertEquals(1, completion.getCompletionItems("GET JOB", MockCompletionModel.MODEL).size());
  }

  @Test
  void testCompletionFirstIDMSThenResetToEmptySettings() {

    Snippets snippets = new Snippets(settingsService);
    SnippetCompletion completion = new SnippetCompletion(snippets);

    /* IDMS is selected in the Settings.json */
    JsonArray dialectSettings = new JsonArray();
    dialectSettings.add(IdmsDialect.NAME);
    List<Object> clientConfig = Arrays.asList(dialectSettings);
    when(settingsService.fetchConfiguration(DIALECTS.label))
        .thenReturn(supplyAsync(() -> clientConfig));
    snippets.updateStorage();

    assertEquals(createExpected(), completion.getCompletionItems("wr", MockCompletionModel.MODEL));
    assertEquals(1, completion.getCompletionItems("WRITE", MockCompletionModel.MODEL).size());
    assertEquals(
        0, completion.getCompletionItems("WRITE TRANSACTION", MockCompletionModel.MODEL).size());
    assertEquals(
        ImmutableList.of(createIDMSItem()),
        completion.getCompletionItems("IDMS", MockCompletionModel.MODEL));

    /* No dialect type is set in Settings.json */
    JsonArray cobolSettings = new JsonArray();
    List<Object> cobolConfig = Arrays.asList(cobolSettings);

    when(settingsService.fetchConfiguration(DIALECTS.label))
        .thenReturn(supplyAsync(() -> cobolConfig));
    snippets.updateStorage();

    assertEquals(createExpected(), completion.getCompletionItems("wr", MockCompletionModel.MODEL));
    assertEquals(0, completion.getCompletionItems("IDMS", MockCompletionModel.MODEL).size());
    assertEquals(3, completion.getCompletionItems("EXEC ", MockCompletionModel.MODEL).size());
    assertEquals(
        ImmutableList.of(), completion.getCompletionItems("GET JOB", MockCompletionModel.MODEL));
  }

  @Test
  void testCompletionFirstDacoThenResetToEmptySettings() {

    Snippets snippets = new Snippets(settingsService);
    SnippetCompletion completion = new SnippetCompletion(snippets);

    /* Daco is selected in the Settings.json */
    JsonArray dialectSettings = new JsonArray();
    dialectSettings.add(IdmsDialect.NAME);
    List<Object> clientConfig = Arrays.asList(dialectSettings);

    when(settingsService.fetchConfiguration(DIALECTS.label))
        .thenReturn(supplyAsync(() -> clientConfig));
    snippets.updateStorage();

    assertEquals(createExpected(), completion.getCompletionItems("wr", MockCompletionModel.MODEL));
    assertEquals(1, completion.getCompletionItems("WRITE", MockCompletionModel.MODEL).size());
    assertEquals(
        0, completion.getCompletionItems("WRITE TRANSACTION", MockCompletionModel.MODEL).size());
    assertEquals(
        ImmutableList.of(createIDMSItem()),
        completion.getCompletionItems("IDMS", MockCompletionModel.MODEL));

    /* No dialect type is set in Settings.json */
    when(settingsService.fetchConfiguration(DIALECTS.label))
        .thenReturn(supplyAsync(() -> ImmutableList.of(new JsonArray())));
    snippets.updateStorage();

    assertEquals(createExpected(), completion.getCompletionItems("wr", MockCompletionModel.MODEL));
    assertEquals(0, completion.getCompletionItems("IDMS", MockCompletionModel.MODEL).size());
    assertEquals(3, completion.getCompletionItems("EXEC ", MockCompletionModel.MODEL).size());
    assertEquals(
        ImmutableList.of(), completion.getCompletionItems("GET JOB", MockCompletionModel.MODEL));
  }

  private List<CompletionItem> createExpected() {
    return ImmutableList.of(createItem());
  }

  private CompletionItem createItem() {
    MarkupContent doc = new MarkupContent();
    doc.setValue("```COBOL\n" + DOCUMENTATION_TEXT + "\n```");
    doc.setKind("markdown");
    CompletionItem item = new CompletionItem(LABEL);
    item.setLabel(DOCUMENTATION_TEXT);
    labelDetails.setDetail(KEY);
    labelDetails.setDescription(DOCUMENTATION_TEXT);
    item.setLabelDetails(labelDetails);
    item.setInsertText(INSERT_TEXT);
    item.setInsertTextFormat(InsertTextFormat.Snippet);
    item.setDocumentation(doc);
    item.setDetail(DOCUMENTATION_TEXT);
    item.setKind(CompletionItemKind.Snippet);
    item.setInsertTextMode(InsertTextMode.AdjustIndentation);
    item.setSortText("6" + DOCUMENTATION_TEXT);
    return item;
  }

  private CompletionItem createIDMSItem() {
    MarkupContent doc = new MarkupContent();
    doc.setValue("```COBOL\n" + IDMS_DOCUMENTATION_TEXT + "\n```");
    doc.setKind("markdown");
    CompletionItem item = new CompletionItem(IDMS_LABEL);
    item.setLabel(IDMS_LABEL);
    labelDetails.setDetail(IDMS_LABEL);
    labelDetails.setDescription(IDMS_DESCRIPTION);
    item.setLabelDetails(labelDetails);
    item.setInsertText(IDMS_INSERT_TEXT);
    item.setInsertTextFormat(InsertTextFormat.Snippet);
    item.setDocumentation(doc);
    item.setDetail(IDMS_DESCRIPTION);
    item.setKind(CompletionItemKind.Snippet);
    item.setInsertTextMode(InsertTextMode.AdjustIndentation);
    item.setSortText("6" + IDMS_LABEL);
    return item;
  }
}
