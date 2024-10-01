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
package org.eclipse.lsp.cobol.implicitDialects.cics.utility;

import lombok.experimental.UtilityClass;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp4j.Location;

import static org.eclipse.lsp.cobol.AntlrRangeUtils.constructRange;

/***
 * Utility class for CICS antlr visitor
 */
@UtilityClass
public class VisitorUtility {
  /**
   * Construct locality
   *
   * @param ctx
   * @param context
   * @return locality
   */
  public Locality constructLocality(ParserRuleContext ctx, DialectProcessingContext context) {
    Location location = context.getExtendedDocument().mapLocation(constructRange(ctx));
    return Locality.builder().uri(location.getUri()).range(location.getRange()).build();
  }

  /**
   * Construct Locality from a Terminal Node
   *
   * @param node
   * @param context
   * @return locality
   */
  public Locality constructLocality(TerminalNode node, DialectProcessingContext context) {
    Location location = context.getExtendedDocument().mapLocation(constructRange(node.getSymbol()));
    return Locality.builder().uri(location.getUri()).range(location.getRange()).build();
  }
}
