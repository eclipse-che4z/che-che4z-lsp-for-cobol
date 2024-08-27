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
import org.eclipse.lsp.cobol.common.error.SyntaxError;

import java.util.List;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_receive;

/** Manages trafic for CICS parser options checking */
public class CICSOptionsCheckUtility {
  private final CICSReceiveOptionsCheckUtility receiveUtility;

  public CICSOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    receiveUtility = new CICSReceiveOptionsCheckUtility(context, errors);
  }

  /**
   * Entrypoint to check CICS rule options
   *
   * @param ctx ParserRuleContext subclass containging options
   * @param parentIndex Index used to determine what Rule Set to check against
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx, int parentIndex) {
    switch (parentIndex) {
      case (RULE_cics_receive):
        receiveUtility.checkOptions(ctx);
      default:
        break;
    }
  }
}
