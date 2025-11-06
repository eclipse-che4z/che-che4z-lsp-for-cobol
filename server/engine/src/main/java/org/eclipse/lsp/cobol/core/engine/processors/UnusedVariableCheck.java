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
package org.eclipse.lsp.cobol.core.engine.processors;

import com.google.common.collect.ImmutableList;
import java.util.List;
import org.eclipse.lsp.cobol.common.OutlineNodeNames;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.RootNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.ElementaryItemNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.GroupItemNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.MultiTableDataNameNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.StandAloneDataItemNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.TableDataNameNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.model.tree.variables.ConditionDataNameNode;
import org.eclipse.lsp.cobol.common.model.tree.variables.FileDescriptionNode;
import org.eclipse.lsp.cobol.common.model.tree.variables.RenameItemNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulator;
import org.eclipse.lsp4j.DiagnosticTag;

/** Generate diagnostics for unused variables */
public class UnusedVariableCheck implements Processor<RootNode> {
  SymbolAccumulator symbolAccumulator;
  ErrorSeverity severity;

  private static final List<DiagnosticTag> UNNECESSARY_TAGS =
      ImmutableList.of(DiagnosticTag.Unnecessary);

  public UnusedVariableCheck(SymbolAccumulator symbolAccumulator, ErrorSeverity severity) {
    this.symbolAccumulator = symbolAccumulator;
    this.severity = severity;
  }

  @Override
  public void accept(RootNode r, ProcessingContext ctx) {
    symbolAccumulator
        .getProgramSymbols()
        .forEach(
            (program, syms) -> {
              syms.getVariablesStream()
                  .filter(VariableNode.class::isInstance)
                  .map(VariableNode.class::cast)
                  .filter(varNode -> varNode.getUsages().isEmpty())
                  .filter(
                      varNode -> varNode.getLocality().getUri().equals(r.getLocality().getUri()))
                  .filter(UnusedVariableCheck::shouldReport)
                  .filter(v -> !OutlineNodeNames.FILLER_NAME.equals(v.getName()))
                  .filter(v -> !partOfExternal(v))
                  .map(
                      node ->
                          SyntaxError.syntaxError()
                              .errorSource(ErrorSource.PARSING)
                              .severity(severity)
                              .messageTemplate(MessageTemplate.of("analysis.unusedVariable"))
                              .tags(UNNECESSARY_TAGS)
                              .location(node.getLocality().toOriginalLocation())
                              .build())
                  .forEach(ctx.getErrors()::add);
            });
  }

  private static boolean shouldReport(VariableNode v) {
    if (v instanceof ElementaryItemNode) return essentiallyEmpty(v);
    if (v instanceof GroupItemNode) return !((GroupItemNode) v).isExternal() && essentiallyEmpty(v);
    if (v instanceof MultiTableDataNameNode) return essentiallyEmpty(v);
    if (v instanceof TableDataNameNode) return essentiallyEmpty(v);
    if (v instanceof StandAloneDataItemNode) return true;
    if (v instanceof ConditionDataNameNode) return true;
    if (v instanceof FileDescriptionNode) return true;
    if (v instanceof RenameItemNode) return essentiallyEmpty(v);
    return false;
  }

  private static boolean partOfExternal(VariableNode v) {
    return v.getNearestParent(UnusedVariableCheck::level1GroupItemNode)
        .map(GroupItemNode.class::cast)
        .map(GroupItemNode::isExternal)
        .orElse(false);
  }

  private static boolean level1GroupItemNode(Node n) {
    return n instanceof GroupItemNode && ((GroupItemNode) n).getLevel() == 1;
  }

  private static boolean essentiallyEmpty(VariableNode v) {
    final List<Node> children = v.getChildren();
    return children.size() <= 2 && children.stream().noneMatch(VariableNode.class::isInstance);
  }
}
