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
package org.eclipse.lsp.cobol.common.model.tree;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;

/** The class represents perform in COBOL. */
@ToString(callSuper = true)
@Getter
@EqualsAndHashCode(callSuper = true)
public class PerformNode extends Node {
  String targetName;
  String targetSectionName;
  String thruName;
  String thruSectionName;

  public PerformNode(Locality location) {
    super(location, NodeType.PERFORM);
    this.targetName = null;
    this.targetSectionName = null;
    this.thruName = null;
    this.thruSectionName = null;
  }

  public PerformNode(Locality location, String targetName, String targetSectionName, String thruName, String thruSectionName) {
    super(location, NodeType.PERFORM);
    this.targetName = targetName;
    this.targetSectionName = targetSectionName;
    this.thruName = thruName;
    this.thruSectionName = thruSectionName;
  }

  public boolean isInline() {
    return targetName == null && targetSectionName == null;
  }
}
