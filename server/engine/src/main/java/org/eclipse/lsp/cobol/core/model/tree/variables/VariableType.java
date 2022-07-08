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
package org.eclipse.lsp.cobol.core.model.tree.variables;

import lombok.Getter;
import org.eclipse.lsp.cobol.core.messages.MessageTemplate;

/**
 * Enumeration of variable node types. It describes only types that are related to the
 * level number or special definition clauses. They also contain a message template for
 * localization.
 */
public enum VariableType {
  CONDITION_DATA_NAME("variables.conditionName"),
  ELEMENTARY_ITEM("variables.elementaryItem"),
  GROUP_ITEM("variables.groupItem"),
  STAND_ALONE_DATA_ITEM("variables.independent"),
  INDEX_ITEM("variables.indexName"),
  MNEMONIC_NAME("variables.mnemonicName"),
  MULTI_TABLE_DATA_NAME("variables.tableDataName"),
  RENAME_ITEM("variables.renameItem"),
  TABLE_DATA_NAME("variables.tableDataName"),
  MAP_NAME("variables.mapName"),
  FD("variable.fdSd"),
  SD("variable.fdSd");

  @Getter private final MessageTemplate template;

  VariableType(String id) {
    template = MessageTemplate.of(id);
  }
}
