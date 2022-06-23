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

import java.util.ArrayList;
import java.util.List;

/**
 * An abstract class for code blocks, e.g. paragraphs or section in procedure division, defined in
 * the program
 */
@Getter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public abstract class CodeBlockDefinitionNode extends Node {
  String name;
  String text;
  Locality definition;
  List<Locality> usages = new ArrayList<>();

  CodeBlockDefinitionNode(
      Locality location, String name, String text, Locality definition, NodeType type) {
    super(location, type);
    this.name = name;
    this.text = text;
    this.definition = definition;
  }

  /**
   * Add a location of this code block usage
   *
   * @param usage - locality where this code block is referenced
   */
  public void addUsage(Locality usage) {
    usages.add(usage);
  }
}
