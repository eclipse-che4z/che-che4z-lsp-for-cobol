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
  }

  @Test
  void testLinkageSectionPickUpDialectInjectors_true() {
    CobolPreprocessor.LinkageSectionContext context = mock(CobolPreprocessor.LinkageSectionContext.class);
    List<InjectDescriptor> descriptorList = injectService.getInjectors(context);

    assertEquals(1, descriptorList.size());
    assertEquals("DFHEIBLC", descriptorList.get(0).getInjectedSourceName());
  }

  @Test
  void testLinkageSectionPickUpDialectInjectors_false() {
    CobolPreprocessor.LinkageSectionContext context = mock(CobolPreprocessor.LinkageSectionContext.class);

    List<InjectDescriptor> descriptorList = injectService.getInjectors(context);
    assertEquals(1, descriptorList.size());
  }

  @Test
  void testProcedureDivisionPickUpDialectInjectors_false() {
    CobolPreprocessor.LinkageSectionContext context = mock(CobolPreprocessor.LinkageSectionContext.class);

    List<InjectDescriptor> descriptorList = injectService.getInjectors(context);
    assertEquals(1, descriptorList.size());
  }

  @Test
  void testWorkingStoragePickUpDialectInjectors_true() {
    CobolPreprocessor.WorkingStorageSectionContext context = mock(CobolPreprocessor.WorkingStorageSectionContext.class);
    List<InjectDescriptor> descriptorList = injectService.getInjectors(context);

    assertEquals(1, descriptorList.size());
    assertEquals("SPECIALREGISTERS", descriptorList.get(0).getInjectedSourceName());
  }

  @Test
  void testWorkingStoragePickUpDialectInjectors_false() {
    CobolPreprocessor.WorkingStorageSectionContext context = mock(CobolPreprocessor.WorkingStorageSectionContext.class);

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

}
