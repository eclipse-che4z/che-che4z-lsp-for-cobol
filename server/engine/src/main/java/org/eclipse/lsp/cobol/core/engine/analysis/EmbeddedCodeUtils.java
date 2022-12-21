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
package org.eclipse.lsp.cobol.core.engine.analysis;

import lombok.experimental.UtilityClass;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.model.EmbeddedCode;
import org.eclipse.lsp.cobol.core.visitor.EmbeddedLanguagesListener;
import org.eclipse.lsp.cobol.core.visitor.ParserListener;

import java.util.Map;

@UtilityClass
public class EmbeddedCodeUtils {
  public Map<Token, EmbeddedCode> extractEmbeddedCode(
          ParserListener listener,
          CobolParser.StartRuleContext tree,
          MessageService messageService,
          ParseTreeListener treeListener) {

    EmbeddedLanguagesListener embeddedLanguagesListener = new EmbeddedLanguagesListener(messageService, treeListener, listener);
    new ParseTreeWalker().walk(embeddedLanguagesListener, tree);
    return embeddedLanguagesListener.getEmbeddedCodeParts();
  }
}
