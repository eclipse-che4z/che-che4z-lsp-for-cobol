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
package org.eclipse.lsp.cobol.service;

import org.eclipse.lsp.cobol.core.model.extendedapi.*;
import org.eclipse.lsp.cobol.core.model.tree.*;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.ArrayList;
import java.util.List;

/**
 * CF tree builder implementation
 */
public class CFASTBuilderImpl implements CFASTBuilder {
  private static final int SNIPPET_LENGTH = 10;
  //  IF statement without END_IF workaround. Should be removed after grammar fixed.
  private boolean needCloseIf;

  @Override
  public ExtendedApiResult build(Node rootNode) {
    ExtendedApiResult result = new ExtendedApiResult(new ArrayList<>());
    if (rootNode == null) {
      return result;
    }
    for (Node node : rootNode.getChildren()) {
      traverse((ProgramNode) node, result.getControlFlowAST());
    }
    return result;
  }

  private void traverse(CFASTNode parent, Node node) {
    if (node instanceof ParagraphNode) {
      Paragraph paragraph = new Paragraph(cutSnippet(((ParagraphNode) node).getText()),
              ((ParagraphNode) node).getName(),
              convertLocation(node));
      addChild(parent, paragraph);
      node.getChildren().forEach(child -> traverse(paragraph, child));
    } else if (node instanceof ProcedureSectionNode) {
      Section section = new Section(((ProcedureSectionNode) node).getName(),
              cutSnippet(((ProcedureSectionNode) node).getText()),
              convertLocation(node));
      addChild(parent, section);
      node.getChildren().forEach(child -> traverse(section, child));
    } else if (node instanceof GoToNode) {
      addChild(parent, new GoTo(((GoToNode) node).getTargets()));
    } else if (node instanceof EvaluateNode) {
      addChild(parent, new Evaluate());
      node.getChildren().forEach(child -> traverse(parent, child));
      addChild(parent, new EndEvaluate());
    } else if (node instanceof EvaluateWhenNode) {
      addChild(parent, new When());
    } else if (node instanceof IfNode) {
      addChild(parent, new If());
      node.getChildren().forEach(child -> traverse(parent, child));
      if (isIfHasEnd((IfNode) node)) {
        needCloseIf = false;
        addChild(parent, new EndIf());
      } else {
        needCloseIf = true;
      }
    } else if (node instanceof SentenceNode) {
      node.getChildren().forEach(child -> traverse(parent, child));
      if (needCloseIf) {
        addChild(parent, new EndIf());
        needCloseIf = false;
      }
    } else if (node instanceof IfElseNode) {
      addChild(parent, new ElseIf());
      node.getChildren().forEach(child -> traverse(parent, child));
    } else if (node instanceof PerformNode) {
      if (((PerformNode) node).isInline()) {
        addChild(parent, new InlinePerform());
        node.getChildren().forEach(child -> traverse(parent, child));
        addChild(parent, new EndInlinePerform());
      } else {
        addChild(parent, new Perform(((PerformNode) node).getParagraph(), ((PerformNode) node).getSection()));
      }
    } else if (node instanceof ExitNode || node instanceof GoBackNode || node instanceof StopNode) {
      addChild(parent, new Stop());
    }
  }

  private boolean isIfHasEnd(IfNode node) {
    return node.getIfStatementContext().END_IF() != null;
  }

  private void traverse(ProgramNode node, List<Program> programs) {
    node.getChildren().stream().filter(ProcedureDivisionNode.class::isInstance).findFirst().ifPresent(n -> {
      Program program = new Program(node.getProgramName(), convertLocation(n));
      n.getChildren().forEach(child -> traverse(program, child));
      traverse(program, n);
      programs.add(program);
    });
  }

  private void addChild(CFASTNode target, CFASTNode child) {
    if (target.getChildren() == null) {
      target.setChildren(new ArrayList<>());
    }
    target.getChildren().add(child);
  }

  private Location convertLocation(Node node) {
    final org.eclipse.lsp4j.Location location = node.getLocality().toLocation();
    final Range range = location.getRange();

    final Position startPosition = new Position();
    startPosition.setLine(range.getStart().getLine() + 1);
    startPosition.setCharacter(range.getStart().getCharacter() + 1);
    final Position endPosition = new Position();
    endPosition.setLine(range.getEnd().getLine() + 1);
    endPosition.setCharacter(range.getEnd().getCharacter() + 1);

    return new Location(location.getUri(), startPosition, endPosition);
  }

  private static String cutSnippet(String text) {
    String[] lines = text.split("\\r?\\n");
    StringBuilder sb = new StringBuilder();
    for (int i = 0; i < SNIPPET_LENGTH && i < lines.length; i++) {
      if (i > 0) {
        sb.append("\r\n");
      }
      sb.append(lines[i]);
    }
    return sb.toString();
  }
}
