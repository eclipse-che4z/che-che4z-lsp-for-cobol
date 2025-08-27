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

import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.CompilerDirectiveNode;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSDialect;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.ArrayList;
import java.util.List;

/** CICS Options CBL AST Filter */
public class CicsFilter {
  /**
   * Create CBL line without understood CICS options
   * @param root - CBL AST root
   * @param directiveNodes - CICS translator options nodes sink
   * @param ariaA - ARIA A size
   * @return new CBL line
   */
  public String createFilteredLine(
      CblNode root, List<CompilerDirectiveNode> directiveNodes, int ariaA) {
    StringBuilder sb = new StringBuilder();
    reduce(root, directiveNodes, ariaA);
    if (root.getChildren().isEmpty()) {
      return "";
    }
    serialize(root, sb, 0, true);
    return sb.toString();
  }

  private static void reduce(CblNode cbl, List<CompilerDirectiveNode> directiveNodes, int ariaA) {
    List<CblNode> reduced = new ArrayList<>();
    if (cbl.getChildren().isEmpty()) {
      return;
    }
    for (CblNode child : cbl.getChildren()) {
      reduce(child, directiveNodes, ariaA);
      switch (child.getType()) {
        case CBL:
        case XOPTS:
        case CICS_CONTAINER:
          if (child.getChildren().stream().anyMatch(it -> !(it instanceof CblToken))) {
            reduced.add(child);
          }
          break;
        case LINECOUNT:
        case SPACE:
        case APOST:
        case QUOTE:
        case CBLCARD:
        case NOCBLCARD:
        case CICS:
        case FLAG:
        case COBOL2:
        case COBOL3:
        case CPSM:
        case NOCPSM:
        case DBCS:
        case DEBUG:
        case NODEBUG:
        case DLI:
        case EDF:
        case NOEDF:
        case EXCI:
        case FEPI:
        case NOFEPI:
        case LENGTH:
        case NOLENGTH:
        case LINKAGE:
        case NOLINKAGE:
        case NATLANG:
        case NUM:
        case NONUM:
        case OPTIONS:
        case NOOPTIONS:
        case SEQ:
        case NOSEQ:
        case SP:
        case SPIE:
        case NOSPIE:
        case SYSEIB:
        case VBREF:
        case NOVBREF:
          CblNode lastNode = child.getChildren().get(child.getChildren().size() - 1);
          boolean endsWithComma =
              lastNode instanceof CblToken
                  && ((CblToken) lastNode).getTokenType().equals(CblTokenType.COMMA);
          int endPos =
              endsWithComma
                  ? child.getChildren().get(child.getChildren().size() - 2).getEnd()
                  : child.getEnd();
          String text =
              endsWithComma
                  ? child.getText().substring(0, child.getText().length() - 1)
                  : child.getText();
          Range range =
              new Range(
                  new Position(child.getLine(), child.getStart() + ariaA),
                  new Position(child.getLine(), endPos + ariaA));
          Locality locality = Locality.builder().uri(child.getUri()).range(range).build();
          directiveNodes.add(new CompilerDirectiveNode(locality, text, CICSDialect.DIALECT_NAME));
          break;
        case UNKNOWN:
        case TOKEN:
        default:
          reduced.add(child);
          break;
      }
    }
    cbl.getChildren().clear();
    cbl.getChildren().addAll(reduced);
  }

  private static int serialize(CblNode cbl, StringBuilder sb, int pos, boolean needComma) {
    List<CblNode> children = cbl.getChildren();
    long count = children.stream().filter(it -> !(it instanceof CblToken)).count();
    for (int i = 0; i < children.size(); i++) {
      CblNode child = children.get(i);
      if (child instanceof CblToken) {
        sb.append(StringUtils.repeat(" ", child.getStart() - pos));
        if (i == children.size() - 1
            && ((CblToken) child).getTokenType() == CblTokenType.COMMA
            && !needComma) {
          sb.append(" ");
        } else {
          sb.append(child.getText());
        }
        pos = child.getEnd();
      } else {
        count--;
        pos = serialize(child, sb, pos, count > 0);
      }
    }
    if (pos != cbl.getEnd()) {
      sb.append(StringUtils.repeat(" ", cbl.getEnd() - pos));
      pos = cbl.getEnd();
    }
    return pos;
  }
}
