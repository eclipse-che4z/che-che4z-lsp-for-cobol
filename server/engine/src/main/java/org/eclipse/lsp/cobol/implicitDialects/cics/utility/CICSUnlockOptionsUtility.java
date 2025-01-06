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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_unlock;

/** Checks CICS UNLOCK rules for required and invalid options */
public class CICSUnlockOptionsUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_unlock;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.UNLOCK, ErrorSeverity.ERROR);
          put(CICSLexer.FILE, ErrorSeverity.ERROR);
          put(CICSLexer.DATASET, ErrorSeverity.ERROR);
          put(CICSLexer.TOKEN, ErrorSeverity.ERROR);
          put(CICSLexer.SYSID, ErrorSeverity.ERROR);
        }
      };

  public CICSUnlockOptionsUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS UNLOCK rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    if (ctx.getParent().getRuleIndex() == CICSParser.RULE_cics_unlock) {
      checkUnlock((CICSParser.Cics_unlockContext) ctx.getParent());
    }
    checkDuplicates(ctx.getParent());
  }

  @SuppressWarnings("unchecked")
  private void checkUnlock(CICSParser.Cics_unlockContext ctx) {
    checkHasMandatoryOptions(ctx.cics_file_name(), ctx, "FILE");
    List<TerminalNode> file = ctx.cics_file_name().stream().map(CICSParser.Cics_file_nameContext::FILE).collect(Collectors.toList());
    List<TerminalNode> dataset = ctx.cics_file_name().stream().map(CICSParser.Cics_file_nameContext::DATASET).collect(Collectors.toList());
    checkHasMutuallyExclusiveOptions("FILE or DATASET", file, dataset);
  }
}
