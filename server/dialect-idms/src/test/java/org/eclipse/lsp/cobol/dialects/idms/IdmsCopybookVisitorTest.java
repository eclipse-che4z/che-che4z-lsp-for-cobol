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
package org.eclipse.lsp.cobol.dialects.idms;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.*;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.dialects.idms.utils.TestUtils;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyBoolean;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * Test for {@link IdmsCopybookVisitor}
 */
@ExtendWith(MockitoExtension.class)
class IdmsCopybookVisitorTest {

  private static final String PROGRAM_DOCUMENT_URI = "programDocumentUri";
  @Mock
  private CopybookService copybookService;
  @Mock
  private IdmsCopybookService idmsCopybookService;
  private IdmsCopybookVisitor visitor;

  @BeforeEach
  void init() {
    CopybookConfig copybookConfig = new CopybookConfig(CopybookProcessingMode.ENABLED, SQLBackend.DB2_SERVER);
    Set<CopybookName> processedCopybooks = new HashSet<>();

    visitor = new IdmsCopybookVisitor(copybookService, copybookConfig,
        idmsCopybookService, PROGRAM_DOCUMENT_URI, "documentUri", 1, processedCopybooks);
  }

  @Test
  void testVisitCopyIdmsStatement() {
    IdmsCopyParser.CopyIdmsStatementContext ctx = mock(IdmsCopyParser.CopyIdmsStatementContext.class);
    IdmsCopyParser.CopyIdmsOptionsContext copyContext = mock(IdmsCopyParser.CopyIdmsOptionsContext.class);
    IdmsCopyParser.CopyIdmsSourceContext sourceContext = mock(IdmsCopyParser.CopyIdmsSourceContext.class);
    CopybookName expectedCopybookName = new CopybookName("copybook", "IDMS");
    when(copybookService.resolve(any(CopybookId.class), any(CopybookName.class), anyString(), anyString(),
            any(CopybookConfig.class), anyBoolean()))
            .thenReturn(
                    new ResultWithErrors<>(
                            new CopybookModel(expectedCopybookName.toCopybookId(PROGRAM_DOCUMENT_URI), expectedCopybookName, null, null),
                            Collections.emptyList()));

    when(ctx.copyIdmsOptions()).thenReturn(copyContext);
    when(copyContext.copyIdmsSource()).thenReturn(sourceContext);

    TestUtils.addRange(sourceContext, 1, 3, 6);
    when(sourceContext.getText()).thenReturn("copybook");

    List<Node> nodes = ImmutableList.of();
    ResultWithErrors<List<Node>> expectedResult = new ResultWithErrors<>(nodes, ImmutableList.of());
    when(idmsCopybookService.processCopybook(any(), anyInt(), any())).thenReturn(expectedResult);
    List<Node> result = visitor.visitCopyIdmsStatement(ctx);

    assertEquals(expectedResult.getResult(), result);
  }

 }
