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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks;

import org.antlr.v4.runtime.RuleContext;
import org.eclipse.lsp.cobol.core.CobolParser.DataDescriptionEntryFormat1Context;
import org.eclipse.lsp.cobol.core.CobolParserBaseListener;

import static java.util.Optional.ofNullable;
import static org.eclipse.lsp.cobol.core.CobolParser.EntryNameContext;

/** This listener retrieves the name of the latest variable in the text */
public class LastVariableNameListener extends CobolParserBaseListener {
  private EntryNameContext lastVariableName = null;

  @Override
  public void exitDataDescriptionEntryFormat1(DataDescriptionEntryFormat1Context ctx) {
    lastVariableName = ctx.entryName();
  }

  public String getResult() {
    return ofNullable(lastVariableName)
        .map(RuleContext::getText)
        .map(String::toUpperCase)
        .orElse(null);
  }
}
