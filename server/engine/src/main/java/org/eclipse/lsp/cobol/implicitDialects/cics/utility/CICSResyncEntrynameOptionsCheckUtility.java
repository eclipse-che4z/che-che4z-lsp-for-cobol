/*
 * Copyright (c) 2025 Broadcom.
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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_resync_entryname;
import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_resync_entryname_opts;

import java.util.*;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

/** Checks CICS RESYNC ENTRYNAME rules for required and invalid options */
public class CICSResyncEntrynameOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_resync_entryname;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.ENTRYNAME, ErrorSeverity.ERROR);
          put(CICSLexer.QUALIFIER, ErrorSeverity.ERROR);
          put(CICSLexer.IDLIST, ErrorSeverity.ERROR);
          put(CICSLexer.IDLISTLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.PARTIAL, ErrorSeverity.WARNING);
        }
      };

  public CICSResyncEntrynameOptionsCheckUtility(
      DialectProcessingContext context,
      List<SyntaxError> errors,
      CICSCheckUtilityParameters params) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS, params);
  }

  /**
   * Entrypoint to check CICS RESYNC ENTRYNAME System Command rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    if (ctx.getRuleIndex() == RULE_cics_resync_entryname_opts)
      checkOpts((CICSParser.Cics_resync_entryname_optsContext) ctx);
    checkDuplicates(ctx);
  }

  @SuppressWarnings("unchecked")
  private void checkOpts(CICSParser.Cics_resync_entryname_optsContext ctx) {
    checkHasMandatoryOptions(ctx.ENTRYNAME(), ctx, "ENTRYNAME");
    checkOptionalWithLength(ctx.IDLIST(), ctx.IDLISTLENGTH(), ctx, "IDLIST", "IDLISTLENGTH");
  }
}
