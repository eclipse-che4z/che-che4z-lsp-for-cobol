/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.analysis;

import com.google.common.collect.ImmutableList;
import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variable.QualifiedReferenceNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableUsageNode;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.List;

/**
 * Helper class for Db2SqlVisitor
 */
@UtilityClass
class Db2SqlVisitorHelper {

  public boolean isGroupName(String name) {
    return name.contains(".");
  }

  public String[] splitNames(String name) {
    return name.split("\\.");
  }

  public Range[] splitRange(Range range, String[] names) {
    Range[] result = new Range[names.length];
    int pos = range.getStart().getCharacter();
    int line = range.getStart().getLine();
    for (int i = 0; i < names.length; i++) {
      result[i] = new Range(new Position(line, pos), new Position(line, pos + names[i].length()));
      pos += names[i].length() + 1;
    }
    return result;
  }

  public List<Node> generateGroupNodes(String name, Locality locality) {
    String[] names = splitNames(name);
    Range[] ranges = splitRange(locality.getRange(), names);

    QualifiedReferenceNode groupNode = new QualifiedReferenceNode(locality);
    for (int i = ranges.length - 1; i >= 0; i--) {
      Locality nodeLocality = locality.toBuilder().range(ranges[i]).build();
      groupNode.addChild(new VariableUsageNode(names[i], nodeLocality));
    }
    return ImmutableList.of(groupNode);
  }
}
