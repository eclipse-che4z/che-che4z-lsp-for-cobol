/*
 * Copyright (c) 2023 Broadcom.
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
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.variable.UsageFormat;
import org.eclipse.lsp.cobol.common.model.tree.variable.ValueInterval;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * Test for IdmsParserHelper
 */
class IdmsParserHelperTest {

  @Test
  void testRetrievePicTexts() {
    Token startToken = mock(Token.class);
    when(startToken.getText()).thenReturn("start");

    IdmsCopyParser.DataPictureClauseContext clause = mock(IdmsCopyParser.DataPictureClauseContext.class);
    when(clause.getStart()).thenReturn(startToken);
    when(clause.getText()).thenReturn("start text");

    List<String> error = IdmsParserHelper.retrievePicTexts(ImmutableList.of(clause));

    assertEquals(1, error.size());
    assertEquals("text", error.get(0));
  }

  @Test
  void testRetrieveValueIntervals() {
    IdmsCopyParser.DataValueIntervalContext context = mock(IdmsCopyParser.DataValueIntervalContext.class);
    IdmsCopyParser.DataValueIntervalFromContext from = mock(IdmsCopyParser.DataValueIntervalFromContext.class);
    IdmsCopyParser.DataValueIntervalToContext to = mock(IdmsCopyParser.DataValueIntervalToContext.class);
    IdmsCopyParser.ThruTokenContext thru = mock(IdmsCopyParser.ThruTokenContext.class);
    IdmsCopyParser.LiteralContext literal = mock(IdmsCopyParser.LiteralContext.class);

    when(from.getText()).thenReturn("from");
    when(to.literal()).thenReturn(literal);
    when(to.thruToken()).thenReturn(thru);

    when(context.dataValueIntervalFrom()).thenReturn(from);
    when(context.dataValueIntervalTo()).thenReturn(to);
    when(thru.getText()).thenReturn("thru");
    when(literal.getText()).thenReturn("to");

    List<ValueInterval> result = IdmsParserHelper.retrieveValueIntervals(ImmutableList.of(context));
    assertEquals(1, result.size());
    assertEquals("TO", result.get(0).getTo());
    assertEquals("FROM", result.get(0).getFrom());
    assertEquals("THRU", result.get(0).getThruToken());
  }

  @Test
  void testRetrieveUsageFormat() {
    IdmsCopyParser.DataUsageClauseContext clause = mock(IdmsCopyParser.DataUsageClauseContext.class);
    IdmsCopyParser.UsageFormatContext usageFormatContext = mock(IdmsCopyParser.UsageFormatContext.class);
    Token startToken = mock(Token.class);

    when(startToken.getText()).thenReturn(UsageFormat.COMPUTATIONAL_5.toDisplayString());
    when(clause.usageFormat()).thenReturn(usageFormatContext);
    when(usageFormatContext.getStart()).thenReturn(startToken);

    List<UsageFormat> result = IdmsParserHelper.retrieveUsageFormat(ImmutableList.of(clause, mock(IdmsCopyParser.DataUsageClauseContext.class)));

    assertEquals(1, result.size());
    assertEquals(UsageFormat.COMPUTATIONAL_5, result.get(0));
  }

  @Test
  void testBuildNameRangeLocality() {
    String name = "name name long long name";
    Position start = new Position(11, 5);

    ParserRuleContext ctx = mock(ParserRuleContext.class);
    Token startToken = mock(Token.class);

    when(startToken.getCharPositionInLine()).thenReturn(start.getCharacter());
    when(startToken.getLine()).thenReturn(start.getLine() + 1);
    when(ctx.getStart()).thenReturn(startToken);
    when(ctx.getStop()).thenReturn(startToken);

    Locality locality = IdmsParserHelper.buildNameRangeLocality(ctx, name, "uri");

    assertEquals(start, locality.getRange().getStart());
    assertEquals(new Position(start.getLine(), start.getCharacter() + name.length()), locality.getRange().getEnd());
    assertEquals("uri", locality.getUri());
  }

  @Test
  void testRetrieveValueToken() {
    IdmsCopyParser.ValueIsTokenContext ctx = mock(IdmsCopyParser.ValueIsTokenContext.class);
    IdmsCopyParser.ValueTokenContext valueToken = mock(IdmsCopyParser.ValueTokenContext.class);
    IdmsCopyParser.IsAreTokenContext areaToken = mock(IdmsCopyParser.IsAreTokenContext.class);

    when(valueToken.getText()).thenReturn("value");
    when(areaToken.getText()).thenReturn("area");

    when(ctx.valueToken()).thenReturn(valueToken);
    when(ctx.isAreToken()).thenReturn(areaToken);

    assertEquals("VALUE AREA", IdmsParserHelper.retrieveValueToken(ctx));
  }

  @Test
  void testRetrieveOccursToValue() {
    IdmsCopyParser.DataOccursClauseContext ctx = mock(IdmsCopyParser.DataOccursClauseContext.class);
    IdmsCopyParser.DataOccursToContext dataOccursTo = mock(IdmsCopyParser.DataOccursToContext.class);
    IdmsCopyParser.IntegerLiteralContext literal = mock(IdmsCopyParser.IntegerLiteralContext.class);

    when(literal.getText()).thenReturn("23");
    when(ctx.dataOccursTo()).thenReturn(dataOccursTo);
    when(dataOccursTo.integerLiteral()).thenReturn(literal);

    Optional<Integer> result = IdmsParserHelper.retrieveOccursToValue(ctx);
    assertTrue(result.isPresent());
    assertEquals(23, result.get());
  }

  @Test
  void testGetInteger() {
    IdmsCopyParser.IntegerLiteralContext literal = mock(IdmsCopyParser.IntegerLiteralContext.class);
    when(literal.getText()).thenReturn("23");

    assertEquals(23, IdmsParserHelper.getInteger(literal));
  }


  @Test
  void testExtractLevelRange() {
    String text = "token text";

    Token token = mock(Token.class);
    when(token.getLine()).thenReturn(10);
    when(token.getCharPositionInLine()).thenReturn(33);
    when(token.getText()).thenReturn(text);

    Range range = IdmsParserHelper.extractLevelRange(token);
    Range expectedRange = new Range(new Position(9, 33), new Position(9, 33 + text.length() - 1));
    assertEquals(expectedRange, range);
  }

}
