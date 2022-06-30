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
package org.eclipse.lsp.cobol.core.engine.dialects.idms;

import lombok.Data;
import org.eclipse.lsp.cobol.core.IdmsParser;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectUtils;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp4j.Range;

/*
 * copyIdmsOptions
 *     : (RECORD copyIdmsSource versionClause? (REDEFINES cobolWord)?)
 *     | (FILE copyIdmsSource versionClause?)
 *     | ((MAP | MAP_CONTROL) copyIdmsSource)
 *     | (MODULE? copyIdmsSource versionClause?)
 *     ;
 *
 * copyIdmsSource
 *     : copySource
 *     ;
 *
 * copySource
 *    : (literal | cobolWord | SUBSCHEMA_NAMES) ((OF | IN) copyLibrary)?
 *    ;
 *
 * copyLibrary
 *    : literal | cobolWord
 *    ;
 */

/**
 * Description of IDMS copybook
 */
@Data
public class IdmsCopybookDescriptor {
  String name;
  Locality usage;

  /**
   * Factory method for copybook description object
   * @param ctx IDMS copybook rule context
   * @param programDocumentUri uri of file
   * @return copybook descriptor
   */
  public static IdmsCopybookDescriptor from(IdmsParser.CopyIdmsStatementContext ctx, String programDocumentUri) {
    IdmsCopybookDescriptor result = new IdmsCopybookDescriptor();
    result.name = getName(ctx);
    Range range = DialectUtils.constructRange(ctx);
    result.usage = Locality.builder()
            .uri(programDocumentUri)
            .range(range)
            .build();
    return result;
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
