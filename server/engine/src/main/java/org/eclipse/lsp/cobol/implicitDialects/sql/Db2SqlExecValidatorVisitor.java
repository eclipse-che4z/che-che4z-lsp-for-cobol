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
package org.eclipse.lsp.cobol.implicitDialects.sql;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/** This visitor validates DB2 SQL semantics condition while visiting the parser tree for DB2 SQL */
@Slf4j
@AllArgsConstructor
public class Db2SqlExecValidatorVisitor extends Db2SqlExecParserBaseVisitor<List<Node>> {
  final DialectProcessingContext context;
  final CopybookService copybookService;
  final MessageService messageService;

  @Getter final List<SyntaxError> errors = new ArrayList<>();

  @Override
  public List<Node> visitDbs_integer5(Db2SqlExecParser.Dbs_integer5Context ctx) {
    validateValue(ctx, "5");
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitDbs_integer12(Db2SqlExecParser.Dbs_integer12Context ctx) {
    validateValue(ctx, "12");
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitDbs_minus_one(Db2SqlExecParser.Dbs_minus_oneContext ctx) {
    if (!ctx.INTEGERLITERAL().getText().equals("1")) {
      addSyntaxError(ctx, "parsers.validValueMsg", ctx.getText(), "-1");
    }
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitDbs_integer1200(Db2SqlExecParser.Dbs_integer1200Context ctx) {
    validateValue(ctx, "1200");
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitDbs_integer1208(Db2SqlExecParser.Dbs_integer1208Context ctx) {
    validateValue(ctx, "1208");
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitDbs_char_s(Db2SqlExecParser.Dbs_char_sContext ctx) {
    validateValue(ctx, "S");
    return super.visitDbs_char_s(ctx);
  }

  @Override
  public List<Node> visitDbs_decfloat_integer(Db2SqlExecParser.Dbs_decfloat_integerContext ctx) {
    Integer value = parseAsInt(ctx.getText());
    if (Objects.isNull(value) || !(value == 34 || value == 16)) {
      addSyntaxError(ctx, "parsers.validValueMsg", ctx.getText(), "34 or 16");
    }
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitDbs_decimal_15_31(Db2SqlExecParser.Dbs_decimal_15_31Context ctx) {
    if (!(ctx.getText().equals("15") || ctx.getText().equals("31"))) {
      addSyntaxError(ctx, "15 or 31 are only allowed");
    }
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitDbs_pagenum_char_a_r(Db2SqlExecParser.Dbs_pagenum_char_a_rContext ctx) {
    validateTokenWithRegex(ctx, "^[aArR]$", "unknown token. Expected A, R");
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitDbs_function_language(Db2SqlExecParser.Dbs_function_languageContext ctx) {
    validateTokenWithRegex(
        ctx,
        "(?i)\\b(ASSEMBLE|C|COBOL|JAVA|PLI)\\b",
        "unknown token. Supported tokens are JAVA, ASSEMBLE, C, COBOL, PLI");
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitDbs_function_parameter_style(
      Db2SqlExecParser.Dbs_function_parameter_styleContext ctx) {
    validateTokenWithRegex(
        ctx, "(?i)\\b(SQL|JAVA)\\b", "unknown token. Supported tokens are JAVA, SQL");
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitOneof_lang(Db2SqlExecParser.Oneof_langContext ctx) {
    validateTokenWithRegex(
        ctx,
        "(?i)\\b(ASSEMBLE|C|COBOL|JAVA|PLI|REXX|SQL)\\b",
        "unknown token. Supported tokens are JAVA, ASSEMBLE, C, COBOL, PLI, REXX, SQL");
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitDbs_k_m_g_identifier(Db2SqlExecParser.Dbs_k_m_g_identifierContext ctx) {
    validateTokenWithRegex(ctx, "(?i)\\b(K|M|G)\\b", "unknown token. Supported tokens is K, M, G");
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitKmg_blob_parameter(Db2SqlExecParser.Kmg_blob_parameterContext ctx) {
    validateTokenWithRegex(ctx, "(?i)^\\d+\\s*[KMG]?$", "unknown token");
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitDbs_maxPartition(Db2SqlExecParser.Dbs_maxPartitionContext ctx) {
    Integer intInputValue = parseAsInt(ctx.getText());
    if (Objects.isNull(intInputValue) || !(intInputValue >= 1 && intInputValue <= 4096)) {
      addSyntaxError(ctx, "parsers.intRangeValue", "1", "4096");
    }
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitDbs_pieceSize(Db2SqlExecParser.Dbs_pieceSizeContext ctx) {
    validateTokenWithRegex(ctx, "\\d+[MmGgKk]", "db2SqlParser.pieceSize");
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitDbs_smallint(Db2SqlExecParser.Dbs_smallintContext ctx) {
    validateTextInRange(ctx, -2, 100);
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitDbs_dsize_parameter(Db2SqlExecParser.Dbs_dsize_parameterContext ctx) {
    validateTokenWithRegex(ctx, "\\d+\\s*[Gg]", "db2SqlParser.size");
    return visitChildren(ctx);
  }

  protected void validateTextInRange(ParserRuleContext ctx, int min, int max) {
    Integer value = parseAsInt(ctx.getText());
    if (Objects.isNull(value) || !(value > min && value < max)) {
      addSyntaxError(
          ctx,
          "parsers.validValueMsg",
          ctx.getText(),
          String.format("in range %d to %d", min + 1, max - 1));
    }
  }

  protected void validateTokenWithRegex(
      ParserRuleContext ctx, String regex, String messageKey, Object... messageArgs) {
    if (!ctx.getText().matches(regex)) {
      addSyntaxError(ctx, messageKey, ctx.getText());
    }
  }

  private void validateValue(ParserRuleContext ctx, String expectedValue) {
    if (!ctx.getText().equalsIgnoreCase(expectedValue)) {
      addSyntaxError(ctx, "parsers.validValueMsg", ctx.getText(), expectedValue);
    }
  }

  void addSyntaxError(ParserRuleContext ctx, String messageKey, Object... messageArgs) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .errorSource(ErrorSource.PARSING)
            .location(getTokenEndLocality(ctx.stop).toOriginalLocation())
            .suggestion(messageService.getMessage(messageKey, messageArgs))
            .severity(ErrorSeverity.ERROR)
            .build();
    errors.add(error);
  }

  private Locality getTokenEndLocality(Token token) {
    return Locality.builder()
        .uri(context.getProgramDocumentUri())
        .range(buildTokenEndRange(token))
        .build();
  }

  private Range buildTokenEndRange(Token token) {
    Position p =
        new Position(
            token.getLine() - 1,
            token.getCharPositionInLine() + token.getStopIndex() - token.getStartIndex() + 1);
    return new Range(p, p);
  }

  private Integer parseAsInt(String value) {
    if (value == null) {
      return null;
    }
    try {
      return Integer.parseInt(value);
    } catch (NumberFormatException e) {
      return null;
    }
  }
}
