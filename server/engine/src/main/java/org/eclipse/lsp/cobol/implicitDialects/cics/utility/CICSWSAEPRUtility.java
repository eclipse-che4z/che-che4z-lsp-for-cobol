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
import java.util.stream.Stream;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_wsaepr;

/** Checks CICS WSAEPR rules for required and invalid options */
public class CICSWSAEPRUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_wsaepr;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.WSAEPR, ErrorSeverity.ERROR);
          put(CICSLexer.CREATE, ErrorSeverity.ERROR);
          put(CICSLexer.EPRINTO, ErrorSeverity.ERROR);
          put(CICSLexer.EPRSET, ErrorSeverity.ERROR);
          put(CICSLexer.EPRLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.ADDRESS, ErrorSeverity.ERROR);
          put(CICSLexer.REFPARMS, ErrorSeverity.ERROR);
          put(CICSLexer.REFPARMSLEN, ErrorSeverity.ERROR);
          put(CICSLexer.METADATA, ErrorSeverity.ERROR);
          put(CICSLexer.METADATALEN, ErrorSeverity.ERROR);
          put(CICSLexer.FROMCCSID, ErrorSeverity.ERROR);
          put(CICSLexer.FROMCODEPAGE, ErrorSeverity.ERROR);
        }
      };

  public CICSWSAEPRUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS ReadNext RedPrev rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    if (ctx.getParent().getRuleIndex() == CICSParser.RULE_cics_wsaepr) {
      checkWSAEPR((CICSParser.Cics_wsaeprContext) ctx.getParent());
    }
    checkDuplicates(ctx.getParent());
  }

  private void checkWSAEPR(CICSParser.Cics_wsaeprContext ctx) {
    checkHasMandatoryOptions(ctx.CREATE(), ctx, "CREATE");
    checkHasExactlyOneOption("EPRINTO or EPRSET", ctx, ctx.EPRINTO(), ctx.EPRSET());
    checkHasMandatoryOptions(ctx.EPRLENGTH(), ctx, "EPRLENGTH");

    List<TerminalNode> options = Stream.of(ctx.ADDRESS(), ctx.REFPARMS(), ctx.METADATA())
            .flatMap(List::stream)
            .collect(Collectors.toList());
    checkHasMandatoryOptions(options, ctx, "ADDRESS or REFPARMS or METADATA");
    if (ctx.REFPARMS().isEmpty()) checkHasIllegalOptions(ctx.REFPARMSLEN(), "REFPARMSLEN without REFPARMS");
    if (ctx.METADATA().isEmpty()) checkHasIllegalOptions(ctx.METADATALEN(), "METADATALEN without METADATA");
    checkHasMutuallyExclusiveOptions("FROMCCSID or FROMCODEPAGE", ctx.FROMCCSID(), ctx.FROMCODEPAGE());
  }
}
