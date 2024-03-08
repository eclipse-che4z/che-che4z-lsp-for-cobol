/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.core.visitor;

import com.google.common.collect.ImmutableList;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.core.CobolDataDivisionParser.*;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * Test for {@link CobolDataDivisionVisitor}
 */
@ExtendWith(MockitoExtension.class)
class CobolDataDivisionVisitorTest {
    @Mock
    private ExtendedDocument extendedDocument;
    @Mock
    private CopybooksRepository copybooks;
    @Mock
    private MessageService messageService;
    @Mock
    private Map<String, CobolParser.FileControlEntryContext> fileControls;

    private CobolDataDivisionVisitor visitor;
    private Location location;

    @BeforeEach
    void init() {
        visitor = new CobolDataDivisionVisitor(extendedDocument, copybooks,
                messageService, fileControls);
        Range range = new Range(new Position(1, 1), new Position(2, 2));
        location = new Location("URI", range);
    }

    @Test
    void testVisitDataDivision() {
        DataDivisionContext ctx = mock(DataDivisionContext.class);
        ctx.start = mock(Token.class);
        ctx.stop = mock(Token.class);
        Token token = mock(Token.class);
        when(ctx.getStart()).thenReturn(token);
        when(token.getText()).thenReturn("TEXT");
        when(extendedDocument.mapLocation(any())).thenReturn(location);
        List<Node> result = visitor.visitDataDivision(ctx);

        assertEquals(NodeType.DIVISION, result.get(0).getNodeType());
        assertEquals(location, result.get(0).getLocality().toLocation());
    }

    @Test
    void testVisitQualifiedDataName() {
        QualifiedDataNameContext ctx = mock(QualifiedDataNameContext.class);
        ctx.start = mock(Token.class);
        ctx.stop = mock(Token.class);
        when(extendedDocument.mapLocation(any())).thenReturn(location);
        List<Node> result = visitor.visitQualifiedDataName(ctx);

        assertEquals(NodeType.QUALIFIED_REFERENCE_NODE, result.get(0).getNodeType());
        assertEquals(location, result.get(0).getLocality().toLocation());
    }

    @Test
    void testVisitVariableUsageName() {
        VariableUsageNameContext ctx = mock(VariableUsageNameContext.class);
        ctx.start = mock(Token.class);
        ctx.stop = mock(Token.class);
        when(extendedDocument.mapLocation(any())).thenReturn(location);
        List<Node> result = visitor.visitVariableUsageName(ctx);

        assertEquals(NodeType.VARIABLE_USAGE, result.get(0).getNodeType());
        assertEquals(location, result.get(0).getLocality().toLocation());
    }

    @Test
    void testVisitDataDivisionSection() {
        DataDivisionSectionContext ctx = mock(DataDivisionSectionContext.class);
        Token token = mock(Token.class);
        when(ctx.getStart()).thenReturn(token);
        when(token.getText()).thenReturn("TEXT");
        when(extendedDocument.mapLocation(any())).thenReturn(location);
        List<Node> result = visitor.visitDataDivisionSection(ctx);

        assertEquals(ImmutableList.of(), result);
    }

    @Test
    void testVisitFileSection() {
        FileSectionContext ctx = mock(FileSectionContext.class);
        ctx.start = mock(Token.class);
        ctx.stop = mock(Token.class);
        when(extendedDocument.mapLocation(any())).thenReturn(location);
        List<Node> result = visitor.visitFileSection(ctx);

        assertEquals(NodeType.SECTION, result.get(0).getNodeType());
        assertEquals(location, result.get(0).getLocality().toLocation());
    }

    @Test
    void testVisitWorkingStorageSection() {
        WorkingStorageSectionContext ctx = mock(WorkingStorageSectionContext.class);
        ctx.start = mock(Token.class);
        ctx.stop = mock(Token.class);
        when(extendedDocument.mapLocation(any())).thenReturn(location);
        List<Node> result = visitor.visitWorkingStorageSection(ctx);

        assertEquals(NodeType.SECTION, result.get(0).getNodeType());
        assertEquals(location, result.get(0).getLocality().toLocation());
    }

    @Test
    void testVisitLinkageSection() {
        LinkageSectionContext ctx = mock(LinkageSectionContext.class);
        ctx.start = mock(Token.class);
        ctx.stop = mock(Token.class);
        when(extendedDocument.mapLocation(any())).thenReturn(location);
        List<Node> result = visitor.visitLinkageSection(ctx);

        assertEquals(NodeType.SECTION, result.get(0).getNodeType());
        assertEquals(location, result.get(0).getLocality().toLocation());
    }

    @Test
    void testVisitLocalStorageSection() {
        LocalStorageSectionContext ctx = mock(LocalStorageSectionContext.class);
        ctx.start = mock(Token.class);
        ctx.stop = mock(Token.class);
        when(extendedDocument.mapLocation(any())).thenReturn(location);
        List<Node> result = visitor.visitLocalStorageSection(ctx);

        assertEquals(NodeType.SECTION, result.get(0).getNodeType());
        assertEquals(location, result.get(0).getLocality().toLocation());
    }

    @Test
    void testVisitDataDescriptionEntryFormat1() {
        DataDescriptionEntryFormat1Context ctx = mock(DataDescriptionEntryFormat1Context.class);
        when(ctx.levelNumber()).thenReturn(mock(LevelNumberContext.class));
        TerminalNode terminalNode = mock(TerminalNode.class);
        when(ctx.levelNumber().LEVEL_NUMBER()).thenReturn(terminalNode);
        when(terminalNode.getText()).thenReturn("1");
        Token token = mock(Token.class);
        when(token.getText()).thenReturn("TEXT");
        when(terminalNode.getSymbol()).thenReturn(token);
        when(extendedDocument.mapLocation(any())).thenReturn(mock(Location.class));
        ctx.start = mock(Token.class);
        ctx.stop = mock(Token.class);
        when(ctx.start.getLine()).thenReturn(1);
        List<Node> result = visitor.visitDataDescriptionEntryFormat1(ctx);

        assertEquals(result.get(0).getNodeType(), NodeType.VARIABLE_DEFINITION);
    }

    @Test
    void testVisitDataDescriptionEntryFormat1_exception() {
        DataDescriptionEntryFormat1Context ctx = mock(DataDescriptionEntryFormat1Context.class);
        when(ctx.levelNumber()).thenReturn(mock(LevelNumberContext.class));
        TerminalNode terminalNode = mock(TerminalNode.class);
        when(ctx.levelNumber().LEVEL_NUMBER()).thenReturn(terminalNode);
        when(terminalNode.getText()).thenReturn("1");
        Token token = mock(Token.class);
        when(token.getText()).thenReturn("TEXT");
        when(terminalNode.getSymbol()).thenReturn(token);
        when(extendedDocument.mapLocation(any())).thenThrow(new IllegalStateException("Illegal State"));
        ctx.start = mock(Token.class);
        ctx.stop = mock(Token.class);
        try {
            visitor.visitDataDescriptionEntryFormat1(ctx);
        } catch (IllegalStateException e) {
            assertEquals("Illegal State", e.getMessage());
        }
    }

    @Test
    void testVisitFileDescriptionEntry() {
        FileDescriptionEntryContext ctx = mock(FileDescriptionEntryContext.class);
        CobolWordContext cobolWordContext =  mock(CobolWordContext.class);
        FileDescriptionEntryClausesContext entryClausesContext = mock(FileDescriptionEntryClausesContext.class);
        Token token = mock(Token.class);
        when(ctx.getStart()).thenReturn(token);
        when(token.getText()).thenReturn("TEXT");
        when((ctx.fileDescriptionEntryClauses())).thenReturn(entryClausesContext);
        when(ctx.fileDescriptionEntryClauses().cobolWord()).thenReturn(cobolWordContext);
        cobolWordContext.start = mock(Token.class);
        cobolWordContext.stop = mock(Token.class);
        when(ctx.fileDescriptionEntryClauses().getStart()).thenReturn(mock(Token.class));
        when(ctx.fileDescriptionEntryClauses().getStop()).thenReturn(mock(Token.class));
        when(ctx.fileDescriptionEntryClauses().getStart().getInputStream()).thenReturn(mock(CharStream.class));
        when(extendedDocument.mapLocation(any())).thenReturn(location);
        List<Node> result = visitor.visitFileDescriptionEntry(ctx);

        assertEquals(result.get(0).getLocality().getRange().getStart(), new Position(1, 1));
        assertEquals(result.get(0).getLocality().getRange().getEnd(), new Position(2, 2));
    }

    @Test
    void testVisitDataDescriptionEntryFormat2() {
        DataDescriptionEntryFormat2Context ctx = mock(DataDescriptionEntryFormat2Context.class);
        Token token = mock(Token.class);
        when(token.getText()).thenReturn("TEXT");
        TerminalNode terminalNode = mock(TerminalNode.class);
        when(ctx.LEVEL_NUMBER_66()).thenReturn(terminalNode);
        when(terminalNode.getSymbol()).thenReturn(token);
        ctx.start = mock(Token.class);
        ctx.stop = mock(Token.class);
        when(extendedDocument.mapLocation(any())).thenReturn(location);
        List<Node> result = visitor.visitDataDescriptionEntryFormat2(ctx);

        assertEquals(result.get(0).getLocality().getRange().getStart(), new Position(1, 1));
        assertEquals(result.get(0).getLocality().getRange().getEnd(), new Position(2, 2));
    }

    @Test
    void testVisitDataDescriptionEntryFormat1Level77() {
        DataDescriptionEntryFormat1Level77Context ctx = mock(DataDescriptionEntryFormat1Level77Context.class);
        Token token = mock(Token.class);
        when(token.getText()).thenReturn("TEXT");
        TerminalNode terminalNode = mock(TerminalNode.class);
        when(ctx.LEVEL_NUMBER_77()).thenReturn(terminalNode);
        when(terminalNode.getSymbol()).thenReturn(token);
        ctx.start = mock(Token.class);
        ctx.stop = mock(Token.class);
        when(extendedDocument.mapLocation(any())).thenReturn(location);
        List<Node> result = visitor.visitDataDescriptionEntryFormat1Level77(ctx);

        assertEquals(result.get(0).getLocality().getRange().getStart(), new Position(1, 1));
        assertEquals(result.get(0).getLocality().getRange().getEnd(), new Position(2, 2));
    }

    @Test
    void testVisitDataDescriptionEntryFormat3() {
        DataDescriptionEntryFormat3Context ctx = mock(DataDescriptionEntryFormat3Context.class);
        List<Node> result = visitor.visitDataDescriptionEntryFormat3(ctx);

        assertEquals(ImmutableList.of(), result);
    }
}
