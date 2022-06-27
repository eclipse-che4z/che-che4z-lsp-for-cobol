package org.eclipse.lsp.cobol.core.engine.dialects.idms;

import lombok.Data;
import org.eclipse.lsp.cobol.core.IdmsParser;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectUtils;
import org.eclipse.lsp.cobol.core.model.Locality;

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

@Data
public class IdmsCopybookDescriptor {
  String name;
  Locality usage;

  public static IdmsCopybookDescriptor from(IdmsParser.CopyIdmsStatementContext ctx, String programDocumentUri) {
    IdmsCopybookDescriptor result = new IdmsCopybookDescriptor();
    result.name = getName(ctx);
    result.usage = Locality.builder()
            .uri(programDocumentUri)
            .range(DialectUtils.constructRange(ctx))
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
    return null;
  }
}
