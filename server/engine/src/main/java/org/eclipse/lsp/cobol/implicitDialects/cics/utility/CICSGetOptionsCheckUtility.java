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

import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_get;

/** Checks CICS Get rules for required and invalid options */
public class CICSGetOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
  public static final int RULE_INDEX = RULE_cics_get;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.GET, ErrorSeverity.ERROR);
          put(CICSLexer.CONTAINER, ErrorSeverity.ERROR);
          put(CICSLexer.ACTIVITY, ErrorSeverity.ERROR);
          put(CICSLexer.ACQACTIVITY, ErrorSeverity.WARNING);
          put(CICSLexer.PROCESS, ErrorSeverity.WARNING);
          put(CICSLexer.ACQPROCESS, ErrorSeverity.WARNING);
          put(CICSLexer.FLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.INTO, ErrorSeverity.ERROR);
          put(CICSLexer.SET, ErrorSeverity.ERROR);
          put(CICSLexer.NODATA, ErrorSeverity.WARNING);
          put(CICSLexer.CHANNEL, ErrorSeverity.ERROR);
          put(CICSLexer.BYTEOFFSET, ErrorSeverity.ERROR);
          put(CICSLexer.INTOCCSID, ErrorSeverity.ERROR);
          put(CICSLexer.INTOCODEPAGE, ErrorSeverity.ERROR);
          put(CICSLexer.CCSID, ErrorSeverity.ERROR);
          put(CICSLexer.CONVERTST, ErrorSeverity.ERROR);
          put(CICSLexer.COUNTER, ErrorSeverity.ERROR);
          put(CICSLexer.DCOUNTER, ErrorSeverity.ERROR);
          put(CICSLexer.POOL, ErrorSeverity.ERROR);
          put(CICSLexer.VALUE, ErrorSeverity.ERROR);
          put(CICSLexer.INCREMENT, ErrorSeverity.ERROR);
          put(CICSLexer.COMPAREMIN, ErrorSeverity.ERROR);
          put(CICSLexer.COMPAREMAX, ErrorSeverity.ERROR);
          put(CICSLexer.REDUCE, ErrorSeverity.WARNING);
          put(CICSLexer.WRAP, ErrorSeverity.WARNING);
          put(CICSLexer.NOSUSPEND, ErrorSeverity.WARNING);
        }
      };

  public CICSGetOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS Get rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    switch (ctx.getRuleIndex()) {
      case CICSParser.RULE_cics_get_container_bts:
        checkContainerBTS((CICSParser.Cics_get_container_btsContext) ctx);
        break;
      case CICSParser.RULE_cics_get_container_channel:
        checkContainerChannel((CICSParser.Cics_get_container_channelContext) ctx);
        break;
      case CICSParser.RULE_cics_get_counter_dcounter:
        checkCounterDcounter((CICSParser.Cics_get_counter_dcounterContext) ctx);
        break;
      default:
        break;
    }
    checkDuplicates(ctx);
  }

  @SuppressWarnings("unchecked")
  private void checkContainerBTS(CICSParser.Cics_get_container_btsContext ctx) {
    checkHasMandatoryOptions(ctx.CONTAINER(), ctx, "CONTAINER");
    checkHasMutuallyExclusiveOptions("ACTIVITY or ACQACTIVITY or PROCESS or ACQPROCESS", ctx.ACTIVITY(),
            ctx.ACQACTIVITY(), ctx.PROCESS(), ctx.ACQPROCESS());
    checkHasExactlyOneOption("INTO or SET or NODATA", ctx, ctx.INTO(), ctx.SET(), ctx.NODATA());
  }

  @SuppressWarnings("unchecked")
  private void checkContainerChannel(CICSParser.Cics_get_container_channelContext ctx) {
    checkHasMandatoryOptions(ctx.CONTAINER(), ctx, "CONTAINER");
    checkHasExactlyOneOption("INTO or SET or NODATA", ctx, ctx.INTO(), ctx.SET(), ctx.NODATA());
    if (!ctx.BYTEOFFSET().isEmpty() || !ctx.SET().isEmpty() || !ctx.NODATA().isEmpty()) {
      checkHasMandatoryOptions(ctx.FLENGTH(), ctx, "FLENGTH");
    }
    checkHasMutuallyExclusiveOptions("INTOCCSID or INTOCODEPAGE or CONVERTST",
            ctx.INTOCCSID(), ctx.INTOCODEPAGE(), ctx.CONVERTST());
    if (!ctx.CCSID().isEmpty()) {
      checkHasMandatoryOptions(ctx.CONVERTST(), ctx, "CONVERTST");
    }
  }

  @SuppressWarnings("unchecked")
  private void checkCounterDcounter(CICSParser.Cics_get_counter_dcounterContext ctx) {
    checkHasExactlyOneOption("COUNTER or DCOUNTER", ctx, ctx.COUNTER(), ctx.DCOUNTER());
    checkHasMandatoryOptions(ctx.VALUE(), ctx, "VALUE");
    if (!ctx.REDUCE().isEmpty()) {
      checkHasMandatoryOptions(ctx.INCREMENT(), ctx, "INCREMENT");
    }
  }
}
