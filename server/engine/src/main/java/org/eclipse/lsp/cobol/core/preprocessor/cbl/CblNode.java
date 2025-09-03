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

import java.util.ArrayList;
import java.util.List;
import lombok.Getter;

/** CBL node */
@Getter
public class CblNode {
  private final List<CblNode> children;
  private final CblNodeTypes type;
  private final String uri;
  private final int line;
  private final int start;
  private final int end;

  public CblNode(String uri, int line, int start, int end, CblNodeTypes type) {
    this.start = start;
    this.end = end;
    this.line = line;
    this.uri = uri;
    this.children = new ArrayList<>();
    this.type = type;
  }

  public CblNode(List<CblNode> children, CblNodeTypes type) {
    this.uri = children.get(0).getUri();
    this.start = children.get(0).getStart();
    this.line = children.get(0).getLine();
    this.end = children.get(children.size() - 1).getEnd();
    this.children = children;
    this.type = type;
  }

  public CblNode(CblNode cblNode, CblNodeTypes cblNodeTypes) {
    this.uri = cblNode.getUri();
    this.start = cblNode.getStart();
    this.end = cblNode.getEnd();
    this.line = cblNode.getLine();
    this.children = new ArrayList<>();
    this.children.add(cblNode);
    this.type = cblNodeTypes;
  }

  @Override
  public String toString() {
    return "CblNode{"
        + "children="
        + children
        + ", type="
        + type
        + ", uri='"
        + uri
        + '\''
        + ", line="
        + line
        + ", start="
        + start
        + ", end="
        + end
        + '}';
  }

  /**
   * Creates the CBL node text
   *
   * @return CBL node text
   */
  public String getText() {
    StringBuilder sb = new StringBuilder();
    for (CblNode child : children) {
      sb.append(child.getText());
    }
    return sb.toString();
  }
}
