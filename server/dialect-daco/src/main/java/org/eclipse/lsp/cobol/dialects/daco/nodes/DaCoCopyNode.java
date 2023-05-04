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
package org.eclipse.lsp.cobol.dialects.daco.nodes;

import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.dialects.daco.DaCoDialect;
import org.eclipse.lsp4j.Location;

/** Tree node that represents DaCo copybook related information */
@ToString(callSuper = true)
@Getter
public class DaCoCopyNode extends CopyNode {
  String layoutUsage;
  String suffix;

  int startingLevel;

  public DaCoCopyNode(Locality statementLocality, Location nameLocation, String layoutId, String layoutUsage, int startingLevel, String suffix, String uri) {
    super(statementLocality, nameLocation, layoutId, DaCoDialect.NAME, uri);
    this.layoutUsage = layoutUsage;
    this.suffix = suffix;
    this.startingLevel = startingLevel;
  }

  public String getParentSuffix() {
    return suffix;
  }
}
