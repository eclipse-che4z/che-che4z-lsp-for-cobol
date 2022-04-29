/*
 * Copyright (c) 2021 Broadcom.
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
package org.eclipse.lsp.cobol.core.model.tree;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.model.Locality;

/** The class represents perform in COBOL. */
@ToString(callSuper = true)
@Getter
@EqualsAndHashCode(callSuper = true)
public class PerformNode extends Node {
  String section;
  String paragraph;

  public PerformNode(Locality location) {
    super(location, NodeType.PERFORM);
    this.section = null;
    this.paragraph = null;
  }

  public PerformNode(Locality location, String section, String paragraph) {
    super(location, NodeType.PERFORM);
    this.section = section;
    this.paragraph = paragraph;
  }

  public boolean isInline() {
    return paragraph == null && section == null;
  }
}
