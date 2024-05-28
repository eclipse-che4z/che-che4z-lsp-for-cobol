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
package org.eclipse.lsp.cobol.cst.procedure;

import lombok.Getter;
import lombok.Setter;
import org.eclipse.lsp.cobol.cst.base.CstNodeImpl;
import org.eclipse.lsp.cobol.parser.hw.lexer.Token;

/**
 * ProcedureDivision node.
 */
public class ProcedureDivision extends CstNodeImpl {
  // TODO: im now sure that keeping a start token of procedure division body is a good idea.
  @Getter @Setter
  Token bodyStartToken;
}
