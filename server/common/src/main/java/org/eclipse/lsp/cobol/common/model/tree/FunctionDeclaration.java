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
package org.eclipse.lsp.cobol.common.model.tree;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;

import java.util.List;

/**
 * This class represents declaration of intrinsic function names or user-defined function names (in
 * the REPOSITORY paragraph), that may be used without specifying the keyword FUNCTION.
 */
@ToString(callSuper = true)
@Getter
@EqualsAndHashCode(callSuper = true)
public class FunctionDeclaration extends Node {
  private final boolean isIntrinsic;
  private final boolean declareAllIntrinsicFunctions;

  public FunctionDeclaration(
      Locality location, List<Node> functionNames, boolean isIntrinsic) {
    super(location, NodeType.FUNCTION_DECLARATION);
    this.isIntrinsic = isIntrinsic;
    this.declareAllIntrinsicFunctions = false;
    functionNames.forEach(this::addChild);
  }

  public FunctionDeclaration(Locality location) {
    super(location, NodeType.FUNCTION_DECLARATION);
    this.isIntrinsic = true;
    this.declareAllIntrinsicFunctions = true;
  }
}
