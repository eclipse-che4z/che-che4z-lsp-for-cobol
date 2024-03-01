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

import static org.eclipse.lsp.cobol.dialects.idms.IdmsCopyParser.*;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyBoolean;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.google.common.collect.ImmutableList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.*;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.dialects.idms.utils.TestUtils;
import org.eclipse.lsp4j.Position;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

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
    Set<CopybookName> processedCopybooks = new HashSet<>();

    visitor = new IdmsCopybookVisitor(copybookService, CopybookProcessingMode.ENABLED,
        idmsCopybookService, PROGRAM_DOCUMENT_URI, "documentUri", 1, processedCopybooks);
  }

  @Test
  void testVisitCopyIdmsStatement() {
    IdmsCopyParser.CopyIdmsStatementContext ctx = mock(IdmsCopyParser.CopyIdmsStatementContext.class);
    IdmsCopyParser.CopyIdmsOptionsContext copyContext = mock(IdmsCopyParser.CopyIdmsOptionsContext.class);
    IdmsCopyParser.CopyIdmsSourceContext sourceContext = mock(IdmsCopyParser.CopyIdmsSourceContext.class);
    CopybookName expectedCopybookName = new CopybookName("copybook", "IDMS");
    when(copybookService.resolve(any(CopybookId.class), any(CopybookName.class), anyString(), anyString(),
            anyBoolean()))
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

  @Test
  void testVisitDataDescriptionEntryFormat1() {
    DataDescriptionEntryFormat1Context ctx = mock(DataDescriptionEntryFormat1Context.class);
    when(ctx.levelNumber()).thenReturn(mock(LevelNumberContext.class));
    TerminalNode terminalNode = mock(TerminalNode.class);
    when(ctx.levelNumber().LEVEL_NUMBER()).thenReturn(terminalNode);
    when(terminalNode.getText()).thenReturn("1");
    when(terminalNode.getSymbol()).thenReturn(mock((Token.class)));
    ctx.start = mock(Token.class);
    ctx.stop = mock(Token.class);
    when(ctx.start.getLine()).thenReturn(1);
    List<Node> result = visitor.visitDataDescriptionEntryFormat1(ctx);

    assertEquals(result.get(0).getNodeType(), NodeType.VARIABLE_DEFINITION);
    assertEquals(result.get(0).getLocality().getRange().getStart(), new Position(0, 0));
    assertEquals(result.get(0).getLocality().getRange().getEnd(), new Position(-1, 0));
  }

  @Test
  void testVisitDataDescriptionEntryFormat2() {
    DataDescriptionEntryFormat2Context ctx = mock(DataDescriptionEntryFormat2Context.class);
    TerminalNode terminalNode = mock(TerminalNode.class);
    when(ctx.LEVEL_NUMBER_66()).thenReturn(terminalNode);
    when(terminalNode.getSymbol()).thenReturn(mock((Token.class)));
    ctx.start = mock(Token.class);
    ctx.stop = mock(Token.class);
    when(ctx.start.getLine()).thenReturn(1);
    List<Node> result = visitor.visitDataDescriptionEntryFormat2(ctx);

    assertEquals(result.get(0).getNodeType(), NodeType.VARIABLE_DEFINITION);
    assertEquals(result.get(0).getLocality().getRange().getStart(), new Position(0, 0));
    assertEquals(result.get(0).getLocality().getRange().getEnd(), new Position(-1, 0));
  }

  @Test
  void testVisitDataDescriptionEntryFormatLevel77() {
    DataDescriptionEntryFormat1Level77Context ctx = mock(DataDescriptionEntryFormat1Level77Context.class);
    TerminalNode terminalNode = mock(TerminalNode.class);
    when(ctx.LEVEL_NUMBER_77()).thenReturn(terminalNode);
    when(terminalNode.getSymbol()).thenReturn(mock((Token.class)));
    ctx.start = mock(Token.class);
    ctx.stop = mock(Token.class);
    when(ctx.start.getLine()).thenReturn(1);
    List<Node> result = visitor.visitDataDescriptionEntryFormat1Level77(ctx);

    assertEquals(result.get(0).getNodeType(), NodeType.VARIABLE_DEFINITION);
    assertEquals(result.get(0).getLocality().getRange().getStart(), new Position(0, 0));
    assertEquals(result.get(0).getLocality().getRange().getEnd(), new Position(-1, 0));
  }

  @Test
  void testVisitDataDescriptionEntryFormat3() {
    DataDescriptionEntryFormat3Context ctx = mock(DataDescriptionEntryFormat3Context.class);
    List<Node> result = visitor.visitDataDescriptionEntryFormat3(ctx);

    assertEquals(ImmutableList.of(), result);
  }

  @Test
  void testvisitFileDescriptionEntryNoFileDescriptionEntry() {
    FileDescriptionEntryContext ctx = mock(FileDescriptionEntryContext.class);
    List<Node> result = visitor.visitFileDescriptionEntry(ctx);

    assertEquals(ImmutableList.of(), result);
  }

  @Test
  void testvisitFileDescriptionEntry() {
    FileDescriptionEntryContext ctx = mock(FileDescriptionEntryContext.class);
    CobolWordContext cobolWordContext =  mock(CobolWordContext.class);
    FileDescriptionEntryClausesContext entryClausesContext = mock(FileDescriptionEntryClausesContext.class);
    when((ctx.fileDescriptionEntryClauses())).thenReturn(entryClausesContext);
    when(ctx.fileDescriptionEntryClauses().cobolWord()).thenReturn(cobolWordContext);
    when(cobolWordContext.getStart()).thenReturn(mock(Token.class));
    when(cobolWordContext.getStop()).thenReturn(mock(Token.class));
    cobolWordContext.start = mock(Token.class);
    cobolWordContext.stop = mock(Token.class);
    when(ctx.fileDescriptionEntryClauses().getStart()).thenReturn(mock(Token.class));
    when(ctx.fileDescriptionEntryClauses().getStop()).thenReturn(mock(Token.class));
    when(ctx.fileDescriptionEntryClauses().getStart().getInputStream()).thenReturn(mock(CharStream.class));
    List<Node> result = visitor.visitFileDescriptionEntry(ctx);

    assertEquals(result.get(0).getLocality().getRange().getStart(), new Position(-1, 0));
    assertEquals(result.get(0).getLocality().getRange().getEnd(), new Position(-1, 0));
  }
}
