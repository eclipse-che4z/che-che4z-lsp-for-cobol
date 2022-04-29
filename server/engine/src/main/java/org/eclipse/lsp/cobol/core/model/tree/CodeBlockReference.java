/*
 * Copyright (c) 2022 Broadcom.
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

import lombok.Getter;
import org.eclipse.lsp4j.Location;

import java.util.ArrayList;
import java.util.List;

/** The class represents definitions and references for Section and Paragraphs name node in COBOL grammar. */
@Getter
public class CodeBlockReference {
  List<Location> definitions = new ArrayList<>();
  List<Location> usage = new ArrayList<>();

  void addUsage(Location location) {
    usage.add(location);
  }

  void addDefinition(Location location) {
    definitions.add(location);
  }
}
