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
 *    DAF Trucks NV – implementation of DaCo COBOL statements
 *    and DAF development standards
 *
 */
package org.eclipse.lsp.cobol.core.hw.antlradapter;

import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.core.cst.base.CstNodeImpl;

/**
 * AntlrIsland node
 */
public class AntlrAdapted extends CstNodeImpl {
  private final ParserRuleContext ruleContext;

  public AntlrAdapted(ParserRuleContext ruleContext) {
    this.ruleContext = ruleContext;
  }

  public ParserRuleContext getRuleContext() {
    return ruleContext;
  }
}
