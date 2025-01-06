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

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

import java.util.*;
import java.util.stream.Collectors;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_readnext_readprev;

/** Checks CICS ReadNext ReadPrev rules for required and invalid options */
public class CICSReadNextReadPrevOptionsUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_readnext_readprev;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.READNEXT, ErrorSeverity.ERROR);
          put(CICSLexer.READPREV, ErrorSeverity.ERROR);
          put(CICSLexer.FILE, ErrorSeverity.ERROR);
          put(CICSLexer.INTO, ErrorSeverity.ERROR);
          put(CICSLexer.SET, ErrorSeverity.ERROR);
          put(CICSLexer.UNCOMMITTED, ErrorSeverity.WARNING);
          put(CICSLexer.CONSISTENT, ErrorSeverity.WARNING);
          put(CICSLexer.REPEATABLE, ErrorSeverity.WARNING);
          put(CICSLexer.UPDATE, ErrorSeverity.ERROR);
          put(CICSLexer.TOKEN, ErrorSeverity.ERROR);
          put(CICSLexer.RIDFLD, ErrorSeverity.ERROR);
          put(CICSLexer.KEYLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.REQID, ErrorSeverity.ERROR);
          put(CICSLexer.SYSID, ErrorSeverity.ERROR);
          put(CICSLexer.LENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.RBA, ErrorSeverity.WARNING);
          put(CICSLexer.RRN, ErrorSeverity.WARNING);
          put(CICSLexer.XRBA, ErrorSeverity.WARNING);
          put(CICSLexer.NOSUSPEND, ErrorSeverity.WARNING);
        }
      };

  public CICSReadNextReadPrevOptionsUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS ReadNext RedPrev rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    if (ctx.getParent().getRuleIndex() == CICSParser.RULE_cics_readnext_readprev) {
      checkReadNextReadPrev((CICSParser.Cics_readnext_readprevContext) ctx.getParent());
    }
    checkDuplicates(ctx.getParent());
  }

  @SuppressWarnings("unchecked")
  private void checkReadNextReadPrev(CICSParser.Cics_readnext_readprevContext ctx) {
    checkHasMandatoryOptions(ctx.cics_file_name(), ctx, "FILE");
    List<TerminalNode> file = ctx.cics_file_name().stream().map(CICSParser.Cics_file_nameContext::FILE).collect(Collectors.toList());
    List<TerminalNode> dataset = ctx.cics_file_name().stream().map(CICSParser.Cics_file_nameContext::DATASET).collect(Collectors.toList());
    checkHasMutuallyExclusiveOptions("FILE or DATASET", file, dataset);

    checkHasMandatoryOptions(ctx.RIDFLD(), ctx, "RIDFLD");
    checkHasExactlyOneOption("INTO or SET", ctx, ctx.INTO(), ctx.SET());
    checkHasMutuallyExclusiveOptions(
            "READNEXT or READPREV", Collections.singletonList(ctx.READNEXT()), Collections.singletonList(ctx.READPREV()));
    checkHasMutuallyExclusiveOptions(
            "UNCOMMITTED or CONSISTENT or REPEATABLE or UPDATE", ctx.UNCOMMITTED(), ctx.CONSISTENT(), ctx.REPEATABLE(), ctx.UPDATE());

    if (!ctx.UPDATE().isEmpty() && ctx.TOKEN().isEmpty()) {
      checkHasIllegalOptions(ctx.UPDATE(), "UPDATE without TOKEN");
    } else if (!ctx.TOKEN().isEmpty() && ctx.UPDATE().isEmpty()) {
      checkHasIllegalOptions(ctx.TOKEN(), "TOKEN without UPDATE");
    }

    if (!ctx.SYSID().isEmpty() && ctx.LENGTH().isEmpty()) {
      checkHasIllegalOptions(ctx.UPDATE(), "SYSID without LENGTH");
    }

    checkHasMutuallyExclusiveOptions("RBA or RRN or XRBA", ctx.RBA(), ctx.RRN(), ctx.XRBA());
  }
}
