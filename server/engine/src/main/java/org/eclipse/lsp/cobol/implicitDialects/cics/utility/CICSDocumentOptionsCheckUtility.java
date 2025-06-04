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
package org.eclipse.lsp.cobol.implicitDialects.cics.utility;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_document;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

/** Checks CICS DOCUMENT rules for required and invalid options */
public class CICSDocumentOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
  public static final int RULE_INDEX = RULE_cics_document;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.CREATE, ErrorSeverity.WARNING);
          put(CICSLexer.DELETE, ErrorSeverity.WARNING);
          put(CICSLexer.INSERT, ErrorSeverity.WARNING);
          put(CICSLexer.RETRIEVE, ErrorSeverity.WARNING);
          put(CICSLexer.SET, ErrorSeverity.WARNING);
          put(CICSLexer.DOCTOKEN, ErrorSeverity.ERROR);
          put(CICSLexer.FROM, ErrorSeverity.ERROR);
          put(CICSLexer.TEXT, ErrorSeverity.ERROR);
          put(CICSLexer.BINARY, ErrorSeverity.ERROR);
          put(CICSLexer.LENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.FROMDOC, ErrorSeverity.ERROR);
          put(CICSLexer.TEMPLATE, ErrorSeverity.ERROR);
          put(CICSLexer.SYMBOLLIST, ErrorSeverity.ERROR);
          put(CICSLexer.LISTLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.DELIMITER, ErrorSeverity.ERROR);
          put(CICSLexer.UNESCAPED, ErrorSeverity.WARNING);
          put(CICSLexer.DOCSIZE, ErrorSeverity.ERROR);
          put(CICSLexer.HOSTCODEPAGE, ErrorSeverity.ERROR);
          put(CICSLexer.SYMBOL, ErrorSeverity.ERROR);
          put(CICSLexer.BOOKMARK, ErrorSeverity.ERROR);
          put(CICSLexer.AT, ErrorSeverity.ERROR);
          put(CICSLexer.TO, ErrorSeverity.ERROR);
          put(CICSLexer.INTO, ErrorSeverity.ERROR);
          put(CICSLexer.MAXLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.CHARACTERSET, ErrorSeverity.ERROR);
          put(CICSLexer.DATAONLY, ErrorSeverity.WARNING);
          put(CICSLexer.VALUE, ErrorSeverity.ERROR);
        }
      };

  public CICSDocumentOptionsCheckUtility(
      DialectProcessingContext context,
      List<SyntaxError> errors,
      CICSCheckUtilityParameters params) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS, params);
  }

  /**
   * Entrypoint to check CICS DOCUMENT rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    switch (ctx.getRuleIndex()) {
      case CICSParser.RULE_cics_document_create:
        checkDocumentCreate((CICSParser.Cics_document_createContext) ctx);
        break;
      case CICSParser.RULE_cics_document_delete:
        checkDocumentDelete((CICSParser.Cics_document_deleteContext) ctx);
        break;
      case CICSParser.RULE_cics_document_insert:
        checkDocumentInsert((CICSParser.Cics_document_insertContext) ctx);
        break;
      case CICSParser.RULE_cics_document_retrieve:
        checkDocumentRetrieve((CICSParser.Cics_document_retrieveContext) ctx);
        break;
      case CICSParser.RULE_cics_document_set:
        checkDocumentSet((CICSParser.Cics_document_setContext) ctx);
        break;
      default:
        break;
    }
    checkDuplicates(ctx);
  }

  @SuppressWarnings("unchecked")
  private void checkDocumentCreate(CICSParser.Cics_document_createContext ctx) {
    checkHasMandatoryOptions(ctx.CREATE(), ctx, "CREATE");
    checkHasMandatoryOptions(ctx.DOCTOKEN(), ctx, "DOCTOKEN");
    if (!ctx.LENGTH().isEmpty()) {
      checkHasExactlyOneOption("FROM, TEXT or BINARY", ctx, ctx.FROM(), ctx.TEXT(), ctx.BINARY());
    }
    if (!ctx.FROM().isEmpty() || !ctx.TEXT().isEmpty() || !ctx.BINARY().isEmpty()) {
      checkHasMandatoryOptions(ctx.LENGTH(), ctx, "LENGTH");
    }
    checkHasMutuallyExclusiveOptions(
        "LENGTH, FROMDOC or TEMPLATE", ctx.LENGTH(), ctx.FROMDOC(), ctx.TEMPLATE());
    if (!ctx.DELIMITER().isEmpty() || !ctx.UNESCAPED().isEmpty()) {
      checkHasMandatoryOptions(ctx.SYMBOLLIST(), ctx, "SYMBOLLIST");
      checkHasMandatoryOptions(ctx.LISTLENGTH(), ctx, "LISTLENGTH");
    }
    checkAllOptionsArePresentOrAbsent(
        "SYMBOLLIST, LISTLENGTH", ctx, ctx.SYMBOLLIST(), ctx.LISTLENGTH());
  }

  private void checkDocumentDelete(CICSParser.Cics_document_deleteContext ctx) {
    checkHasMandatoryOptions(ctx.DELETE(), ctx, "DELETE");
    checkHasMandatoryOptions(ctx.DOCTOKEN(), ctx, "DOCTOKEN");
  }

  @SuppressWarnings("unchecked")
  private void checkDocumentInsert(CICSParser.Cics_document_insertContext ctx) {
    checkHasMandatoryOptions(ctx.INSERT(), ctx, "INSERT");
    checkHasMandatoryOptions(ctx.DOCTOKEN(), ctx, "DOCTOKEN");
    if (!ctx.FROM().isEmpty() || !ctx.TEXT().isEmpty() || !ctx.BINARY().isEmpty()) {
      checkHasMandatoryOptions(ctx.LENGTH(), ctx, "LENGTH");
    }
    if (!ctx.LENGTH().isEmpty()) {
      checkHasExactlyOneOption("FROM, TEXT or BINARY", ctx, ctx.FROM(), ctx.TEXT(), ctx.BINARY());
    }
    checkHasMutuallyExclusiveOptions("FROM, TEXT or BINARY", ctx.FROM(), ctx.TEXT(), ctx.BINARY());
    checkHasExactlyOneOption(
        "LENGTH, SYMBOL, TEMPLATE, FROMDOC or BOOKMARK",
        ctx,
        ctx.LENGTH(),
        ctx.SYMBOL(),
        ctx.TEMPLATE(),
        ctx.FROMDOC(),
        ctx.BOOKMARK());
    checkPrerequisiteIsMet(ctx.AT(), ctx.TO(), ctx, "TO");
  }

  private void checkDocumentRetrieve(CICSParser.Cics_document_retrieveContext ctx) {
    checkHasMandatoryOptions(ctx.RETRIEVE(), ctx, "RETRIEVE");
    checkHasMandatoryOptions(ctx.DOCTOKEN(), ctx, "DOCTOKEN");
    checkHasMandatoryOptions(ctx.INTO(), ctx, "INTO");
    checkHasMandatoryOptions(ctx.LENGTH(), ctx, "LENGTH");
  }

  @SuppressWarnings("unchecked")
  private void checkDocumentSet(CICSParser.Cics_document_setContext ctx) {
    checkHasMandatoryOptions(ctx.SET(), ctx, "SET");
    checkHasMandatoryOptions(ctx.LENGTH(), ctx, "LENGTH");
    checkHasMandatoryOptions(ctx.DOCTOKEN(), ctx, "DOCTOKEN");
    checkAllOptionsArePresentOrAbsent("SYMBOL, VALUE", ctx, ctx.SYMBOL(), ctx.VALUE());
    checkHasExactlyOneOption("SYMBOL or SYMBOLLIST", ctx, ctx.SYMBOL(), ctx.SYMBOLLIST());
    if (!ctx.DELIMITER().isEmpty()) {
      checkHasMandatoryOptions(ctx.SYMBOLLIST(), ctx, "SYMBOLLIST");
    }
  }
}
