/*
 * Copyright (c) 2024 Broadcom.
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

package org.eclipse.lsp.cobol.implicitDialects.sql.node;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.implicitDialects.sql.Db2SqlDialect;

/** EXEC CICS block node */
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
@Getter
public class ExecSqlWheneverNode extends Node {

  private final WheneverConditionType wheneverConditionType;
  private final WheneverType wheneverType;
  private final String value;

  /** Represents a condition clause type of the EXEC SQL WHENEVER statement **/
  public enum WheneverConditionType {
    NOT_FOUND,
    SQLERROR,
    SQLWARNING
  }

  /** Represents a verb clause type of the EXEC SQL WHENEVER statement **/
  public enum WheneverType {
    CONTINUE,
    GOTO,
    DO
  }

  public ExecSqlWheneverNode(Locality location,
                             WheneverConditionType wheneverConditionType,
                             WheneverType wheneverType,
                             String value) {
    super(location, NodeType.STATEMENT, Db2SqlDialect.DIALECT_NAME);
    this.wheneverConditionType = wheneverConditionType;
    this.wheneverType = wheneverType;
    this.value = value;
  }
}
