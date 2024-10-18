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

import lombok.Data;
import org.antlr.v4.runtime.Token;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.Uri;
import org.eclipse.lsp4j.Range;

/**
 * Description of IDMS copybook
 */
@Data
class IdmsCopybookDescriptor {
  private String name;
  private Locality usage;
  private Locality statement;
  private Range levelRange;
  private int level;
  private boolean insert;

  /**
   * Factory method for copybook description object
   * @param ctx IDMS copybook rule context
   * @param programDocumentUri uri of file
   * @return copybook descriptor
   */
  public static IdmsCopybookDescriptor from(IdmsCopyParser.CopyIdmsStatementContext ctx, Uri programDocumentUri) {
    IdmsCopybookDescriptor result = new IdmsCopybookDescriptor();
    result.name = getName(ctx);
    Range range = DialectUtils.constructRange(ctx.copyIdmsOptions().copyIdmsSource());

    if (ctx.LEVEL_NUMBER() != null && ctx.LEVEL_NUMBER().getSymbol() != null) {
      result.levelRange = IdmsParserHelper.extractLevelRange(ctx.LEVEL_NUMBER().getSymbol());
      result.level = extractLevel(ctx.LEVEL_NUMBER().getSymbol());
    }

    result.usage = Locality.builder()
            .uri(programDocumentUri)
            .range(range)
            .build();

    result.statement = Locality.builder()
        .uri(programDocumentUri)
        .range(DialectUtils.constructRange(ctx))
        .build();

    return result;
  }

  /**
   * Factory method for copybook description object
   * @param ctx IDMS copybook rule context
   * @param programDocumentUri uri of file
   * @return copybook descriptor
   */
  public static IdmsCopybookDescriptor from(IdmsParser.CopyIdmsStatementContext ctx, Uri programDocumentUri) {
    IdmsCopybookDescriptor result = new IdmsCopybookDescriptor();
    result.name = getName(ctx);
    Range range = DialectUtils.constructRange(ctx.copyIdmsOptions().copyIdmsSource());

    if (ctx.LEVEL_NUMBER() != null && ctx.LEVEL_NUMBER().getSymbol() != null) {
      result.levelRange = IdmsParserHelper.extractLevelRange(ctx.LEVEL_NUMBER().getSymbol());
      result.level = extractLevel(ctx.LEVEL_NUMBER().getSymbol());
    }

    result.usage = Locality.builder()
        .uri(programDocumentUri)
        .range(range)
        .build();

    result.statement = Locality.builder()
        .uri(programDocumentUri)
        .range(DialectUtils.constructRange(ctx))
        .build();

    return result;
  }

  private static int extractLevel(Token token) {
    return Integer.parseInt(token.getText());
  }

  private static String getName(IdmsCopyParser.CopyIdmsStatementContext ctx) {
    IdmsCopyParser.CopySourceContext copySourceContext = ctx.copyIdmsOptions().copyIdmsSource().copySource();
    if (copySourceContext.literal() != null) {
      return copySourceContext.literal().getText();
    }

    if (copySourceContext.cobolWord() != null) {
      return copySourceContext.cobolWord().getText();
    }

    if (copySourceContext.SUBSCHEMA_NAMES() != null) {
      return copySourceContext.SUBSCHEMA_NAMES().getText();
    }
    return null;
  }

  private static String getName(IdmsParser.CopyIdmsStatementContext ctx) {
    IdmsParser.CopySourceContext copySourceContext = ctx.copyIdmsOptions().copyIdmsSource().copySource();
    if (copySourceContext.literal() != null) {
      return copySourceContext.literal().getText();
    }

    if (copySourceContext.cobolWord() != null) {
      return copySourceContext.cobolWord().getText();
    }

    if (copySourceContext.SUBSCHEMA_NAMES() != null) {
      return copySourceContext.SUBSCHEMA_NAMES().getText();
    }
    return null;
  }

}
