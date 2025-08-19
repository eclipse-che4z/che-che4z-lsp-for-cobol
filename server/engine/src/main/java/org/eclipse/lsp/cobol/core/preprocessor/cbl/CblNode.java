/*
 * Copyright (c) 2025 Broadcom.
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
package org.eclipse.lsp.cobol.core.preprocessor.cbl;

import lombok.Getter;

import java.util.ArrayList;
import java.util.List;

/**
 * CBL node
 */
@Getter
public class CblNode {
  public static final String TYPE_UNKNOWN = "UNKNOWN";
  public static final String TYPE_XOPTS = "XOPTS";
  public static final String TYPE_CICS = "CICS";
  private final List<CblNode> children;
  private final String type;
  private final int start;
  private final int end;

  public CblNode(int start, int end) {
    this.start = start;
    this.end = end;
    this.children = new ArrayList<>();
    this.type = TYPE_UNKNOWN;
  }

  public CblNode(List<CblNode> children) {
    this.start = children.get(0).getStart();
    this.end = children.get(children.size() - 1).getEnd();
    this.children = children;
    this.type = TYPE_UNKNOWN;
  }

  public CblNode(List<CblNode> children, String type) {
    this.start = children.get(0).getStart();
    this.end = children.get(children.size() - 1).getEnd();
    this.children = children;
    this.type = type;
  }

  @Override
  public String toString() {
    return "CblNode{" +
            "children=" + children +
            ", start=" + start +
            ", end=" + end +
            '}';
  }
}
