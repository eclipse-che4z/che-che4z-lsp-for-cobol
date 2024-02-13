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
package org.eclipse.lsp.cobol.core.cst.base;

import lombok.Getter;
import org.eclipse.lsp.cobol.core.hw.GrammarRule;

import java.util.ArrayList;
import java.util.List;

/**
 * Basic implementation of CstNode
 */
@Getter
public class CstNodeImpl implements CstNode {
  private final List<CstNode> children = new ArrayList<>();

  @Override
  public GrammarRule getRule() {
    return null;
  }

  @Override
  public String toText() {
    StringBuilder sb = new StringBuilder();
    children.forEach(c -> sb.append(c.toText()));
    return sb.toString();
  }
}
