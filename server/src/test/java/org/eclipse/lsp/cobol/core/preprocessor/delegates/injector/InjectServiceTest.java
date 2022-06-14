/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.injector;

import com.google.common.collect.LinkedListMultimap;
import com.google.common.collect.Multimap;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.core.CobolPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.analysis.InjectCodeAnalysisFactory;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.providers.ContentProviderFactory;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * This unit tests check the {@link InjectService} class functionality
 */
@ExtendWith(MockitoExtension.class)
class InjectServiceTest {

  @Mock private InjectCodeAnalysisFactory analysisFactory;
  @Mock private ContentProviderFactory contentProviderFactory;

  private InjectService injectService;

  @BeforeEach
  void init() {
    injectService = new InjectService(analysisFactory, contentProviderFactory);
    Multimap<String, Pair<String, String>> dialectInjectors = LinkedListMultimap.create();

    dialectInjectors.put("1", new ImmutablePair<>("name1", "content1"));
    dialectInjectors.put("2", new ImmutablePair<>("name2", "content2"));
    dialectInjectors.put("3", new ImmutablePair<>("name3", "content3"));
    injectService.setImplicitCode(dialectInjectors);
  }

  @Test
  void testLinkageSectionPickUpDialectInjectors_true() {
    CobolPreprocessor.LinkageSectionContext context = mock(CobolPreprocessor.LinkageSectionContext.class);
    setupContext(context, "1");

    List<InjectDescriptor> descriptorList = injectService.getInjectors(context);

    assertEquals(2, descriptorList.size());
    assertEquals("name1", descriptorList.get(0).getInjectedSourceName());
    assertEquals("DFHEIBLC", descriptorList.get(1).getInjectedSourceName());
  }

  @Test
  void testLinkageSectionPickUpDialectInjectors_false() {
    CobolPreprocessor.LinkageSectionContext context = mock(CobolPreprocessor.LinkageSectionContext.class);
    setupContext(context, "unknown");

    List<InjectDescriptor> descriptorList = injectService.getInjectors(context);
    assertEquals(1, descriptorList.size());
  }

  @Test
  void testProcedureDivisionPickUpDialectInjectors_false() {
    CobolPreprocessor.LinkageSectionContext context = mock(CobolPreprocessor.LinkageSectionContext.class);
    setupContext(context, "unknown");

    List<InjectDescriptor> descriptorList = injectService.getInjectors(context);
    assertEquals(1, descriptorList.size());
  }

  @Test
  void testWorkingStoragePickUpDialectInjectors_true() {
    CobolPreprocessor.WorkingStorageSectionContext context = mock(CobolPreprocessor.WorkingStorageSectionContext.class);
    setupContext(context, "3");

    List<InjectDescriptor> descriptorList = injectService.getInjectors(context);

    assertEquals(2, descriptorList.size());
    assertEquals("name3", descriptorList.get(0).getInjectedSourceName());
    assertEquals("SPECIALREGISTERS", descriptorList.get(1).getInjectedSourceName());
  }

  @Test
  void testWorkingStoragePickUpDialectInjectors_false() {
    CobolPreprocessor.WorkingStorageSectionContext context = mock(CobolPreprocessor.WorkingStorageSectionContext.class);
    setupContext(context, "unknown");

    List<InjectDescriptor> descriptorList = injectService.getInjectors(context);
    assertEquals(1, descriptorList.size());
  }

  @Test
  void testPlusPlusReturnsInjectors() {
    CobolPreprocessor.PlusplusIncludeStatementContext context = mock(CobolPreprocessor.PlusplusIncludeStatementContext.class);
    CobolPreprocessor.CopySourceContext copySource = mock(CobolPreprocessor.CopySourceContext.class);
    when(copySource.getText()).thenReturn("copybook1");
    when(context.copySource()).thenReturn(copySource);

    List<InjectDescriptor> descriptorList = injectService.getInjectors(context);
    assertEquals(1, descriptorList.size());
    assertEquals("COPYBOOK1", descriptorList.get(0).getInjectedSourceName());
  }

  @Test
  void testCopyStatementReturnsInjectors() {
    CobolPreprocessor.CopyStatementContext context = mock(CobolPreprocessor.CopyStatementContext.class);
    CobolPreprocessor.CopySourceContext copySource = mock(CobolPreprocessor.CopySourceContext.class);
    when(copySource.getText()).thenReturn("copybook2");
    when(context.copySource()).thenReturn(copySource);

    List<InjectDescriptor> descriptorList = injectService.getInjectors(context);
    assertEquals(1, descriptorList.size());
    assertEquals("COPYBOOK2", descriptorList.get(0).getInjectedSourceName());
  }

  @Test
  void testIncludeStatementReturnsInjectors() {
    CobolPreprocessor.IncludeStatementContext context = mock(CobolPreprocessor.IncludeStatementContext.class);
    CobolPreprocessor.CopySourceContext copySource = mock(CobolPreprocessor.CopySourceContext.class);
    when(copySource.getText()).thenReturn("copybook3");
    when(context.copySource()).thenReturn(copySource);

    List<InjectDescriptor> descriptorList = injectService.getInjectors(context);
    assertEquals(1, descriptorList.size());
    assertEquals("COPYBOOK3", descriptorList.get(0).getInjectedSourceName());
  }

  void setupContext(ParserRuleContext context, String text) {
    Token token = mock(Token.class);
    when(token.getText()).thenReturn(text);
    when(context.getStart()).thenReturn(token);
  }

}
